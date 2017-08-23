/******************************************************************************
*
* Copyright (C) 2009 - 2014 Xilinx, Inc.  All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* Use of the Software is limited solely to applications:
* (a) running on a Xilinx device, or
* (b) that interact with a Xilinx device through a bus or interconnect.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
* XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
* OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*
* Except as contained in this notice, the name of the Xilinx shall not be used
* in advertising or otherwise to promote the sale, use or other dealings in
* this Software without prior written authorization from Xilinx.
*
******************************************************************************/

/*
 * helloworld.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */

#include <stdio.h>
#include <stdlib.h>
#include "platform.h"
#include "xparameters.h"
#include "xaxidma.h"
#include "lib_hmm_hw.h"


#define NUM_TESTS 128
#define NOS       3
#define SIZE      4
#define NOE       8
#define ILEN     1024
#define CLEN     30

// AXI DMA Instance
XAxiDma AxiDma;

int init_dma(){
	XAxiDma_Config *CfgPtr;
	int status;

	CfgPtr = XAxiDma_LookupConfig( (XPAR_AXI_DMA_0_DEVICE_ID) );
	if(!CfgPtr){
		print("Error looking for AXI DMA config\n\r");
		return XST_FAILURE;
	}
	status = XAxiDma_CfgInitialize(&AxiDma,CfgPtr);
	if(status != XST_SUCCESS){
		print("Error initializing DMA\n\r");
		return XST_FAILURE;
	}
	//check for scatter gather mode
	if(XAxiDma_HasSg(&AxiDma)){
		print("Error DMA configured in SG mode\n\r");
		return XST_FAILURE;
	}

	/* Disable interrupts, we use polling mode */
	XAxiDma_IntrDisable(&AxiDma, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DEVICE_TO_DMA);
	XAxiDma_IntrDisable(&AxiDma, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DMA_TO_DEVICE);

	// Reset DMA
	XAxiDma_Reset(&AxiDma);
	while (!XAxiDma_ResetIsDone(&AxiDma)) {}

	return XST_SUCCESS;
}


