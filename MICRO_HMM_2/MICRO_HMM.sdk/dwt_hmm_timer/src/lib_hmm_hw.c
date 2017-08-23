#include "platform.h"
#include "xparameters.h"
#include "xscugic.h"
#include "xaxidma.h"
#include "xhls_hmm.h"
#include "lib_hmm_hw.h"
#include "xil_printf.h"

XHls_hmm hmm_dev;
volatile static int RunExample = 0;
volatile static int ResultExample = 0;

XHls_hmm_Config hmm_config={
	0,
	 XPAR_HLS_HMM_0_S_AXI_CONTROL_BUS_BASEADDR
};

XScuGic ScuGic;

extern XAxiDma AxiDma;

int XhmmSetup(){
	return XHls_hmm_CfgInitialize(&hmm_dev,&hmm_config);
}

void XhmmStart(void *InstancePtr){
	XHls_hmm *pExample = (XHls_hmm *)InstancePtr;
	XHls_hmm_InterruptEnable(pExample,1);
	XHls_hmm_InterruptGlobalEnable(pExample);
	XHls_hmm_Start(pExample);
}

void XhmmIsr(void *InstancePtr){
	XHls_hmm *pExample = (XHls_hmm *)InstancePtr;

	//Disable the global interrupt
	XHls_hmm_InterruptGlobalDisable(pExample);
	//Disable the local interrupt
	XHls_hmm_InterruptDisable(pExample,0xffffffff);

	// clear the local interrupt//check the mask value
	XHls_hmm_InterruptClear(pExample,1);

	ResultExample = 1;
	// restart the core if it should run again
	if(RunExample){
		XHls_hmm_Start(pExample);
	}
}

int XhmmSetupInterrupt()
{
	//This functions sets up the interrupt on the ARM
	int result;
	XScuGic_Config *pCfg = XScuGic_LookupConfig(XPAR_SCUGIC_SINGLE_DEVICE_ID);
	if (pCfg == NULL){
		print("Interrupt Configuration Lookup Failed\n\r");
		return XST_FAILURE;
	}
	result = XScuGic_CfgInitialize(&ScuGic,pCfg,pCfg->CpuBaseAddress);
	if(result != XST_SUCCESS){
		return result;
	}
	// self test
	result = XScuGic_SelfTest(&ScuGic);
	if(result != XST_SUCCESS){
		return result;
	}
	// Initialize the exception handler
	Xil_ExceptionInit();
	// Register the exception handler
	//print("Register the exception handler\n\r");
	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,(Xil_ExceptionHandler)XScuGic_InterruptHandler,&ScuGic);
	//Enable the exception handler
	Xil_ExceptionEnable();
	// Connect the Adder ISR to the exception table
	//print("Connect the Adder ISR to the Exception handler table\n\r");
	                                 
	result = XScuGic_Connect(&ScuGic,XPAR_FABRIC_HLS_HMM_0_INTERRUPT_INTR,(Xil_InterruptHandler)XhmmIsr,&hmm_dev);
	if(result != XST_SUCCESS){
		return result;
	}
	//print("Enable the Adder ISR\n\r");
	XScuGic_Enable(&ScuGic,XPAR_FABRIC_HLS_HMM_0_INTERRUPT_INTR);
	return XST_SUCCESS;
}


int Setup_HW_hmm(const unsigned int *type,float ip1[SIZE],float ip2[NOS] ,float t_mat[NOS][NOS],float emi_col[NOS], float res_hw[2*NOS])
//Setup the Vivado HLS Block
{
	int status = XhmmSetup();
	if(status != XST_SUCCESS){
		print("Error: example setup failed\n");
		return XST_FAILURE;
	}
	status =  XhmmSetupInterrupt();
	if(status != XST_SUCCESS){
		print("Error: interrupt setup failed\n");
		return XST_FAILURE;
	}
	//XHls_accel_core_SetVal1(&xmmult_dev,val1);
	//XHls_accel_core_SetVal2(&xmmult_dev,val2);
	XhmmStart(&hmm_dev);

	//flush the cache
	Xil_DCacheFlushRange((unsigned int)type,1);
	Xil_DCacheFlushRange((unsigned int)ip1,SIZE);
	Xil_DCacheFlushRange((unsigned int)ip2,NOS);
	Xil_DCacheFlushRange((unsigned int)t_mat,(NOS*NOS));
	Xil_DCacheFlushRange((unsigned int)emi_col,NOS);
	Xil_DCacheFlushRange((unsigned int)res_hw,2*NOS);
	//print("\rCache cleared\n\r");

	return 0;
}

