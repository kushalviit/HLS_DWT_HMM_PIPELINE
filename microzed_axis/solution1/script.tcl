############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 2015 Xilinx Inc. All rights reserved.
############################################################
open_project microzed_axis
set_top HLS_hmm
add_files hmmaccel.cpp -cflags "-DDB_DEBUG"
add_files -tb hmm_test.cpp -cflags "-DDB_DEBUG"
open_solution "solution1"
set_part {xc7z020clg484-1}
create_clock -period 10 -name default
#source "./microzed_axis/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -evaluate verilog -format ip_catalog