int main(int argc, char **argv)
{
	const unsigned int forward=1;
	const unsigned int backward=0;
	int i, j, k;
	int err=0;
	int status;
	int whole;
	int thousandths;
	float ip1[SIZE];
	float ip2[NOS];
	float in[ILEN];
	float in1[ILEN/2];
	float in2[ILEN/4];
	float t_mat[NOS][NOS]={0.9440,0.0395,0.0165,
        		           0.0759,0.9241,0,
				           0.2191,0,0.7809};
	float emmision[NOS][NOE]={0.9595,0.0405,0,0,0,0,0,0,
	                        0.6017,0.3308,0,0,0,0.0596,0,0,
	                        0,0.2776,0,0,0,0.3215,0,0.4009};
	float hcoef[CLEN]={0.00021208083980379,0.000358589687895738,-0.00217823635810902,-0.00415935878138605,0.0101311175198498,0.0234081567858392,-0.0281680289709364,-0.0919200105596962,	0.0520431631762438,0.421566206690852,-0.774289603652956,0.437991626171837,0.0620359639629036,-0.105574208703339,-0.0412892087501817,0.0326835742671118,	0.0197617789425726,-0.00916423116248185,-0.00676418544805308,0.00243337321265767,0.00166286370201308,-0.000638131343045111,-0.000302259581813063,0.000140541149702034,	4.13404322725125e-05,-2.13150268099558e-05,-3.73465517514140e-06,2.06376185136468e-06,1.67442885768230e-07,-9.51765727381917e-08};
	float lcoef[CLEN]={-9.51765727381917e-08,-1.67442885768230e-07,2.06376185136468e-06,3.73465517514140e-06,-2.13150268099558e-05,-4.13404322725125e-05,0.000140541149702034,	0.000302259581813063,-0.000638131343045111,-0.00166286370201308,0.00243337321265767,0.00676418544805308,-0.00916423116248185,-0.0197617789425726,0.0326835742671118,	0.0412892087501817,-0.105574208703339,-0.0620359639629036,0.437991626171837,0.774289603652956,0.421566206690852,-0.0520431631762438,-0.0919200105596962,0.0281680289709364,	0.0234081567858392,-0.0101311175198498,-0.00415935878138605,0.00217823635810902,0.000358589687895738,-0.000212080839803798};
	float fw_seq[NOS][NUM_TESTS+1];
	float bw_seq[NOS][NUM_TESTS+1];
	float OutL[1053];
	float OutH[1053];
	float OutL1[270];
	float OutH1[270];
	float OutL2[142];
	float OutH2[142];
	float dwt_out[128];
	float scaler[NUM_TESTS+1];
	float emi_col[NOS];
	float res_hw[2*NOS];
	//float res_sw[SIZE]={0.974431,0.025568,0.000000 };
	fw_seq [0][0]=1;
	fw_seq [1][0]=0;
	fw_seq [2][0]=0;
	scaler[0]=1;
	bw_seq [0][NUM_TESTS]=1;
	bw_seq [1][NUM_TESTS]=1;
	bw_seq [2][NUM_TESTS]=1;





	/*init_platform();
	print("Starting Algorithm \r \n");
     dwt(in,lcoef,hcoef,ILEN,CLEN,OutL,OutH);
	for(i=0;i<ILEN/2;i++)
	in1[i]=OutL[i+7];
	dwt(in1,lcoef,hcoef,ILEN/2,CLEN,OutL1,OutH1);
	for(i=0;i<ILEN/4;i++)
	in2[i]=OutL1[i+7];
	dwt(in2,lcoef,hcoef,ILEN/4,CLEN,OutL2,OutH2);
	for(i=0;i<ILEN/8;i++)
	dwt_out[i]=OutL1[i+7];
	//cleanup_platform();

	//512
	//
	//256
	//
	//128*/
	//init_platform();
	//
	init_platform();
	for(i=0;i<ILEN;i++)
		    	in[i]=(float)(i+1);
	dwt(in,lcoef,hcoef,ILEN,CLEN,OutL,OutH);
	xil_printf("\r ***************************************************************\n\r");
	xil_printf("\r FP 32x32 FW APOSTERIOR Probability -> AXI DMA -> ARM ACP       \n\r");
	xil_printf("\r XAPP1170 redesigned with Vivado + HLS + IP Integrator 2015.2.1 \n\r");
	xil_printf("\r ***************************************************************\n\n\r");

//    for (i = 0; i<10; i++)
//    	print("\nHello World\n\r");

	/* ******************************************************************************* */
	// Init DMA
	status = init_dma();
	if(status != XST_SUCCESS){
		print("\rError: DMA init failed\n");
		return XST_FAILURE;
	}
	print("\r\nDMA Init done\n\r");


	/* ******************************************************************************* */
	/** End of Initiation */

		/* ******************************************************************************* */
		// call the HW accelerator
		// Setup the HW Accelerator


			for (i = 0; i < NUM_TESTS; i++) {
				                ip1[0]=1;
								ip1[1]=0;
								ip1[2]=0;
								ip1[3]=0;
								ip2[0]=0;
								ip2[1]=0;
								ip2[2]=0;
								emi_col[0]=0.9595;
								emi_col[1]=0.6017;
								emi_col[2]=0;
			    Setup_HW_hmm(&forward,ip1,ip2,t_mat,emi_col,res_hw);
				Start_HW_hmm();
				Run_HW_hmm(&forward,ip1,ip2,t_mat,emi_col,res_hw);
			}
			xil_printf("Finished Hardware Computation.\r\n");
			for (j = 0; j < 6; j++){
							whole=res_hw[j];
							thousandths=(res_hw[j]-whole)*1000;
							xil_printf("%d.%3d \n",whole,thousandths);
							}


		for (i = 0; i < NUM_TESTS; i++) {
			        ip1[0]=1;
					ip1[1]=1;
					ip1[2]=1;
					ip1[3]=0.876494;
					ip2[0]=0.865760;
					ip2[1]=0.13420;
					ip2[2]=0;
					emi_col[0]=0.9595;
					emi_col[1]=0.6017;
					emi_col[2]=0;
				Setup_HW_hmm(&backward,ip1,ip2,t_mat,emi_col,res_hw);
			Start_HW_hmm();
			Run_HW_hmm(&backward,ip1,ip2,t_mat,emi_col,res_hw);
		}
		xil_printf("Finished Hardware Computation.\r\n");

		/* ******************************************************************************* */
		//Compare the results from sw and hw
			for (j = 0; j < 6; j++){
				whole=res_hw[j];
				thousandths=(res_hw[j]-whole)*1000;
				xil_printf("%d.%3d \n",whole,thousandths);
				}


	if (err == 0)
		print("\rSW and HW results match!\n\r");
	else
		print("\rERROR: results mismatch\n\r");


    cleanup_platform();
    return 0;
}
