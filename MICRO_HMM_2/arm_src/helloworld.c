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
void ppd_extend(float *in,int inLen,int cLen,int oLen,float *out)
{
  int i,j,append;
  append=cLen-1;
   if(oLen!=(inLen+2*append))
   {
     print("Output length doesn't match the requirement \r \n");
      return;
    }

  for(j=0,i=(inLen-append);i<inLen;i++,j++)
    {
     out[j]=in[i];
    }
   for(i=0;i<inLen;i++,j++)
    {
     out[j]=in[i];
    }
   for(i=0;i<append;i++,j++)
    {
     out[j]=in[i];
    }
return;
}


void conv1d(float *x,float *coef,int xLen, int cLen,int oLen,float *out)
{
int i,j,disgard;
float temp;
 float temp_x[xLen+cLen-1];
  float temp_coef[xLen+cLen-1];
  float temp_out[xLen+cLen-1];
  if(oLen!=(xLen-cLen+1))
   {
     print("Output length doesn't match the requirement \r \n");
      return;
    }
//Append Zeros

  for(i=0;i<xLen;i++)
    temp_x[i]=*((float *)x+i);
  for(i=xLen;i<oLen;i++)
    temp_x[i]=0;

  for(i=0;i<cLen;i++)
    temp_coef[i]=*((float *)coef+i);
  for(i=cLen;i<oLen;i++)
    temp_coef[i]=0;

  disgard=cLen-1;
//computing convoution
   for(i=0;i<(xLen+cLen-1);i++)
   {
     temp=0;
     for(j=i;j>=0;j--)
       temp+=(temp_x[j]*temp_coef[i-j]);
       temp_out[i]=temp;
   }
//discarding first cLen-1 and last cLen-1 tempout
   for(i=disgard;i<((xLen+cLen-1)-disgard);i++)
   {
     out[i-disgard]=temp_out[i];
   }

return;
}

void subsampling(float *in,int first,int last,float *out)
{
int i,j;

for(j=0,i=(first-1);i<last;i+=2,j++)
    {
     *((float *)out+j)=*((float *)in+i);
    }
return;
}


void dwt(float *input,float *coeflin,float *coefhin,int inLen,int cLen,float *loutput,float *houtput)
{
int apLen=inLen+2*(cLen-1);
int convLen=inLen+cLen-1;
int first=2;
float eO[apLen];
float temphout[convLen];
float templout[convLen];
ppd_extend(input,inLen,cLen,apLen,eO);
conv1d(eO,coeflin,apLen,cLen,convLen,templout);
conv1d(eO,coefhin,apLen,cLen,convLen,temphout);
subsampling(templout,first,convLen,loutput);
subsampling(temphout,first,convLen,houtput);
print("finished dwt \r \n");
return;
}


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
	int sequence[NUM_TESTS]={1,1,1,1,1,2,2,2,2,6,1,2,1,1,1,2,2,6,2,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,1,1,2,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,	1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,6,8,8,8,2,1,1,1,1,1,1,2,1,1,1,1};
	int i, j, k;
	int status;
	float ip1[SIZE];
	float ip2[NOS];
	float in[ILEN];
	float in1[ILEN/2];
	float in2[ILEN/4];
	float res_hw[2*NOS];
	float fw_seq[NOS][NUM_TESTS+1];
    float bw_seq[NOS][NUM_TESTS+1];
	float scaler[NUM_TESTS+1];
	float t_mat[NOS][NOS]={0.9440,0.0395,0.0165,
        		           0.0759,0.9241,0,
				           0.2191,0,0.7809};
	float emmision[NOS][NOE]={0.9595,0.0405,0,0,0,0,0,0,
	                        0.6017,0.3308,0,0,0,0.0596,0,0,
	                        0,0.2776,0,0,0,0.3215,0,0.4009};
	float hcoef[CLEN]={0.00021208083980379,0.000358589687895738,-0.00217823635810902,-0.00415935878138605,0.0101311175198498,0.0234081567858392,-0.0281680289709364,-0.0919200105596962,	0.0520431631762438,0.421566206690852,-0.774289603652956,0.437991626171837,0.0620359639629036,-0.105574208703339,-0.0412892087501817,0.0326835742671118,	0.0197617789425726,-0.00916423116248185,-0.00676418544805308,0.00243337321265767,0.00166286370201308,-0.000638131343045111,-0.000302259581813063,0.000140541149702034,	4.13404322725125e-05,-2.13150268099558e-05,-3.73465517514140e-06,2.06376185136468e-06,1.67442885768230e-07,-9.51765727381917e-08};
	float lcoef[CLEN]={-9.51765727381917e-08,-1.67442885768230e-07,2.06376185136468e-06,3.73465517514140e-06,-2.13150268099558e-05,-4.13404322725125e-05,0.000140541149702034,	0.000302259581813063,-0.000638131343045111,-0.00166286370201308,0.00243337321265767,0.00676418544805308,-0.00916423116248185,-0.0197617789425726,0.0326835742671118,	0.0412892087501817,-0.105574208703339,-0.0620359639629036,0.437991626171837,0.774289603652956,0.421566206690852,-0.0520431631762438,-0.0919200105596962,0.0281680289709364,	0.0234081567858392,-0.0101311175198498,-0.00415935878138605,0.00217823635810902,0.000358589687895738,-0.000212080839803798};
	float OutL[541];
	float OutH[541];
	float OutL1[270];
	float OutH1[270];
	float OutL2[142];
	float OutH2[142];
	float dwt_out[128];
	float emi_col[NOS];

	//float res_sw[SIZE]={0.974431,0.025568,0.000000 };

	for(i=0;i<ILEN;i++)
			    	in[i]=(float)(i+1);


	init_platform();
    dwt(in,lcoef,hcoef,ILEN,CLEN,OutL,OutH);
	for(i=0;i<ILEN/2;i++)
	in1[i]=OutL[i+7];
	dwt(in1,lcoef,hcoef,ILEN/2,CLEN,OutL1,OutH1);
	for(i=0;i<ILEN/4;i++)
	in2[i]=OutL1[i+7];
	dwt(in2,lcoef,hcoef,ILEN/4,CLEN,OutL2,OutH2);
	for(i=0;i<ILEN/8;i++)
	dwt_out[i]=OutL1[i+7];
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

	    fw_seq [0][0]=1;
		fw_seq [1][0]=0;
		fw_seq [2][0]=0;
		scaler[0]=1;
		bw_seq [0][NUM_TESTS]=1;
		bw_seq [1][NUM_TESTS]=1;
		bw_seq [2][NUM_TESTS]=1;
			for (i = 0; i < NUM_TESTS; i++) {
				            k=sequence[i]-1;
				                ip1[0]=1;
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
				/*fw_seq[0][i+1]=res_hw[0];
				fw_seq[1][i+1]=res_hw[1];
				fw_seq[2][i+1]=res_hw[2];
				scaler[i+1]=res_hw[3];*/
			}
			xil_printf("Finished Hardware Computation.\r\n");
			for (j = 0; j <6; j++){
							printf("%f ;",res_hw[j]);
							}

			printf("\n");
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
									printf("%f ;",res_hw[j]);
									}

					printf("\n");


    cleanup_platform();
    return 0;
}
