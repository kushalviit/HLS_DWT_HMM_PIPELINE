// ==============================================================
// File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2015.4
// Copyright (C) 2015 Xilinx Inc. All rights reserved.
// 
// ==============================================================

#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xhls_hmm.h"

extern XHls_hmm_Config XHls_hmm_ConfigTable[];

XHls_hmm_Config *XHls_hmm_LookupConfig(u16 DeviceId) {
	XHls_hmm_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XHLS_HMM_NUM_INSTANCES; Index++) {
		if (XHls_hmm_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XHls_hmm_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XHls_hmm_Initialize(XHls_hmm *InstancePtr, u16 DeviceId) {
	XHls_hmm_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XHls_hmm_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XHls_hmm_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

