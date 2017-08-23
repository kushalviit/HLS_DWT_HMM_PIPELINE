#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <ap_axi_sdata.h>

#define MCR_SIZE 3


typedef ap_axiu<32,4,5,5> AXI_VAL;

void standalone_hmm(unsigned int type,float input1[4],float input2[3], float tran_mat[3][3], float tem[3],float out[6]);
void HLS_hmm(AXI_VAL INPUT_STREAM[6*MCR_SIZE+2], AXI_VAL OUTPUT_STREAM[2*MCR_SIZE]);


template <typename T, int NOS>
void hmmfw_ref(T input1[NOS+1], T tran_mat[NOS][NOS], T tem[NOS],T out[2*NOS])
{
int j,k;
T prod[NOS][NOS];
T sum[NOS];
T temp_out[NOS];
T temp;
  
for(j=0;j<NOS;j++)
for(k=0;k<NOS;k++)
prod[k][j]=input1[k]*tran_mat[k][j];

temp=0;
for(j=0;j<NOS;j++)
{
 sum[j]=prod[0][j]+prod[1][j]+prod[2][j];
}

for(j=0;j<NOS;j++)
{
 temp_out[j]=sum[j]*tem[j];
}

for(j=0;j<NOS;j++)
temp+=temp_out[j];

for(j=0;j<NOS;j++)
out[j]=temp_out[j]/temp;


out[NOS]=temp;
out[4]=0;
out[5]=0;

return;

}
template <typename T, int NOS>
void hmmbw_ref(T input1[NOS+1], T input2[NOS],T tran_mat[NOS][NOS], T tem[NOS],T out[2*NOS])
{
int j,k;
T prod1[NOS][NOS];
T sum1[NOS];
T temp_out[NOS];
T scale=input1[NOS];


for(j=0;j<NOS;j++)
for(k=0;k<NOS;k++)
prod1[k][j]=tran_mat[j][k]*input1[k]*tem[k];

for( j=0;j<NOS;j++)
 sum1[j]=prod1[0][j]+prod1[1][j]+prod1[2][j];

for(j=0;j<NOS;j++)
temp_out[j]=sum1[j]/scale;

for(j=NOS;j<2*NOS;j++)
out[j]=temp_out[j-NOS];

for(j=0;j<NOS;j++)
out[j]=input1[j]*input2[j];


return;

}

template <typename T,typename T1, int NOS>
void hmm_ref(T1 type,T input1[NOS+1], T input2[NOS],T tran_mat[NOS][NOS], T tem[NOS],T out[2*NOS])
{

    switch((unsigned int)type)
    {
      case 0:hmmbw_ref<T,NOS>(input1, input2,tran_mat,tem,out);
              break;
      case 1:hmmfw_ref<T,NOS>(input1, tran_mat, tem,out);
              break;
    }
}

template <typename T, int NOS>
void hmmfw_hw(T input1[NOS], T tran_mat[NOS][NOS], T tem[NOS],T out[2*NOS])
{

#pragma HLS INLINE
	//#pragma HLS array_partition variable=input block factor=3 dim=1
	//#pragma HLS array_partition variable=tran_mat block factor=3 dim=2
        //#pragma HLS array_partition variable=tem block factor=3 dim=1
        


int j,k;
T prod[NOS][NOS];
T sum[NOS];
T temp_out[NOS];
T temp;
  
L1:for(j=0;j<NOS;j++)

#pragma HLS PIPELINE
L2:for(k=0;k<NOS;k++)
{
#pragma HLS PIPELINE
	prod[k][j]=input1[k]*tran_mat[k][j];

}

temp=0;
L3:for(j=0;j<NOS;j++)
{
#pragma HLS PIPELINE
 sum[j]=prod[0][j]+prod[1][j]+prod[2][j];
}

L4:for(j=0;j<NOS;j++)
{
#pragma HLS PIPELINE
 temp_out[j]=sum[j]*tem[j];

}

L5:for(j=0;j<NOS;j++)

#pragma HLS PIPELINE
temp+=temp_out[j];



L6:for(j=0;j<NOS;j++)
{
#pragma HLS PIPELINE
out[j]=temp_out[j]/temp;

}

out[NOS]=temp;
out[4]=0;
out[5]=0;

return;

}

