; ModuleID = 'C:/Users/Hanyan/Desktop/board2/microzed_axis/solution1/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-w64-mingw32"

@llvm_global_ctors_1 = appending global [1 x void ()*] [void ()* @_GLOBAL__I_a]
@llvm_global_ctors_0 = appending global [1 x i32] [i32 65535]
@HLS_hmm_str = internal unnamed_addr constant [8 x i8] c"HLS_hmm\00"
@p_str9 = private unnamed_addr constant [12 x i8] c"hls_label_4\00", align 1
@p_str8 = private unnamed_addr constant [12 x i8] c"hls_label_1\00", align 1
@p_str7 = private unnamed_addr constant [12 x i8] c"hls_label_0\00", align 1
@p_str6 = private unnamed_addr constant [12 x i8] c"hls_label_2\00", align 1
@p_str5 = private unnamed_addr constant [12 x i8] c"hls_label_3\00", align 1
@p_str3 = private unnamed_addr constant [5 x i8] c"axis\00", align 1
@p_str21 = private unnamed_addr constant [3 x i8] c"B7\00", align 1
@p_str20 = private unnamed_addr constant [3 x i8] c"B6\00", align 1
@p_str2 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@p_str19 = private unnamed_addr constant [3 x i8] c"B5\00", align 1
@p_str18 = private unnamed_addr constant [3 x i8] c"B3\00", align 1
@p_str16 = private unnamed_addr constant [3 x i8] c"B1\00", align 1
@p_str15 = private unnamed_addr constant [3 x i8] c"L6\00", align 1
@p_str14 = private unnamed_addr constant [3 x i8] c"L5\00", align 1
@p_str13 = private unnamed_addr constant [3 x i8] c"L4\00", align 1
@p_str12 = private unnamed_addr constant [3 x i8] c"L3\00", align 1
@p_str10 = private unnamed_addr constant [3 x i8] c"L1\00", align 1
@p_str1 = private unnamed_addr constant [12 x i8] c"CONTROL_BUS\00", align 1
@p_str = private unnamed_addr constant [10 x i8] c"s_axilite\00", align 1

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

define weak void @_ssdm_op_Write.axis.volatile.i32P.i4P.i4P.i4P.i1P.i5P.i5P(i32*, i4*, i4*, i4*, i1*, i5*, i5*, i32, i4, i4, i4, i1, i5, i5) {
entry:
  store i32 %7, i32* %0
  store i4 %8, i4* %1
  store i4 %9, i4* %2
  store i4 %10, i4* %3
  store i1 %11, i1* %4
  store i5 %12, i5* %5
  store i5 %13, i5* %6
  ret void
}

define weak void @_ssdm_op_SpecTopModule(...) {
entry:
  ret void
}

define weak i32 @_ssdm_op_SpecRegionEnd(...) {
entry:
  ret i32 0
}

define weak i32 @_ssdm_op_SpecRegionBegin(...) {
entry:
  ret i32 0
}

define weak void @_ssdm_op_SpecPipeline(...) nounwind {
entry:
  ret void
}

define weak i32 @_ssdm_op_SpecLoopTripCount(...) {
entry:
  ret i32 0
}

define weak void @_ssdm_op_SpecLoopName(...) nounwind {
entry:
  ret void
}

define weak void @_ssdm_op_SpecInterface(...) nounwind {
entry:
  ret void
}

define weak void @_ssdm_op_SpecBitsMap(...) {
entry:
  ret void
}

define weak { i32, i4, i4, i4, i1, i5, i5 } @_ssdm_op_Read.axis.volatile.i32P.i4P.i4P.i4P.i1P.i5P.i5P(i32*, i4*, i4*, i4*, i1*, i5*, i5*) {
entry:
  %empty = load i32* %0
  %empty_3 = load i4* %1
  %empty_4 = load i4* %2
  %empty_5 = load i4* %3
  %empty_6 = load i1* %4
  %empty_7 = load i5* %5
  %empty_8 = load i5* %6
  %mrv_0 = insertvalue { i32, i4, i4, i4, i1, i5, i5 } undef, i32 %empty, 0
  %mrv1 = insertvalue { i32, i4, i4, i4, i1, i5, i5 } %mrv_0, i4 %empty_3, 1
  %mrv2 = insertvalue { i32, i4, i4, i4, i1, i5, i5 } %mrv1, i4 %empty_4, 2
  %mrv3 = insertvalue { i32, i4, i4, i4, i1, i5, i5 } %mrv2, i4 %empty_5, 3
  %mrv4 = insertvalue { i32, i4, i4, i4, i1, i5, i5 } %mrv3, i1 %empty_6, 4
  %mrv5 = insertvalue { i32, i4, i4, i4, i1, i5, i5 } %mrv4, i5 %empty_7, 5
  %mrv6 = insertvalue { i32, i4, i4, i4, i1, i5, i5 } %mrv5, i5 %empty_8, 6
  ret { i32, i4, i4, i4, i1, i5, i5 } %mrv6
}

declare i2 @_ssdm_op_PartSelect.i2.i3.i32.i32(i3, i32, i32) nounwind readnone

define weak float @_ssdm_op_Mux.ap_auto.3float.i2(float, float, float, i2) {
entry:
  switch i2 %3, label %case2 [
    i2 0, label %case0
    i2 1, label %case1
  ]

case0:                                            ; preds = %case2, %case1, %entry
  %merge = phi float [ %0, %entry ], [ %1, %case1 ], [ %2, %case2 ]
  ret float %merge

case1:                                            ; preds = %entry
  br label %case0

case2:                                            ; preds = %entry
  br label %case0
}

declare i16 @_ssdm_op_HSub(...)

declare i16 @_ssdm_op_HMul(...)

declare i16 @_ssdm_op_HDiv(...)

declare i16 @_ssdm_op_HAdd(...)

declare void @_GLOBAL__I_a() nounwind

define void @HLS_hmm(i32* %INPUT_STREAM_data_V, i4* %INPUT_STREAM_keep_V, i4* %INPUT_STREAM_strb_V, i4* %INPUT_STREAM_user_V, i1* %INPUT_STREAM_last_V, i5* %INPUT_STREAM_id_V, i5* %INPUT_STREAM_dest_V, i32* %OUTPUT_STREAM_data_V, i4* %OUTPUT_STREAM_keep_V, i4* %OUTPUT_STREAM_strb_V, i4* %OUTPUT_STREAM_user_V, i1* %OUTPUT_STREAM_last_V, i5* %OUTPUT_STREAM_id_V, i5* %OUTPUT_STREAM_dest_V) {
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %INPUT_STREAM_data_V), !map !7
  call void (...)* @_ssdm_op_SpecBitsMap(i4* %INPUT_STREAM_keep_V), !map !13
  call void (...)* @_ssdm_op_SpecBitsMap(i4* %INPUT_STREAM_strb_V), !map !17
  call void (...)* @_ssdm_op_SpecBitsMap(i4* %INPUT_STREAM_user_V), !map !21
  call void (...)* @_ssdm_op_SpecBitsMap(i1* %INPUT_STREAM_last_V), !map !25
  call void (...)* @_ssdm_op_SpecBitsMap(i5* %INPUT_STREAM_id_V), !map !29
  call void (...)* @_ssdm_op_SpecBitsMap(i5* %INPUT_STREAM_dest_V), !map !33
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %OUTPUT_STREAM_data_V), !map !37
  call void (...)* @_ssdm_op_SpecBitsMap(i4* %OUTPUT_STREAM_keep_V), !map !43
  call void (...)* @_ssdm_op_SpecBitsMap(i4* %OUTPUT_STREAM_strb_V), !map !47
  call void (...)* @_ssdm_op_SpecBitsMap(i4* %OUTPUT_STREAM_user_V), !map !51
  call void (...)* @_ssdm_op_SpecBitsMap(i1* %OUTPUT_STREAM_last_V), !map !55
  call void (...)* @_ssdm_op_SpecBitsMap(i5* %OUTPUT_STREAM_id_V), !map !59
  call void (...)* @_ssdm_op_SpecBitsMap(i5* %OUTPUT_STREAM_dest_V), !map !63
  %ou = alloca [6 x float], align 16
  call void (...)* @_ssdm_op_SpecTopModule([8 x i8]* @HLS_hmm_str) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i32 0, [10 x i8]* @p_str, i32 0, i32 0, i32 0, i32 0, [12 x i8]* @p_str1, [1 x i8]* @p_str2, [1 x i8]* @p_str2, [1 x i8]* @p_str2) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i32* %OUTPUT_STREAM_data_V, i4* %OUTPUT_STREAM_keep_V, i4* %OUTPUT_STREAM_strb_V, i4* %OUTPUT_STREAM_user_V, i1* %OUTPUT_STREAM_last_V, i5* %OUTPUT_STREAM_id_V, i5* %OUTPUT_STREAM_dest_V, [5 x i8]* @p_str3, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str2, [1 x i8]* @p_str2, [1 x i8]* @p_str2, [1 x i8]* @p_str2)
  call void (...)* @_ssdm_op_SpecInterface(i32* %INPUT_STREAM_data_V, i4* %INPUT_STREAM_keep_V, i4* %INPUT_STREAM_strb_V, i4* %INPUT_STREAM_user_V, i1* %INPUT_STREAM_last_V, i5* %INPUT_STREAM_id_V, i5* %INPUT_STREAM_dest_V, [5 x i8]* @p_str3, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str2, [1 x i8]* @p_str2, [1 x i8]* @p_str2, [1 x i8]* @p_str2)
  %empty = call { i32, i4, i4, i4, i1, i5, i5 } @_ssdm_op_Read.axis.volatile.i32P.i4P.i4P.i4P.i1P.i5P.i5P(i32* %INPUT_STREAM_data_V, i4* %INPUT_STREAM_keep_V, i4* %INPUT_STREAM_strb_V, i4* %INPUT_STREAM_user_V, i1* %INPUT_STREAM_last_V, i5* %INPUT_STREAM_id_V, i5* %INPUT_STREAM_dest_V)
  %ret = extractvalue { i32, i4, i4, i4, i1, i5, i5 } %empty, 0
  br label %1

