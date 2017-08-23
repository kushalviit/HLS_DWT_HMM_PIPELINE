#include <stdio.h>
#include <stdlib.h>

#include "hmmaccel.h"

typedef float T;
typedef unsigned int T1;
int const NOS = 3;
int const SIZE = 4;


void hmmfw_sw(float input1[NOS+1],float tran_mat[NOS][NOS], float tem[NOS],float out[2*NOS])
{
int j,k;
float prod[NOS][NOS];
float sum[NOS];
float temp_out[NOS];
float temp;
  
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

void hmmbw_sw(float input1[NOS+1], float input2[NOS],float tran_mat[NOS][NOS], float tem[NOS],float out[2*NOS])
{
int j,k;
float prod1[NOS][NOS];
float sum1[NOS];
float temp_out[NOS];
float scale=input1[NOS];
out[NOS]=(float)0;
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


void hmm_sw(unsigned int type,float input1[NOS+1], float input2[NOS],float tran_mat[NOS][NOS], float tem[NOS],float out[2*NOS])
{
    switch(type)
    {
      case 0:hmmbw_sw(input1, input2,tran_mat,tem,out);
              break;
      case 1:hmmfw_sw(input1, tran_mat, tem,out);
              break;
    }
 return;
}


#ifdef DB_DEBUG

int main(void)
{

	int ret_val = 0;

	ret_val = test_hmm<T,T1, NOS, SIZE, 4,5,5>();

	return ret_val;

}

#else

int main(void)
{

	int ret_val = 0;

	int  err;

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
	printf("NORMAL MODE\r\n");
        
        standalone_hmm(type,ip1,ip2, t_mat, emt,out_hw);

	/* reference Matrix Multiplication */ 
        hmm_sw(type,ip1,ip2, t_mat, emt,out_sw);

	
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
		{printf("Test failed!\r\n");
                return err;}


       type=(unsigned int)0;
	ip1[0]=(float)(1.060515);
        ip1[1]=(float)(0.717469);
        ip1[2]=(float)(0.239849);
        ip1[3]=(float)(0.857);

        ip2[0]=(float)(0.823596);
        ip2[1]=(float)(0.176404);
        ip2[2]=(float)(0.000000);
        /** End of Initiation */
	printf("NORMAL MODE\r\n");
        
        standalone_hmm(type,ip1,ip2, t_mat, emt,out_hw);

	/* reference Matrix Multiplication */ 
        hmm_sw(type,ip1,ip2, t_mat, emt,out_sw);

	
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
		{printf("Test failed!\r\n");
                }
	return err;

}



#endif
