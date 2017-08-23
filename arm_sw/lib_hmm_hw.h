#ifndef H_LIB_EXAMPLE_HW_H
#define H_LIB_EXAMPLE_HW_H

#define NOS   3
#define SIZE  4

int Setup_HW_hmm(const unsigned int *type,float ip1[SIZE],float ip2[NOS] ,float t_mat[NOS][NOS],float emi_col[NOS], float res_hw[2*NOS]);


int Run_HW_hmm(const unsigned int *type,float ip1[SIZE],float ip2[NOS] ,float t_mat[NOS][NOS],float emi_col[NOS], float res_hw[2*NOS]);

void dwt(float *input,float *coeflin,float *coefhin,int inLen,int cLen,float *loutput,float *houtput);

void Start_HW_hmm(void);
//void matrix_multiply_ref(float a[DIM][DIM], float b[DIM][DIM], float out[DIM][DIM]);

#endif