; <label>:1                                       ; preds = %_ifconv, %0
  %scale = phi float [ undef, %0 ], [ %input1_3_2, %_ifconv ]
  %input1_2_s = phi float [ undef, %0 ], [ %input1_3_5, %_ifconv ]
  %input1_3_6 = phi float [ undef, %0 ], [ %input1_3_8, %_ifconv ]
  %input1_3_9 = phi float [ undef, %0 ], [ %input1_3_11, %_ifconv ]
  %j_0_i = phi i3 [ 0, %0 ], [ %k, %_ifconv ]
  %exitcond5_i = icmp eq i3 %j_0_i, -4
  %k = add i3 %j_0_i, 1
  br i1 %exitcond5_i, label %.preheader8.i, label %_ifconv

_ifconv:                                          ; preds = %1
  %empty_9 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 4, i64 4, i64 4)
  %tmp_2 = call i32 (...)* @_ssdm_op_SpecRegionBegin([12 x i8]* @p_str5)
  call void (...)* @_ssdm_op_SpecPipeline(i32 1, i32 1, i32 1, i32 0, [1 x i8]* @p_str2) nounwind
  %empty_10 = call { i32, i4, i4, i4, i1, i5, i5 } @_ssdm_op_Read.axis.volatile.i32P.i4P.i4P.i4P.i1P.i5P.i5P(i32* %INPUT_STREAM_data_V, i4* %INPUT_STREAM_keep_V, i4* %INPUT_STREAM_strb_V, i4* %INPUT_STREAM_user_V, i1* %INPUT_STREAM_last_V, i5* %INPUT_STREAM_id_V, i5* %INPUT_STREAM_dest_V)
  %INPUT_STREAM_data_V_val5 = extractvalue { i32, i4, i4, i4, i1, i5, i5 } %empty_10, 0
  %input1_0 = bitcast i32 %INPUT_STREAM_data_V_val5 to float
  %tmp_35 = trunc i3 %j_0_i to i2
  %sel_tmp = icmp eq i2 %tmp_35, -2
  %input1_3 = select i1 %sel_tmp, float %scale, float %input1_0
  %sel_tmp2 = icmp eq i2 %tmp_35, 1
  %input1_3_1 = select i1 %sel_tmp2, float %scale, float %input1_3
  %sel_tmp4 = icmp eq i2 %tmp_35, 0
  %input1_3_2 = select i1 %sel_tmp4, float %scale, float %input1_3_1
  %input1_3_3 = select i1 %sel_tmp, float %input1_0, float %input1_2_s
  %input1_3_4 = select i1 %sel_tmp2, float %input1_2_s, float %input1_3_3
  %input1_3_5 = select i1 %sel_tmp4, float %input1_2_s, float %input1_3_4
  %input1_3_7 = select i1 %sel_tmp2, float %input1_0, float %input1_3_6
  %input1_3_8 = select i1 %sel_tmp4, float %input1_3_6, float %input1_3_7
  %input1_3_11 = select i1 %sel_tmp4, float %input1_0, float %input1_3_9
  %empty_11 = call i32 (...)* @_ssdm_op_SpecRegionEnd([12 x i8]* @p_str5, i32 %tmp_2)
  br label %1

.preheader8.i:                                    ; preds = %1, %_ifconv72
  %input2_2_s = phi float [ %input2_2_1, %_ifconv72 ], [ undef, %1 ]
  %input2_1_s = phi float [ %input2_2_3, %_ifconv72 ], [ undef, %1 ]
  %input2_2_4 = phi float [ %input2_2_5, %_ifconv72 ], [ undef, %1 ]
  %j1_0_i = phi i2 [ %j_1, %_ifconv72 ], [ 0, %1 ]
  %exitcond4_i = icmp eq i2 %j1_0_i, -1
  %j_1 = add i2 %j1_0_i, 1
  br i1 %exitcond4_i, label %.preheader6.i, label %_ifconv72

_ifconv72:                                        ; preds = %.preheader8.i
  %empty_12 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 3, i64 3, i64 3)
  %tmp_5 = call i32 (...)* @_ssdm_op_SpecRegionBegin([12 x i8]* @p_str6)
  call void (...)* @_ssdm_op_SpecPipeline(i32 1, i32 1, i32 1, i32 0, [1 x i8]* @p_str2) nounwind
  %empty_13 = call { i32, i4, i4, i4, i1, i5, i5 } @_ssdm_op_Read.axis.volatile.i32P.i4P.i4P.i4P.i1P.i5P.i5P(i32* %INPUT_STREAM_data_V, i4* %INPUT_STREAM_keep_V, i4* %INPUT_STREAM_strb_V, i4* %INPUT_STREAM_user_V, i1* %INPUT_STREAM_last_V, i5* %INPUT_STREAM_id_V, i5* %INPUT_STREAM_dest_V)
  %INPUT_STREAM_data_V_val = extractvalue { i32, i4, i4, i4, i1, i5, i5 } %empty_13, 0
  %ret_1 = bitcast i32 %INPUT_STREAM_data_V_val to float
  %sel_tmp8 = icmp eq i2 %j1_0_i, 1
  %input2_2 = select i1 %sel_tmp8, float %input2_2_s, float %ret_1
  %sel_tmp1 = icmp eq i2 %j1_0_i, 0
  %input2_2_1 = select i1 %sel_tmp1, float %input2_2_s, float %input2_2
  %input2_2_2 = select i1 %sel_tmp8, float %ret_1, float %input2_1_s
  %input2_2_3 = select i1 %sel_tmp1, float %input2_1_s, float %input2_2_2
  %input2_2_5 = select i1 %sel_tmp1, float %ret_1, float %input2_2_4
  %empty_14 = call i32 (...)* @_ssdm_op_SpecRegionEnd([12 x i8]* @p_str6, i32 %tmp_5)
  br label %.preheader8.i