template <typename T, int NOS>
void hmmbw_hw(T input1[NOS+1], T input2[NOS],T tran_mat[NOS][NOS], T tem[NOS],T out[2*NOS])
{

#pragma HLS INLINE
int j,k;
T prod1[NOS][NOS];
T sum1[NOS];
T temp_out[NOS];
T scale=input1[NOS];
out[NOS]=(float)0;
B1:for(j=0;j<NOS;j++)

#pragma HLS PIPELINE
B2:for(k=0;k<NOS;k++)

#pragma HLS PIPELINE
prod1[k][j]=tran_mat[j][k]*input1[k]*tem[k];

B3:for( j=0;j<NOS;j++)

#pragma HLS PIPELINE
sum1[j]=prod1[0][j]+prod1[1][j]+prod1[2][j];

B5:for(j=0;j<NOS;j++)

#pragma HLS PIPELINE
temp_out[j]=sum1[j]/scale;

B6:for(j=NOS;j<2*NOS;j++)

#pragma HLS PIPELINE
out[j]=temp_out[j-NOS];

B7:for(j=0;j<NOS;j++)

#pragma HLS PIPELINE
out[j]=input1[j]*input2[j];

return;

}

template <typename T,typename T1, int NOS>
void hmm_hw(T1 type,T input1[NOS+1], T input2[NOS],T tran_mat[NOS][NOS], T tem[NOS],T out[2*NOS])
{
#pragma HLS INLINE

    switch((unsigned int)type)
    {
      case 0:  hmmbw_hw<T,NOS>(input1, input2,tran_mat,tem,out);

              break;
      case 1:hmmfw_hw<T,NOS>(input1, tran_mat, tem,out);
              break;
    }

}

// --------------------------------------------------------
// functions to insert and extract elements from an axi stream
// includes conversion to correct data type

template <typename T, int U, int TI, int TD>
T pop_stream(ap_axiu <sizeof(T)*8,U,TI,TD> const &e)
{
#pragma HLS INLINE


	assert(sizeof(T) == sizeof(int));
	union
	{
		int ival;
		T oval;
	} converter;
	converter.ival = e.data;
	T ret = converter.oval;

	volatile ap_uint<sizeof(T)> strb = e.strb;
	volatile ap_uint<sizeof(T)> keep = e.keep;
	volatile ap_uint<U> user = e.user;
	volatile ap_uint<1> last = e.last;
	volatile ap_uint<TI> id = e.id;
	volatile ap_uint<TD> dest = e.dest;

	return ret;
}

template <typename T, int U, int TI, int TD> ap_axiu <sizeof(T)*8,U,TI,TD> push_stream(T const &v, bool last = false)
{
#pragma HLS INLINE
	ap_axiu<sizeof(T)*8,U,TI,TD> e;

	assert(sizeof(T) == sizeof(int));
	union
	{
		int oval;
		T ival;
	} converter;
	converter.ival = v;
	e.data = converter.oval;

	// set it to sizeof(T) ones
	e.strb = -1;
	e.keep = 15; //e.strb;
	e.user = 0;
	e.last = last ? 1 : 0;
	e.id = 0;
	e.dest = 0;
	return e;
}