void Start_HW_hmm(void)
{
	int status = XhmmSetup();
	if(status != XST_SUCCESS){
		print("Error: example setup failed\n");
		return XST_FAILURE;
	}
	status =  XhmmSetupInterrupt();
	if(status != XST_SUCCESS){
		print("Error: interrupt setup failed\n");
		return XST_FAILURE;
	}
	//XHls_accel_core_SetVal1(&xmmult_dev,val1);
	//XHls_accel_core_SetVal2(&xmmult_dev,val2);
	XhmmStart(&hmm_dev);
}

int Run_HW_hmm(const unsigned int *type,float ip1[SIZE],float ip2[NOS] ,float t_mat[NOS][NOS],float emi_col[NOS], float res_hw[2*NOS])
{
	//transfer ip to the Vivado HLS block
	int status = XAxiDma_SimpleTransfer(&AxiDma, (unsigned int)type,sizeof(unsigned int), XAXIDMA_DMA_TO_DEVICE);
	if (status != XST_SUCCESS) {
		//print("Error: DMA transfer to Vivado HLS block failed\n");
		return XST_FAILURE;
	}
	/* Wait for transfer to be done */
	while (XAxiDma_Busy(&AxiDma, XAXIDMA_DMA_TO_DEVICE)) ;

	//transfer ip to the Vivado HLS block
	status = XAxiDma_SimpleTransfer(&AxiDma, (unsigned int) ip1,sizeof(float)* SIZE, XAXIDMA_DMA_TO_DEVICE);
	if (status != XST_SUCCESS) {
		//print("Error: DMA transfer to Vivado HLS block failed\n");
		return XST_FAILURE;
	}
	/* Wait for transfer to be done */
	while (XAxiDma_Busy(&AxiDma, XAXIDMA_DMA_TO_DEVICE)) ;

	//transfer ip to the Vivado HLS block
	status = XAxiDma_SimpleTransfer(&AxiDma, (unsigned int) ip2,sizeof(float)* NOS, XAXIDMA_DMA_TO_DEVICE);
	if (status != XST_SUCCESS) {
		//print("Error: DMA transfer to Vivado HLS block failed\n");
		return XST_FAILURE;
	}
	/* Wait for transfer to be done */
	while (XAxiDma_Busy(&AxiDma, XAXIDMA_DMA_TO_DEVICE)) ;

	//transfer t_mat to the Vivado HLS block
	status = XAxiDma_SimpleTransfer(&AxiDma, (unsigned int) t_mat, sizeof(float)*(NOS*NOS), XAXIDMA_DMA_TO_DEVICE);
	if (status != XST_SUCCESS) {
		//print("Error: DMA transfer to Vivado HLS block failed\n");
		return XST_FAILURE;
	}
	/* Wait for transfer to be done */
	while (XAxiDma_Busy(&AxiDma, XAXIDMA_DMA_TO_DEVICE)) ;
	//transfer emi_col to the Vivado HLS block
	status = XAxiDma_SimpleTransfer(&AxiDma, (unsigned int) emi_col,sizeof(float)* NOS, XAXIDMA_DMA_TO_DEVICE);
	if (status != XST_SUCCESS) {
		//print("Error: DMA transfer to Vivado HLS block failed\n");
		return XST_FAILURE;
	}
	/* Wait for transfer to be done */
	while (XAxiDma_Busy(&AxiDma, XAXIDMA_DMA_TO_DEVICE)) ;

	//get results from the Vivado HLS block
	status = XAxiDma_SimpleTransfer(&AxiDma, (unsigned int) res_hw,sizeof(float)* (2*NOS),
			XAXIDMA_DEVICE_TO_DMA);
	if (status != XST_SUCCESS) {
		//print("Error: DMA transfer from Vivado HLS block failed\n");
		return XST_FAILURE;
	}
	/* Wait for transfer to be done */
	while (XAxiDma_Busy(&AxiDma, XAXIDMA_DMA_TO_DEVICE)) ;

	//poll the DMA engine to verify transfers are complete
	/* Waiting for data processing */
	/* While this wait operation, the following action would be done
	 * First: Second matrix will be sent.
	 * After: Multiplication will be compute.
	 * Then: Output matrix will be sent from the accelerator to DDR and
	 * it will be stored at the base address that you set in the first SimpleTransfer
	 */
	while ((XAxiDma_Busy(&AxiDma, XAXIDMA_DEVICE_TO_DMA)) || (XAxiDma_Busy(&AxiDma, XAXIDMA_DMA_TO_DEVICE))) ;

//	while (!ResultExample)
//		print("Waiting for core to finish\n\r");

	return 0;

}



//DWT needed functions