.preheader6.i:                                    ; preds = %.preheader8.i, %.preheader7.i
  %indvar_flatten = phi i4 [ %indvar_flatten_next, %.preheader7.i ], [ 0, %.preheader8.i ]
  %i_0_i = phi i2 [ %i_0_i_mid2, %.preheader7.i ], [ 0, %.preheader8.i ]
  %tran_mat_2_2_1 = phi float [ %tran_mat_2_2_2, %.preheader7.i ], [ undef, %.preheader8.i ]
  %tran_mat_2_1_1 = phi float [ %tran_mat_2_2_22, %.preheader7.i ], [ undef, %.preheader8.i ]
  %tran_mat_2_2_6 = phi float [ %tran_mat_2_2_24, %.preheader7.i ], [ undef, %.preheader8.i ]
  %tran_mat_1_2_1 = phi float [ %tran_mat_2_2_26, %.preheader7.i ], [ undef, %.preheader8.i ]
  %tran_mat_1_1_1 = phi float [ %tran_mat_2_2_28, %.preheader7.i ], [ undef, %.preheader8.i ]
  %tran_mat_2_2_33 = phi float [ %tran_mat_2_2_30, %.preheader7.i ], [ undef, %.preheader8.i ]
  %tran_mat_2_2_18 = phi float [ %tran_mat_2_2_34, %.preheader7.i ], [ undef, %.preheader8.i ]
  %tran_mat_2_2_31 = phi float [ %tran_mat_2_2_35, %.preheader7.i ], [ undef, %.preheader8.i ]
  %tran_mat_2_2_12 = phi float [ %tran_mat_2_2_36, %.preheader7.i ], [ undef, %.preheader8.i ]
  %j3_0_i = phi i2 [ %j_3, %.preheader7.i ], [ 0, %.preheader8.i ]
  %exitcond_flatten = icmp eq i4 %indvar_flatten, -7
  %indvar_flatten_next = add i4 %indvar_flatten, 1
  br i1 %exitcond_flatten, label %.preheader.i, label %.preheader7.i

.preheader7.i:                                    ; preds = %.preheader6.i
  %empty_15 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 9, i64 9, i64 9)
  %exitcond2_i4 = icmp eq i2 %j3_0_i, -1
  %j3_0_i_mid2 = select i1 %exitcond2_i4, i2 0, i2 %j3_0_i
  %i2 = add i2 %i_0_i, 1
  %i_0_i_mid2 = select i1 %exitcond2_i4, i2 %i2, i2 %i_0_i
  %sel_tmp3 = icmp eq i2 %i_0_i_mid2, 1
  %sel_tmp5 = icmp eq i2 %i_0_i_mid2, 0
  %tmp_8 = call i32 (...)* @_ssdm_op_SpecRegionBegin([12 x i8]* @p_str7)
  call void (...)* @_ssdm_op_SpecPipeline(i32 1, i32 1, i32 1, i32 0, [1 x i8]* @p_str2) nounwind
  %empty_16 = call { i32, i4, i4, i4, i1, i5, i5 } @_ssdm_op_Read.axis.volatile.i32P.i4P.i4P.i4P.i1P.i5P.i5P(i32* %INPUT_STREAM_data_V, i4* %INPUT_STREAM_keep_V, i4* %INPUT_STREAM_strb_V, i4* %INPUT_STREAM_user_V, i1* %INPUT_STREAM_last_V, i5* %INPUT_STREAM_id_V, i5* %INPUT_STREAM_dest_V)
  %INPUT_STREAM_data_V_val1 = extractvalue { i32, i4, i4, i4, i1, i5, i5 } %empty_16, 0
  %ret_2 = bitcast i32 %INPUT_STREAM_data_V_val1 to float
  %tran_mat_2_2 = select i1 %sel_tmp3, float %tran_mat_2_2_1, float %ret_2
  %tran_mat_2_2_3 = select i1 %sel_tmp5, float %tran_mat_2_2_1, float %tran_mat_2_2
  %tran_mat_2_2_4 = select i1 %sel_tmp3, float %ret_2, float %tran_mat_2_1_1
  %tran_mat_2_2_5 = select i1 %sel_tmp5, float %tran_mat_2_1_1, float %tran_mat_2_2_4
  %tran_mat_2_2_7 = select i1 %sel_tmp5, float %ret_2, float %tran_mat_2_2_6
  %tran_mat_2_2_8 = select i1 %sel_tmp3, float %tran_mat_2_2_18, float %ret_2
  %tran_mat_2_2_9 = select i1 %sel_tmp5, float %tran_mat_2_2_18, float %tran_mat_2_2_8
  %tran_mat_2_2_10 = select i1 %sel_tmp3, float %ret_2, float %tran_mat_2_2_31
  %tran_mat_2_2_11 = select i1 %sel_tmp5, float %tran_mat_2_2_31, float %tran_mat_2_2_10
  %tran_mat_2_2_13 = select i1 %sel_tmp5, float %ret_2, float %tran_mat_2_2_12
  %tran_mat_2_2_14 = select i1 %sel_tmp3, float %tran_mat_1_2_1, float %ret_2
  %tran_mat_2_2_15 = select i1 %sel_tmp5, float %tran_mat_1_2_1, float %tran_mat_2_2_14
  %tran_mat_2_2_16 = select i1 %sel_tmp3, float %ret_2, float %tran_mat_1_1_1
  %tran_mat_2_2_17 = select i1 %sel_tmp5, float %tran_mat_1_1_1, float %tran_mat_2_2_16
  %tran_mat_2_2_19 = select i1 %sel_tmp5, float %ret_2, float %tran_mat_2_2_33
  %sel_tmp6 = icmp eq i2 %j3_0_i_mid2, 1
  %tran_mat_2_2_20 = select i1 %sel_tmp6, float %tran_mat_2_2_1, float %tran_mat_2_2_3
  %sel_tmp7 = icmp eq i2 %j3_0_i_mid2, 0
  %tran_mat_2_2_2 = select i1 %sel_tmp7, float %tran_mat_2_2_1, float %tran_mat_2_2_20
  %tran_mat_2_2_21 = select i1 %sel_tmp6, float %tran_mat_2_1_1, float %tran_mat_2_2_5
  %tran_mat_2_2_22 = select i1 %sel_tmp7, float %tran_mat_2_1_1, float %tran_mat_2_2_21
  %tran_mat_2_2_23 = select i1 %sel_tmp6, float %tran_mat_2_2_6, float %tran_mat_2_2_7
  %tran_mat_2_2_24 = select i1 %sel_tmp7, float %tran_mat_2_2_6, float %tran_mat_2_2_23
  %tran_mat_2_2_25 = select i1 %sel_tmp6, float %tran_mat_2_2_15, float %tran_mat_1_2_1
  %tran_mat_2_2_26 = select i1 %sel_tmp7, float %tran_mat_1_2_1, float %tran_mat_2_2_25
  %tran_mat_2_2_27 = select i1 %sel_tmp6, float %tran_mat_2_2_17, float %tran_mat_1_1_1
  %tran_mat_2_2_28 = select i1 %sel_tmp7, float %tran_mat_1_1_1, float %tran_mat_2_2_27
  %tran_mat_2_2_29 = select i1 %sel_tmp6, float %tran_mat_2_2_19, float %tran_mat_2_2_33
  %tran_mat_2_2_30 = select i1 %sel_tmp7, float %tran_mat_2_2_33, float %tran_mat_2_2_29
  %tran_mat_2_2_34 = select i1 %sel_tmp7, float %tran_mat_2_2_9, float %tran_mat_2_2_18
  %tran_mat_2_2_35 = select i1 %sel_tmp7, float %tran_mat_2_2_11, float %tran_mat_2_2_31
  %tran_mat_2_2_36 = select i1 %sel_tmp7, float %tran_mat_2_2_13, float %tran_mat_2_2_12
  %empty_17 = call i32 (...)* @_ssdm_op_SpecRegionEnd([12 x i8]* @p_str7, i32 %tmp_8)
  %j_3 = add i2 %j3_0_i_mid2, 1
  br label %.preheader6.i