template <typename T,typename T1, int NOS, int SIZE, int U, int TI, int TD>
void wrapped_hmm_hw (
	AXI_VAL in_stream[6*NOS+2],
	AXI_VAL out_stream[2*NOS])
{

#pragma HLS INLINE
        T1 type;
        T input1[NOS+1];
#pragma HLS ARRAY_PARTITION variable=input1 complete dim=1
         T input2[NOS];
#pragma HLS ARRAY_PARTITION variable=input2 complete dim=1

        T tran_mat[NOS][NOS];
#pragma HLS ARRAY_PARTITION variable=tran_mat complete dim=2
        T tem[NOS];
#pragma HLS ARRAY_PARTITION variable=tem complete dim=1
        T ou[2*NOS];
	
        assert(sizeof(T1)*8 == 32);
	assert(sizeof(T)*8 == 32);
        type = pop_stream<T1,U,TI,TD>(in_stream[0]);

	// stream in INPUT
		for(int j=0; j<NOS+1; j++)
		{
#pragma HLS PIPELINE II=1
                         int k=j+1;
			input1[j] = pop_stream<T,U,TI,TD>(in_stream[k]);

		}
                for(int j=0; j<NOS; j++)
		{
#pragma HLS PIPELINE II=1
                         int k=j+NOS+2;
			input2[j] = pop_stream<T,U,TI,TD>(in_stream[k]);

		}

		// stream in transition matrix
		for(int i=0; i<NOS; i++)
			for(int j=0; j<NOS; j++)
			{
#pragma HLS PIPELINE II=1
				int k = i*NOS+j+(2*NOS+2);
				tran_mat[i][j] = pop_stream<T,U,TI,TD>(in_stream[k]);
			}
                 // stream in emission coloumn
		for(int j=0; j<NOS; j++)
		{
#pragma HLS PIPELINE II=1
                        int k = j+((2*NOS+2)+NOS*NOS);
			tem[j] = pop_stream<T,U,TI,TD>(in_stream[k]);

		}

			// do hmm_forward a-posteriori probability
                        hmm_hw<T,T1,NOS>(type,input1, input2, tran_mat, tem,ou);


			//hmmfw_hw<T,NOS>(input,tran_mat,tem,ou);

			// stream out result matrix
				for(int j=0; j<(2*NOS); j++)
				{
					#pragma HLS PIPELINE II=1
					out_stream[j] = push_stream<T,U,TI,TD>(ou[j],j == ((2*NOS)-1));

				}

				return;

}


