#include <stdio.h>
#include <stdlib.h>
#include "hmmaccel.h"

#define MCR_SIZE 3


void standalone_hmm(unsigned int type,float input1[4],float input2[3], float tran_mat[3][3], float tem[3],float out[6])
{
hmm_hw<float,int,3>(type,input1, input2,tran_mat, tem, out);

}


void HLS_hmm(AXI_VAL INPUT_STREAM[6*MCR_SIZE+2], AXI_VAL OUTPUT_STREAM[2*MCR_SIZE])
{
#pragma HLS INTERFACE s_axilite port=return     bundle=CONTROL_BUS
#pragma HLS INTERFACE axis      port=OUTPUT_STREAM
#pragma HLS INTERFACE axis      port=INPUT_STREAM
        wrapped_hmm_hw <float,int,3,4,4,5,5>(INPUT_STREAM, OUTPUT_STREAM);
	

	return;
}