.preheader.i:                                     ; preds = %.preheader6.i, %_ifconv158
  %tem_2_s = phi float [ %tem_2_1, %_ifconv158 ], [ undef, %.preheader6.i ]
  %tem_1_s = phi float [ %tem_2_3, %_ifconv158 ], [ undef, %.preheader6.i ]
  %tem_2_4 = phi float [ %tem_2_5, %_ifconv158 ], [ undef, %.preheader6.i ]
  %tem_load_s = phi float [ %tem_2_7, %_ifconv158 ], [ undef, %.preheader6.i ]
  %tem_load_1 = phi float [ %tem_2_9, %_ifconv158 ], [ undef, %.preheader6.i ]
  %tem_2_10 = phi float [ %tem_2_11, %_ifconv158 ], [ undef, %.preheader6.i ]
  %j5_0_i = phi i2 [ %j_2, %_ifconv158 ], [ 0, %.preheader6.i ]
  %exitcond1_i = icmp eq i2 %j5_0_i, -1
  %j_2 = add i2 %j5_0_i, 1
  br i1 %exitcond1_i, label %2, label %_ifconv158

_ifconv158:                                       ; preds = %.preheader.i
  %empty_18 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 3, i64 3, i64 3)
  %tmp_6 = call i32 (...)* @_ssdm_op_SpecRegionBegin([12 x i8]* @p_str8)
  call void (...)* @_ssdm_op_SpecPipeline(i32 1, i32 1, i32 1, i32 0, [1 x i8]* @p_str2) nounwind
  %empty_19 = call { i32, i4, i4, i4, i1, i5, i5 } @_ssdm_op_Read.axis.volatile.i32P.i4P.i4P.i4P.i1P.i5P.i5P(i32* %INPUT_STREAM_data_V, i4* %INPUT_STREAM_keep_V, i4* %INPUT_STREAM_strb_V, i4* %INPUT_STREAM_user_V, i1* %INPUT_STREAM_last_V, i5* %INPUT_STREAM_id_V, i5* %INPUT_STREAM_dest_V)
  %INPUT_STREAM_data_V_val2 = extractvalue { i32, i4, i4, i4, i1, i5, i5 } %empty_19, 0
  %ret_3 = bitcast i32 %INPUT_STREAM_data_V_val2 to float
  %sel_tmp9 = icmp eq i2 %j5_0_i, 1
  %tem_2 = select i1 %sel_tmp9, float %tem_2_s, float %ret_3
  %sel_tmp10 = icmp eq i2 %j5_0_i, 0
  %tem_2_1 = select i1 %sel_tmp10, float %tem_2_s, float %tem_2
  %tem_2_2 = select i1 %sel_tmp9, float %ret_3, float %tem_1_s
  %tem_2_3 = select i1 %sel_tmp10, float %tem_1_s, float %tem_2_2
  %tem_2_5 = select i1 %sel_tmp10, float %ret_3, float %tem_2_4
  %tem_2_6 = select i1 %sel_tmp9, float %tem_load_s, float %ret_3
  %tem_2_7 = select i1 %sel_tmp10, float %tem_load_s, float %tem_2_6
  %tem_2_8 = select i1 %sel_tmp9, float %ret_3, float %tem_load_1
  %tem_2_9 = select i1 %sel_tmp10, float %tem_load_1, float %tem_2_8
  %tem_2_11 = select i1 %sel_tmp10, float %ret_3, float %tem_2_10
  %empty_20 = call i32 (...)* @_ssdm_op_SpecRegionEnd([12 x i8]* @p_str8, i32 %tmp_6)
  br label %.preheader.i

; <label>:2                                       ; preds = %.preheader.i
  switch i32 %ret, label %"hmm_hw<float, int, 3>.exit.i" [
    i32 0, label %3
    i32 1, label %.preheader
  ]

; <label>:3                                       ; preds = %2
  %ou_addr = getelementptr inbounds [6 x float]* %ou, i64 0, i64 3
  store float 0.000000e+00, float* %ou_addr, align 4
  br label %4

; <label>:4                                       ; preds = %_ifconv183, %3
  %prod1_2_2_s = phi float [ undef, %3 ], [ %prod1_2_2_1, %_ifconv183 ]
  %prod1_2_1_s = phi float [ undef, %3 ], [ %prod1_2_2_3, %_ifconv183 ]
  %prod1_2_2_4 = phi float [ undef, %3 ], [ %prod1_2_2_5, %_ifconv183 ]
  %prod1_1_2_s = phi float [ undef, %3 ], [ %prod1_1_2_1, %_ifconv183 ]
  %prod1_1_1_s = phi float [ undef, %3 ], [ %prod1_1_2_3, %_ifconv183 ]
  %prod1_1_2_4 = phi float [ undef, %3 ], [ %prod1_1_2_5, %_ifconv183 ]
  %prod1_0_2_s = phi float [ undef, %3 ], [ %prod1_0_2_1, %_ifconv183 ]
  %prod1_0_1_s = phi float [ undef, %3 ], [ %prod1_0_2_3, %_ifconv183 ]
  %prod1_0_2_4 = phi float [ undef, %3 ], [ %prod1_0_2_5, %_ifconv183 ]
  %j_0_i_i_i = phi i2 [ 0, %3 ], [ %j_5, %_ifconv183 ]
  %exitcond5_i_i_i = icmp eq i2 %j_0_i_i_i, -1
  %j_5 = add i2 %j_0_i_i_i, 1
  br i1 %exitcond5_i_i_i, label %.preheader8.i.i.i, label %_ifconv183

_ifconv183:                                       ; preds = %4
  %empty_21 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 3, i64 3, i64 3)
  call void (...)* @_ssdm_op_SpecLoopName([3 x i8]* @p_str16) nounwind
  %tmp_1 = call i32 (...)* @_ssdm_op_SpecRegionBegin([3 x i8]* @p_str16)
  call void (...)* @_ssdm_op_SpecPipeline(i32 1, i32 1, i32 1, i32 0, [1 x i8]* @p_str2) nounwind
  %tmp_11 = call float @_ssdm_op_Mux.ap_auto.3float.i2(float %tran_mat_2_2_12, float %tran_mat_2_2_31, float %tran_mat_2_2_18, i2 %j_0_i_i_i)
  %tmp_4 = fmul float %tmp_11, %input1_3_9
  %prod1_0_2_7 = fmul float %tmp_4, %tem_2_10
  %sel_tmp11 = icmp eq i2 %j_0_i_i_i, 1
  %prod1_0_2 = select i1 %sel_tmp11, float %prod1_0_2_s, float %prod1_0_2_7
  %sel_tmp12 = icmp eq i2 %j_0_i_i_i, 0
  %prod1_0_2_1 = select i1 %sel_tmp12, float %prod1_0_2_s, float %prod1_0_2
  %prod1_0_2_2 = select i1 %sel_tmp11, float %prod1_0_2_7, float %prod1_0_1_s
  %prod1_0_2_3 = select i1 %sel_tmp12, float %prod1_0_1_s, float %prod1_0_2_2
  %prod1_0_2_5 = select i1 %sel_tmp12, float %prod1_0_2_7, float %prod1_0_2_4
  %tmp_12 = call float @_ssdm_op_Mux.ap_auto.3float.i2(float %tran_mat_2_2_33, float %tran_mat_1_1_1, float %tran_mat_1_2_1, i2 %j_0_i_i_i)
  %tmp_16_1 = fmul float %tmp_12, %input1_3_6
  %prod1_1_2_7 = fmul float %tmp_16_1, %tem_load_1
  %prod1_1_2 = select i1 %sel_tmp11, float %prod1_1_2_s, float %prod1_1_2_7
  %prod1_1_2_1 = select i1 %sel_tmp12, float %prod1_1_2_s, float %prod1_1_2
  %prod1_1_2_2 = select i1 %sel_tmp11, float %prod1_1_2_7, float %prod1_1_1_s
  %prod1_1_2_3 = select i1 %sel_tmp12, float %prod1_1_1_s, float %prod1_1_2_2
  %prod1_1_2_5 = select i1 %sel_tmp12, float %prod1_1_2_7, float %prod1_1_2_4
  %tmp_14 = call float @_ssdm_op_Mux.ap_auto.3float.i2(float %tran_mat_2_2_6, float %tran_mat_2_1_1, float %tran_mat_2_2_1, i2 %j_0_i_i_i)
  %tmp_16_2 = fmul float %tmp_14, %input1_2_s
  %prod1_2_2_7 = fmul float %tmp_16_2, %tem_load_s
  %prod1_2_2 = select i1 %sel_tmp11, float %prod1_2_2_s, float %prod1_2_2_7
  %prod1_2_2_1 = select i1 %sel_tmp12, float %prod1_2_2_s, float %prod1_2_2
  %prod1_2_2_2 = select i1 %sel_tmp11, float %prod1_2_2_7, float %prod1_2_1_s
  %prod1_2_2_3 = select i1 %sel_tmp12, float %prod1_2_1_s, float %prod1_2_2_2
  %prod1_2_2_5 = select i1 %sel_tmp12, float %prod1_2_2_7, float %prod1_2_2_4
  %empty_22 = call i32 (...)* @_ssdm_op_SpecRegionEnd([3 x i8]* @p_str16, i32 %tmp_1)
  br label %4