// test the functions
template <typename T,typename T1, int NOS, int SIZE, int U, int TI, int TD>
int test_hmm(void)
{
	int err;

	T ip1[NOS+1];
        T ip2[NOS];
        T t_mat[NOS][NOS]={(float)(0.9440),(float)(0.0395),(float)(0.0165),
        		(float)(0.0759),(float)(0.9241),(float)(0),
				(float)(0.2191),(float)(0),(float)(0.7809)};
        T emt[NOS];
        T out_sw[2*NOS];
	T out_hw[2*NOS];
        T1 type;

	/** Matrix Initiation */
        type=(unsigned int)1;
	ip1[0]=(float)(1);
        ip1[1]=(float)(0);
        ip1[2]=(float)(0);
        ip1[3]=(float)(0);

        ip2[0]=(float)(0);
        ip2[1]=(float)(0);
        ip2[2]=(float)(0);
    
        emt[0]=(float)(0.9595);
        emt[1]=(float)(0.6017);
        emt[2]=(float)(0);
	/** End of Initiation */


	printf("DEBUGGING AXI4 STREAMING DATA TYPES!\r\n");

	// prepare data for the DUT
	AXI_VAL inp_stream[6*MCR_SIZE+2];
	AXI_VAL out_stream[2*MCR_SIZE];
        assert(sizeof(T1)*8 == 32);
	assert(sizeof(T)*8 == 32);
        // stream in INPUT
                 inp_stream[0]      = push_stream<T1,U,TI,TD>(type,0);
		for(int j=0; j<NOS+1; j++)
                {
                       int k=j+1;
			inp_stream[k]      = push_stream<T,U,TI,TD>(ip1[j],0);

		}
                for(int j=0; j<NOS; j++)
                {
                       int k=j+NOS+2;
			inp_stream[k]      = push_stream<T,U,TI,TD>(ip2[j],0);

		}
       // stream in transition_matrix
        for(int i=0; i<NOS; i++)
	for(int j=0; j<NOS; j++)
	{
              int k = i*NOS+j+(2*NOS+2);
	      inp_stream[k]      = push_stream<T,U,TI,TD>(t_mat[i][j],0);
	}
        // stream in Emmision column
        for(int j=0; j<NOS; j++)
                {
                        int k=j+(2*NOS+2)+(NOS*NOS);
			inp_stream[k]      = push_stream<T,U,TI,TD>(emt[j],k==((6*MCR_SIZE+2)-1));

		}


			//call the DUT
                       wrapped_hmm_hw <T,T1,3,4,4,5,5>(inp_stream, out_stream);

			// extract the a_post prob from the out stream 
                        for(int j=0; j<(2*NOS); j++)
				{
					out_hw[j] = pop_stream<T,U,TI,TD>(out_stream[j]);
				}


	/* reference Matrix Multiplication */
       
         hmm_ref<T,T1,NOS>(type,ip1, ip2,t_mat, emt,out_sw);
	//hmmfw_ref<T, NOS>(ip, t_mat, emt, out_sw);

	/** out comparison */
        printf("Matlab output: \n");
        printf("0.974431   0.025568   0.000000 \n");
	err = 0;
        printf("HLS output: \n");
	for(int j=0; j<(2*NOS); j++)
         {
           if(out_hw[j]!=out_sw[j])
           {
             err++;
           }


         }
          
           printf("\n");
	if (err == 0)
		printf("Matrixes identical ... Test successful!\r\n");
	else
		{
               printf("Test failed!\r\n");
              return err;
              }


/** Matrix Initiation */
	type=(unsigned int)0;
		ip1[0]=(float)(1.060515);
	        ip1[1]=(float)(0.717469);
	        ip1[2]=(float)(0.239849);
	        ip1[3]=(float)(0.857509);

	        ip2[0]=(float)(0.823596);
	        ip2[1]=(float)(0.176404);
	        ip2[2]=(float)(0.000000);
    
	/** End of Initiation */


	printf("DEBUGGING AXI4 STREAMING DATA TYPES!\r\n");

	// prepare data for the DUT
	//AXI_VAL inp_stream[6*MCR_SIZE+2];
	//AXI_VAL out_stream[SIZE];

        //assert(sizeof(T1)*8 == 32);
	//assert(sizeof(T)*8 == 32);
        // stream in INPUT
                 inp_stream[0]      = push_stream<T1,U,TI,TD>(type,0);
		for(int j=0; j<NOS+1; j++)
                {
                       int k=j+1;
			inp_stream[k]      = push_stream<T,U,TI,TD>(ip1[j],0);

		}
                for(int j=0; j<NOS; j++)
                {
                       int k=j+NOS+2;
			inp_stream[k]      = push_stream<T,U,TI,TD>(ip2[j],0);

		}
       // stream in transition_matrix
        for(int i=0; i<NOS; i++)
	for(int j=0; j<NOS; j++)
	{
              int k = i*NOS+j+(2*NOS+2);
	      inp_stream[k]      = push_stream<T,U,TI,TD>(t_mat[i][j],0);
	}
        // stream in Emmision column
        for(int j=0; j<NOS; j++)
                {
                        int k=j+(2*NOS+2)+(NOS*NOS);
			inp_stream[k]      = push_stream<T,U,TI,TD>(emt[j],k==((6*MCR_SIZE+2)-1));

		}


			//call the DUT
                       wrapped_hmm_hw <T,T1,3,4,4,5,5>(inp_stream, out_stream);

			// extract the a_post prob from the out stream 
                        for(int j=0; j<(2*NOS); j++)
				{
					out_hw[j] = pop_stream<T,U,TI,TD>(out_stream[j]);
				}


	/* reference Matrix Multiplication */
       
         hmm_ref<T,T1,NOS>(type,ip1, ip2,t_mat, emt,out_sw);
	//hmmfw_ref<T, NOS>(ip, t_mat, emt, out_sw);

	/** out comparison */
        printf("Matlab output: \n");
        printf("0.865760   0.134240  0.000000  \n");
	err = 0;
        printf("HLS output: \n");
	for(int j=0; j<(2*NOS); j++)
         {
           if(out_hw[j]!=out_sw[j])
           {
             err++;
           }
           printf("%f ",out_hw[j]);
         }
          
           printf("\n");
	if (err == 0)
		printf("Matrixes identical ... Test successful!\r\n");
	else
		{
               printf("Test failed!\r\n");

              }
	return err;
}