.preheader8.i.i.i:                                ; preds = %4, %_ifconv220
  %sum1_2_s = phi float [ %sum1_2_1, %_ifconv220 ], [ undef, %4 ]
  %sum1_1_s = phi float [ %sum1_2_3, %_ifconv220 ], [ undef, %4 ]
  %sum1_2_4 = phi float [ %sum1_2_5, %_ifconv220 ], [ undef, %4 ]
  %j_1_i_i_i = phi i2 [ %j_4, %_ifconv220 ], [ 0, %4 ]
  %exitcond3_i_i_i = icmp eq i2 %j_1_i_i_i, -1
  %j_4 = add i2 %j_1_i_i_i, 1
  br i1 %exitcond3_i_i_i, label %.preheader7.i.i.i, label %_ifconv220

_ifconv220:                                       ; preds = %.preheader8.i.i.i
  %empty_23 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 3, i64 3, i64 3)
  call void (...)* @_ssdm_op_SpecLoopName([3 x i8]* @p_str18) nounwind
  %tmp_10 = call i32 (...)* @_ssdm_op_SpecRegionBegin([3 x i8]* @p_str18)
  call void (...)* @_ssdm_op_SpecPipeline(i32 1, i32 1, i32 1, i32 0, [1 x i8]* @p_str2) nounwind
  %tmp_19 = call float @_ssdm_op_Mux.ap_auto.3float.i2(float %prod1_0_2_4, float %prod1_0_1_s, float %prod1_0_2_s, i2 %j_1_i_i_i)
  %tmp_20 = call float @_ssdm_op_Mux.ap_auto.3float.i2(float %prod1_1_2_4, float %prod1_1_1_s, float %prod1_1_2_s, i2 %j_1_i_i_i)
  %tmp_13 = fadd float %tmp_19, %tmp_20
  %tmp_22 = call float @_ssdm_op_Mux.ap_auto.3float.i2(float %prod1_2_2_4, float %prod1_2_1_s, float %prod1_2_2_s, i2 %j_1_i_i_i)
  %sum1_2_7 = fadd float %tmp_13, %tmp_22
  %sel_tmp15 = icmp eq i2 %j_1_i_i_i, 1
  %sum1_2 = select i1 %sel_tmp15, float %sum1_2_s, float %sum1_2_7
  %sel_tmp16 = icmp eq i2 %j_1_i_i_i, 0
  %sum1_2_1 = select i1 %sel_tmp16, float %sum1_2_s, float %sum1_2
  %sum1_2_2 = select i1 %sel_tmp15, float %sum1_2_7, float %sum1_1_s
  %sum1_2_3 = select i1 %sel_tmp16, float %sum1_1_s, float %sum1_2_2
  %sum1_2_5 = select i1 %sel_tmp16, float %sum1_2_7, float %sum1_2_4
  %empty_24 = call i32 (...)* @_ssdm_op_SpecRegionEnd([3 x i8]* @p_str18, i32 %tmp_10)
  br label %.preheader8.i.i.i

.preheader7.i.i.i:                                ; preds = %.preheader8.i.i.i, %_ifconv233
  %temp_out_2_1_s = phi float [ %temp_out_2_8, %_ifconv233 ], [ undef, %.preheader8.i.i.i ]
  %temp_out_1_1_s = phi float [ %temp_out_2_10, %_ifconv233 ], [ undef, %.preheader8.i.i.i ]
  %temp_out_2_6 = phi float [ %temp_out_2_12, %_ifconv233 ], [ undef, %.preheader8.i.i.i ]
  %j_2_i_i_i = phi i2 [ %j_8, %_ifconv233 ], [ 0, %.preheader8.i.i.i ]
  %exitcond2_i_i_i = icmp eq i2 %j_2_i_i_i, -1
  %j_8 = add i2 %j_2_i_i_i, 1
  br i1 %exitcond2_i_i_i, label %.preheader6.i.i.i, label %_ifconv233

_ifconv233:                                       ; preds = %.preheader7.i.i.i
  %empty_25 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 3, i64 3, i64 3)
  call void (...)* @_ssdm_op_SpecLoopName([3 x i8]* @p_str19) nounwind
  %tmp_21 = call i32 (...)* @_ssdm_op_SpecRegionBegin([3 x i8]* @p_str19)
  call void (...)* @_ssdm_op_SpecPipeline(i32 1, i32 1, i32 1, i32 0, [1 x i8]* @p_str2) nounwind
  %tmp_28 = call float @_ssdm_op_Mux.ap_auto.3float.i2(float %sum1_2_4, float %sum1_1_s, float %sum1_2_s, i2 %j_2_i_i_i)
  %temp_out_2_14 = fdiv float %tmp_28, %scale
  %sel_tmp19 = icmp eq i2 %j_2_i_i_i, 1
  %temp_out_2_7 = select i1 %sel_tmp19, float %temp_out_2_1_s, float %temp_out_2_14
  %sel_tmp20 = icmp eq i2 %j_2_i_i_i, 0
  %temp_out_2_8 = select i1 %sel_tmp20, float %temp_out_2_1_s, float %temp_out_2_7
  %temp_out_2_9 = select i1 %sel_tmp19, float %temp_out_2_14, float %temp_out_1_1_s
  %temp_out_2_10 = select i1 %sel_tmp20, float %temp_out_1_1_s, float %temp_out_2_9
  %temp_out_2_12 = select i1 %sel_tmp20, float %temp_out_2_14, float %temp_out_2_6
  %empty_26 = call i32 (...)* @_ssdm_op_SpecRegionEnd([3 x i8]* @p_str19, i32 %tmp_21)
  br label %.preheader7.i.i.i

.preheader6.i.i.i:                                ; preds = %.preheader7.i.i.i, %5
  %j_3_i_i_i = phi i3 [ %j_10, %5 ], [ 3, %.preheader7.i.i.i ]
  %exitcond1_i_i_i = icmp eq i3 %j_3_i_i_i, -2
  br i1 %exitcond1_i_i_i, label %.preheader.i.i.i, label %5

; <label>:5                                       ; preds = %.preheader6.i.i.i
  %empty_27 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 3, i64 3, i64 3)
  call void (...)* @_ssdm_op_SpecLoopName([3 x i8]* @p_str20) nounwind
  %tmp_34 = call i32 (...)* @_ssdm_op_SpecRegionBegin([3 x i8]* @p_str20)
  call void (...)* @_ssdm_op_SpecPipeline(i32 1, i32 1, i32 1, i32 0, [1 x i8]* @p_str2) nounwind
  %tmp_43 = trunc i3 %j_3_i_i_i to i2
  %tmp_27_t = add i2 1, %tmp_43
  %tmp_37 = call float @_ssdm_op_Mux.ap_auto.3float.i2(float %temp_out_2_6, float %temp_out_1_1_s, float %temp_out_2_1_s, i2 %tmp_27_t)
  %tmp_24 = zext i3 %j_3_i_i_i to i64
  %ou_addr_1 = getelementptr inbounds [6 x float]* %ou, i64 0, i64 %tmp_24
  store float %tmp_37, float* %ou_addr_1, align 4
  %empty_28 = call i32 (...)* @_ssdm_op_SpecRegionEnd([3 x i8]* @p_str20, i32 %tmp_34)
  %j_10 = add i3 1, %j_3_i_i_i
  br label %.preheader6.i.i.i

.preheader.i.i.i:                                 ; preds = %.preheader6.i.i.i, %_ifconv246
  %j_4_i_i_i = phi i2 [ %j_15, %_ifconv246 ], [ 0, %.preheader6.i.i.i ]
  %exitcond_i_i_i = icmp eq i2 %j_4_i_i_i, -1
  %j_15 = add i2 %j_4_i_i_i, 1
  br i1 %exitcond_i_i_i, label %"hmm_hw<float, int, 3>.exit.i", label %_ifconv246

_ifconv246:                                       ; preds = %.preheader.i.i.i
  %empty_29 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 3, i64 3, i64 3)
  call void (...)* @_ssdm_op_SpecLoopName([3 x i8]* @p_str21) nounwind
  %tmp_38 = call i32 (...)* @_ssdm_op_SpecRegionBegin([3 x i8]* @p_str21)
  call void (...)* @_ssdm_op_SpecPipeline(i32 1, i32 1, i32 1, i32 0, [1 x i8]* @p_str2) nounwind
  %tmp_31 = zext i2 %j_4_i_i_i to i64
  %sel_tmp23 = icmp eq i2 %j_4_i_i_i, 1
  %input1_3_12 = select i1 %sel_tmp23, float %input1_3_6, float %input1_2_s
  %sel_tmp24 = icmp eq i2 %j_4_i_i_i, 0
  %input1_3_13 = select i1 %sel_tmp24, float %input1_3_9, float %input1_3_12
  %tmp_39 = call float @_ssdm_op_Mux.ap_auto.3float.i2(float %input2_2_4, float %input2_1_s, float %input2_2_s, i2 %j_4_i_i_i)
  %tmp_32 = fmul float %input1_3_13, %tmp_39
  %ou_addr_2 = getelementptr inbounds [6 x float]* %ou, i64 0, i64 %tmp_31
  store float %tmp_32, float* %ou_addr_2, align 4
  %empty_30 = call i32 (...)* @_ssdm_op_SpecRegionEnd([3 x i8]* @p_str21, i32 %tmp_38)
  br label %.preheader.i.i.i

.preheader:                                       ; preds = %2, %_ifconv251
  %prod_2_2_s = phi float [ %prod_2_2_1, %_ifconv251 ], [ undef, %2 ]
  %prod_2_1_s = phi float [ %prod_2_2_3, %_ifconv251 ], [ undef, %2 ]
  %prod_2_2_4 = phi float [ %prod_2_2_5, %_ifconv251 ], [ undef, %2 ]
  %prod_1_2_s = phi float [ %prod_1_2_1, %_ifconv251 ], [ undef, %2 ]
  %prod_1_1_s = phi float [ %prod_1_2_3, %_ifconv251 ], [ undef, %2 ]
  %prod_1_2_4 = phi float [ %prod_1_2_5, %_ifconv251 ], [ undef, %2 ]
  %prod_0_2_s = phi float [ %prod_0_2_1, %_ifconv251 ], [ undef, %2 ]
  %prod_0_1_s = phi float [ %prod_0_2_3, %_ifconv251 ], [ undef, %2 ]
  %prod_0_2_4 = phi float [ %prod_0_2_5, %_ifconv251 ], [ undef, %2 ]
  %j_0_i2_i_i = phi i2 [ %j_7, %_ifconv251 ], [ 0, %2 ]
  %exitcond5_i3_i_i = icmp eq i2 %j_0_i2_i_i, -1
  %j_7 = add i2 %j_0_i2_i_i, 1
  br i1 %exitcond5_i3_i_i, label %.preheader8.i12.i.i, label %_ifconv251

_ifconv251:                                       ; preds = %.preheader
  %empty_31 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 3, i64 3, i64 3)
  call void (...)* @_ssdm_op_SpecLoopName([3 x i8]* @p_str10) nounwind
  %tmp_7 = call i32 (...)* @_ssdm_op_SpecRegionBegin([3 x i8]* @p_str10)
  call void (...)* @_ssdm_op_SpecPipeline(i32 1, i32 1, i32 1, i32 0, [1 x i8]* @p_str2) nounwind
  %tmp = call float @_ssdm_op_Mux.ap_auto.3float.i2(float %tran_mat_2_2_12, float %tran_mat_2_2_33, float %tran_mat_2_2_6, i2 %j_0_i2_i_i)
  %prod_0_2_7 = fmul float %input1_3_9, %tmp
  %sel_tmp13 = icmp eq i2 %j_0_i2_i_i, 1
  %prod_0_2 = select i1 %sel_tmp13, float %prod_0_2_s, float %prod_0_2_7
  %sel_tmp14 = icmp eq i2 %j_0_i2_i_i, 0
  %prod_0_2_1 = select i1 %sel_tmp14, float %prod_0_2_s, float %prod_0_2
  %prod_0_2_2 = select i1 %sel_tmp13, float %prod_0_2_7, float %prod_0_1_s
  %prod_0_2_3 = select i1 %sel_tmp14, float %prod_0_1_s, float %prod_0_2_2
  %prod_0_2_5 = select i1 %sel_tmp14, float %prod_0_2_7, float %prod_0_2_4
  %tmp_3 = call float @_ssdm_op_Mux.ap_auto.3float.i2(float %tran_mat_2_2_31, float %tran_mat_1_1_1, float %tran_mat_2_1_1, i2 %j_0_i2_i_i)
  %prod_1_2_7 = fmul float %input1_3_6, %tmp_3
  %prod_1_2 = select i1 %sel_tmp13, float %prod_1_2_s, float %prod_1_2_7
  %prod_1_2_1 = select i1 %sel_tmp14, float %prod_1_2_s, float %prod_1_2
  %prod_1_2_2 = select i1 %sel_tmp13, float %prod_1_2_7, float %prod_1_1_s
  %prod_1_2_3 = select i1 %sel_tmp14, float %prod_1_1_s, float %prod_1_2_2
  %prod_1_2_5 = select i1 %sel_tmp14, float %prod_1_2_7, float %prod_1_2_4
  %tmp_9 = call float @_ssdm_op_Mux.ap_auto.3float.i2(float %tran_mat_2_2_18, float %tran_mat_1_2_1, float %tran_mat_2_2_1, i2 %j_0_i2_i_i)
  %prod_2_2_7 = fmul float %input1_2_s, %tmp_9
  %prod_2_2 = select i1 %sel_tmp13, float %prod_2_2_s, float %prod_2_2_7
  %prod_2_2_1 = select i1 %sel_tmp14, float %prod_2_2_s, float %prod_2_2
  %prod_2_2_2 = select i1 %sel_tmp13, float %prod_2_2_7, float %prod_2_1_s
  %prod_2_2_3 = select i1 %sel_tmp14, float %prod_2_1_s, float %prod_2_2_2
  %prod_2_2_5 = select i1 %sel_tmp14, float %prod_2_2_7, float %prod_2_2_4
  %empty_32 = call i32 (...)* @_ssdm_op_SpecRegionEnd([3 x i8]* @p_str10, i32 %tmp_7)
  br label %.preheader

.preheader8.i12.i.i:                              ; preds = %.preheader, %_ifconv288
  %sum_2_s = phi float [ %sum_2_1, %_ifconv288 ], [ undef, %.preheader ]
  %sum_1_s = phi float [ %sum_2_3, %_ifconv288 ], [ undef, %.preheader ]
  %sum_2_4 = phi float [ %sum_2_5, %_ifconv288 ], [ undef, %.preheader ]
  %j_1_i10_i_i = phi i2 [ %j_6, %_ifconv288 ], [ 0, %.preheader ]
  %exitcond3_i11_i_i = icmp eq i2 %j_1_i10_i_i, -1
  %j_6 = add i2 %j_1_i10_i_i, 1
  br i1 %exitcond3_i11_i_i, label %.preheader7.i17.i.i, label %_ifconv288

_ifconv288:                                       ; preds = %.preheader8.i12.i.i
  %empty_33 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 3, i64 3, i64 3)
  call void (...)* @_ssdm_op_SpecLoopName([3 x i8]* @p_str12) nounwind
  %tmp_15 = call i32 (...)* @_ssdm_op_SpecRegionBegin([3 x i8]* @p_str12)
  call void (...)* @_ssdm_op_SpecPipeline(i32 1, i32 1, i32 1, i32 0, [1 x i8]* @p_str2) nounwind
  %tmp_16 = call float @_ssdm_op_Mux.ap_auto.3float.i2(float %prod_0_2_4, float %prod_0_1_s, float %prod_0_2_s, i2 %j_1_i10_i_i)
  %tmp_17 = call float @_ssdm_op_Mux.ap_auto.3float.i2(float %prod_1_2_4, float %prod_1_1_s, float %prod_1_2_s, i2 %j_1_i10_i_i)
  %tmp_s = fadd float %tmp_16, %tmp_17
  %tmp_18 = call float @_ssdm_op_Mux.ap_auto.3float.i2(float %prod_2_2_4, float %prod_2_1_s, float %prod_2_2_s, i2 %j_1_i10_i_i)
  %sum_2_7 = fadd float %tmp_s, %tmp_18
  %sel_tmp17 = icmp eq i2 %j_1_i10_i_i, 1
  %sum_2 = select i1 %sel_tmp17, float %sum_2_s, float %sum_2_7
  %sel_tmp18 = icmp eq i2 %j_1_i10_i_i, 0
  %sum_2_1 = select i1 %sel_tmp18, float %sum_2_s, float %sum_2
  %sum_2_2 = select i1 %sel_tmp17, float %sum_2_7, float %sum_1_s
  %sum_2_3 = select i1 %sel_tmp18, float %sum_1_s, float %sum_2_2
  %sum_2_5 = select i1 %sel_tmp18, float %sum_2_7, float %sum_2_4
  %empty_34 = call i32 (...)* @_ssdm_op_SpecRegionEnd([3 x i8]* @p_str12, i32 %tmp_15)
  br label %.preheader8.i12.i.i

.preheader7.i17.i.i:                              ; preds = %.preheader8.i12.i.i, %_ifconv301
  %temp_out_2_s = phi float [ %temp_out_2_1, %_ifconv301 ], [ undef, %.preheader8.i12.i.i ]
  %temp_out_1_s = phi float [ %temp_out_2_3, %_ifconv301 ], [ undef, %.preheader8.i12.i.i ]
  %temp_out_2_4 = phi float [ %temp_out_2_5, %_ifconv301 ], [ undef, %.preheader8.i12.i.i ]
  %j_2_i15_i_i = phi i2 [ %j_9, %_ifconv301 ], [ 0, %.preheader8.i12.i.i ]
  %exitcond2_i16_i_i = icmp eq i2 %j_2_i15_i_i, -1
  %j_9 = add i2 %j_2_i15_i_i, 1
  br i1 %exitcond2_i16_i_i, label %.preheader6.i22.i.i, label %_ifconv301

_ifconv301:                                       ; preds = %.preheader7.i17.i.i
  %empty_35 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 3, i64 3, i64 3)
  call void (...)* @_ssdm_op_SpecLoopName([3 x i8]* @p_str13) nounwind
  %tmp_23 = call i32 (...)* @_ssdm_op_SpecRegionBegin([3 x i8]* @p_str13)
  call void (...)* @_ssdm_op_SpecPipeline(i32 1, i32 1, i32 1, i32 0, [1 x i8]* @p_str2) nounwind
  %tmp_25 = call float @_ssdm_op_Mux.ap_auto.3float.i2(float %sum_2_4, float %sum_1_s, float %sum_2_s, i2 %j_2_i15_i_i)
  %tmp_27 = call float @_ssdm_op_Mux.ap_auto.3float.i2(float %tem_2_4, float %tem_1_s, float %tem_2_s, i2 %j_2_i15_i_i)
  %temp_out_2_15 = fmul float %tmp_25, %tmp_27
  %sel_tmp21 = icmp eq i2 %j_2_i15_i_i, 1
  %temp_out_2 = select i1 %sel_tmp21, float %temp_out_2_s, float %temp_out_2_15
  %sel_tmp22 = icmp eq i2 %j_2_i15_i_i, 0
  %temp_out_2_1 = select i1 %sel_tmp22, float %temp_out_2_s, float %temp_out_2
  %temp_out_2_2 = select i1 %sel_tmp21, float %temp_out_2_15, float %temp_out_1_s
  %temp_out_2_3 = select i1 %sel_tmp22, float %temp_out_1_s, float %temp_out_2_2
  %temp_out_2_5 = select i1 %sel_tmp22, float %temp_out_2_15, float %temp_out_2_4
  %empty_36 = call i32 (...)* @_ssdm_op_SpecRegionEnd([3 x i8]* @p_str13, i32 %tmp_23)
  br label %.preheader7.i17.i.i

.preheader6.i22.i.i:                              ; preds = %.preheader7.i17.i.i, %6
  %j_3_i20_i_i = phi i2 [ %j_13, %6 ], [ 0, %.preheader7.i17.i.i ]
  %temp_0_i_i_i = phi float [ %temp, %6 ], [ 0.000000e+00, %.preheader7.i17.i.i ]
  %exitcond1_i21_i_i = icmp eq i2 %j_3_i20_i_i, -1
  %j_13 = add i2 %j_3_i20_i_i, 1
  br i1 %exitcond1_i21_i_i, label %.preheader.i27.i.i, label %6

; <label>:6                                       ; preds = %.preheader6.i22.i.i
  %empty_37 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 3, i64 3, i64 3)
  call void (...)* @_ssdm_op_SpecLoopName([3 x i8]* @p_str14) nounwind
  %tmp_30 = call i32 (...)* @_ssdm_op_SpecRegionBegin([3 x i8]* @p_str14)
  call void (...)* @_ssdm_op_SpecPipeline(i32 1, i32 1, i32 1, i32 0, [1 x i8]* @p_str2) nounwind
  %tmp_36 = call float @_ssdm_op_Mux.ap_auto.3float.i2(float %temp_out_2_4, float %temp_out_1_s, float %temp_out_2_s, i2 %j_3_i20_i_i)
  %temp = fadd float %temp_0_i_i_i, %tmp_36
  %empty_38 = call i32 (...)* @_ssdm_op_SpecRegionEnd([3 x i8]* @p_str14, i32 %tmp_30)
  br label %.preheader6.i22.i.i

.preheader.i27.i.i:                               ; preds = %.preheader6.i22.i.i, %7
  %j_4_i25_i_i = phi i2 [ %j_11, %7 ], [ 0, %.preheader6.i22.i.i ]
  %exitcond_i26_i_i = icmp eq i2 %j_4_i25_i_i, -1
  %j_11 = add i2 %j_4_i25_i_i, 1
  br i1 %exitcond_i26_i_i, label %"hmmfw_hw<float, 3>.exit.i.i", label %7

; <label>:7                                       ; preds = %.preheader.i27.i.i
  %empty_39 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 3, i64 3, i64 3)
  call void (...)* @_ssdm_op_SpecLoopName([3 x i8]* @p_str15) nounwind
  %tmp_40 = call i32 (...)* @_ssdm_op_SpecRegionBegin([3 x i8]* @p_str15)
  call void (...)* @_ssdm_op_SpecPipeline(i32 1, i32 1, i32 1, i32 0, [1 x i8]* @p_str2) nounwind
  %tmp_26 = zext i2 %j_4_i25_i_i to i64
  %tmp_41 = call float @_ssdm_op_Mux.ap_auto.3float.i2(float %temp_out_2_4, float %temp_out_1_s, float %temp_out_2_s, i2 %j_4_i25_i_i)
  %tmp_29 = fdiv float %tmp_41, %temp_0_i_i_i
  %ou_addr_6 = getelementptr inbounds [6 x float]* %ou, i64 0, i64 %tmp_26
  store float %tmp_29, float* %ou_addr_6, align 4
  %empty_40 = call i32 (...)* @_ssdm_op_SpecRegionEnd([3 x i8]* @p_str15, i32 %tmp_40)
  br label %.preheader.i27.i.i

"hmmfw_hw<float, 3>.exit.i.i":                    ; preds = %.preheader.i27.i.i
  %ou_addr_3 = getelementptr inbounds [6 x float]* %ou, i64 0, i64 3
  store float %temp_0_i_i_i, float* %ou_addr_3, align 4
  %ou_addr_4 = getelementptr inbounds [6 x float]* %ou, i64 0, i64 4
  store float 0.000000e+00, float* %ou_addr_4, align 16
  %ou_addr_5 = getelementptr inbounds [6 x float]* %ou, i64 0, i64 5
  store float 0.000000e+00, float* %ou_addr_5, align 4
  br label %"hmm_hw<float, int, 3>.exit.i"

"hmm_hw<float, int, 3>.exit.i":                   ; preds = %.preheader.i.i.i, %"hmmfw_hw<float, 3>.exit.i.i", %2
  br label %8

; <label>:8                                       ; preds = %9, %"hmm_hw<float, int, 3>.exit.i"
  %j7_0_i = phi i3 [ 0, %"hmm_hw<float, int, 3>.exit.i" ], [ %j_16, %9 ]
  %exitcond_i = icmp eq i3 %j7_0_i, -2
  %j_16 = add i3 %j7_0_i, 1
  br i1 %exitcond_i, label %"wrapped_hmm_hw<float, int, 3, 4, 4, 5, 5>.exit", label %9

; <label>:9                                       ; preds = %8
  %empty_41 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 6, i64 6, i64 6)
  %tmp_42 = call i32 (...)* @_ssdm_op_SpecRegionBegin([12 x i8]* @p_str9)
  call void (...)* @_ssdm_op_SpecPipeline(i32 1, i32 1, i32 1, i32 0, [1 x i8]* @p_str2) nounwind
  %tmp_33 = zext i3 %j7_0_i to i64
  %ou_addr_7 = getelementptr inbounds [6 x float]* %ou, i64 0, i64 %tmp_33
  %last_assign = icmp eq i3 %j7_0_i, -3
  %ou_load = load float* %ou_addr_7, align 4
  %val_assign = bitcast float %ou_load to i32
  call void @_ssdm_op_Write.axis.volatile.i32P.i4P.i4P.i4P.i1P.i5P.i5P(i32* %OUTPUT_STREAM_data_V, i4* %OUTPUT_STREAM_keep_V, i4* %OUTPUT_STREAM_strb_V, i4* %OUTPUT_STREAM_user_V, i1* %OUTPUT_STREAM_last_V, i5* %OUTPUT_STREAM_id_V, i5* %OUTPUT_STREAM_dest_V, i32 %val_assign, i4 -1, i4 -1, i4 0, i1 %last_assign, i5 0, i5 0)
  %empty_42 = call i32 (...)* @_ssdm_op_SpecRegionEnd([12 x i8]* @p_str9, i32 %tmp_42)
  br label %8

"wrapped_hmm_hw<float, int, 3, 4, 4, 5, 5>.exit": ; preds = %8
  ret void
}

!hls.encrypted.func = !{}
!llvm.map.gv = !{!0}

!0 = metadata !{metadata !1, [1 x i32]* @llvm_global_ctors_0}
!1 = metadata !{metadata !2}
!2 = metadata !{i32 0, i32 31, metadata !3}
!3 = metadata !{metadata !4}
!4 = metadata !{metadata !"llvm.global_ctors.0", metadata !5, metadata !"", i32 0, i32 31}
!5 = metadata !{metadata !6}
!6 = metadata !{i32 0, i32 0, i32 1}
!7 = metadata !{metadata !8}
!8 = metadata !{i32 0, i32 31, metadata !9}
!9 = metadata !{metadata !10}
!10 = metadata !{metadata !"INPUT_STREAM.data.V", metadata !11, metadata !"uint32", i32 0, i32 31}
!11 = metadata !{metadata !12}
!12 = metadata !{i32 0, i32 19, i32 1}
!13 = metadata !{metadata !14}
!14 = metadata !{i32 0, i32 3, metadata !15}
!15 = metadata !{metadata !16}
!16 = metadata !{metadata !"INPUT_STREAM.keep.V", metadata !11, metadata !"uint4", i32 0, i32 3}
!17 = metadata !{metadata !18}
!18 = metadata !{i32 0, i32 3, metadata !19}
!19 = metadata !{metadata !20}
!20 = metadata !{metadata !"INPUT_STREAM.strb.V", metadata !11, metadata !"uint4", i32 0, i32 3}
!21 = metadata !{metadata !22}
!22 = metadata !{i32 0, i32 3, metadata !23}
!23 = metadata !{metadata !24}
!24 = metadata !{metadata !"INPUT_STREAM.user.V", metadata !11, metadata !"uint4", i32 0, i32 3}
!25 = metadata !{metadata !26}
!26 = metadata !{i32 0, i32 0, metadata !27}
!27 = metadata !{metadata !28}
!28 = metadata !{metadata !"INPUT_STREAM.last.V", metadata !11, metadata !"uint1", i32 0, i32 0}
!29 = metadata !{metadata !30}
!30 = metadata !{i32 0, i32 4, metadata !31}
!31 = metadata !{metadata !32}
!32 = metadata !{metadata !"INPUT_STREAM.id.V", metadata !11, metadata !"uint5", i32 0, i32 4}
!33 = metadata !{metadata !34}
!34 = metadata !{i32 0, i32 4, metadata !35}
!35 = metadata !{metadata !36}
!36 = metadata !{metadata !"INPUT_STREAM.dest.V", metadata !11, metadata !"uint5", i32 0, i32 4}
!37 = metadata !{metadata !38}
!38 = metadata !{i32 0, i32 31, metadata !39}
!39 = metadata !{metadata !40}
!40 = metadata !{metadata !"OUTPUT_STREAM.data.V", metadata !41, metadata !"uint32", i32 0, i32 31}
!41 = metadata !{metadata !42}
!42 = metadata !{i32 0, i32 5, i32 1}
!43 = metadata !{metadata !44}
!44 = metadata !{i32 0, i32 3, metadata !45}
!45 = metadata !{metadata !46}
!46 = metadata !{metadata !"OUTPUT_STREAM.keep.V", metadata !41, metadata !"uint4", i32 0, i32 3}
!47 = metadata !{metadata !48}
!48 = metadata !{i32 0, i32 3, metadata !49}
!49 = metadata !{metadata !50}
!50 = metadata !{metadata !"OUTPUT_STREAM.strb.V", metadata !41, metadata !"uint4", i32 0, i32 3}
!51 = metadata !{metadata !52}
!52 = metadata !{i32 0, i32 3, metadata !53}
!53 = metadata !{metadata !54}
!54 = metadata !{metadata !"OUTPUT_STREAM.user.V", metadata !41, metadata !"uint4", i32 0, i32 3}
!55 = metadata !{metadata !56}
!56 = metadata !{i32 0, i32 0, metadata !57}
!57 = metadata !{metadata !58}
!58 = metadata !{metadata !"OUTPUT_STREAM.last.V", metadata !41, metadata !"uint1", i32 0, i32 0}
!59 = metadata !{metadata !60}
!60 = metadata !{i32 0, i32 4, metadata !61}
!61 = metadata !{metadata !62}
!62 = metadata !{metadata !"OUTPUT_STREAM.id.V", metadata !41, metadata !"uint5", i32 0, i32 4}
!63 = metadata !{metadata !64}
!64 = metadata !{i32 0, i32 4, metadata !65}
!65 = metadata !{metadata !66}
!66 = metadata !{metadata !"OUTPUT_STREAM.dest.V", metadata !41, metadata !"uint5", i32 0, i32 4}
