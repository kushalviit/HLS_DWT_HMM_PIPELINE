-- (c) Copyright 1995-2017 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: xilinx.com:hls:HLS_hmm:1.0
-- IP Revision: 1708191341

-- The following code must appear in the VHDL architecture header.

------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
COMPONENT design_1_HLS_hmm_0_0
  PORT (
    s_axi_CONTROL_BUS_AWADDR : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    s_axi_CONTROL_BUS_AWVALID : IN STD_LOGIC;
    s_axi_CONTROL_BUS_AWREADY : OUT STD_LOGIC;
    s_axi_CONTROL_BUS_WDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axi_CONTROL_BUS_WSTRB : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s_axi_CONTROL_BUS_WVALID : IN STD_LOGIC;
    s_axi_CONTROL_BUS_WREADY : OUT STD_LOGIC;
    s_axi_CONTROL_BUS_BRESP : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_axi_CONTROL_BUS_BVALID : OUT STD_LOGIC;
    s_axi_CONTROL_BUS_BREADY : IN STD_LOGIC;
    s_axi_CONTROL_BUS_ARADDR : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    s_axi_CONTROL_BUS_ARVALID : IN STD_LOGIC;
    s_axi_CONTROL_BUS_ARREADY : OUT STD_LOGIC;
    s_axi_CONTROL_BUS_RDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axi_CONTROL_BUS_RRESP : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_axi_CONTROL_BUS_RVALID : OUT STD_LOGIC;
    s_axi_CONTROL_BUS_RREADY : IN STD_LOGIC;
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    interrupt : OUT STD_LOGIC;
    INPUT_STREAM_TVALID : IN STD_LOGIC;
    INPUT_STREAM_TREADY : OUT STD_LOGIC;
    INPUT_STREAM_TDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    INPUT_STREAM_TDEST : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    INPUT_STREAM_TKEEP : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    INPUT_STREAM_TSTRB : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    INPUT_STREAM_TUSER : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    INPUT_STREAM_TLAST : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    INPUT_STREAM_TID : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    OUTPUT_STREAM_TVALID : OUT STD_LOGIC;
    OUTPUT_STREAM_TREADY : IN STD_LOGIC;
    OUTPUT_STREAM_TDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    OUTPUT_STREAM_TDEST : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
    OUTPUT_STREAM_TKEEP : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    OUTPUT_STREAM_TSTRB : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    OUTPUT_STREAM_TUSER : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    OUTPUT_STREAM_TLAST : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    OUTPUT_STREAM_TID : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
  );
END COMPONENT;
-- COMP_TAG_END ------ End COMPONENT Declaration ------------

-- The following code must appear in the VHDL architecture
-- body. Substitute your own instance name and net names.

------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
your_instance_name : design_1_HLS_hmm_0_0
  PORT MAP (
    s_axi_CONTROL_BUS_AWADDR => s_axi_CONTROL_BUS_AWADDR,
    s_axi_CONTROL_BUS_AWVALID => s_axi_CONTROL_BUS_AWVALID,
    s_axi_CONTROL_BUS_AWREADY => s_axi_CONTROL_BUS_AWREADY,
    s_axi_CONTROL_BUS_WDATA => s_axi_CONTROL_BUS_WDATA,
    s_axi_CONTROL_BUS_WSTRB => s_axi_CONTROL_BUS_WSTRB,
    s_axi_CONTROL_BUS_WVALID => s_axi_CONTROL_BUS_WVALID,
    s_axi_CONTROL_BUS_WREADY => s_axi_CONTROL_BUS_WREADY,
    s_axi_CONTROL_BUS_BRESP => s_axi_CONTROL_BUS_BRESP,
    s_axi_CONTROL_BUS_BVALID => s_axi_CONTROL_BUS_BVALID,
    s_axi_CONTROL_BUS_BREADY => s_axi_CONTROL_BUS_BREADY,
    s_axi_CONTROL_BUS_ARADDR => s_axi_CONTROL_BUS_ARADDR,
    s_axi_CONTROL_BUS_ARVALID => s_axi_CONTROL_BUS_ARVALID,
    s_axi_CONTROL_BUS_ARREADY => s_axi_CONTROL_BUS_ARREADY,
    s_axi_CONTROL_BUS_RDATA => s_axi_CONTROL_BUS_RDATA,
    s_axi_CONTROL_BUS_RRESP => s_axi_CONTROL_BUS_RRESP,
    s_axi_CONTROL_BUS_RVALID => s_axi_CONTROL_BUS_RVALID,
    s_axi_CONTROL_BUS_RREADY => s_axi_CONTROL_BUS_RREADY,
    ap_clk => ap_clk,
    ap_rst_n => ap_rst_n,
    interrupt => interrupt,
    INPUT_STREAM_TVALID => INPUT_STREAM_TVALID,
    INPUT_STREAM_TREADY => INPUT_STREAM_TREADY,
    INPUT_STREAM_TDATA => INPUT_STREAM_TDATA,
    INPUT_STREAM_TDEST => INPUT_STREAM_TDEST,
    INPUT_STREAM_TKEEP => INPUT_STREAM_TKEEP,
    INPUT_STREAM_TSTRB => INPUT_STREAM_TSTRB,
    INPUT_STREAM_TUSER => INPUT_STREAM_TUSER,
    INPUT_STREAM_TLAST => INPUT_STREAM_TLAST,
    INPUT_STREAM_TID => INPUT_STREAM_TID,
    OUTPUT_STREAM_TVALID => OUTPUT_STREAM_TVALID,
    OUTPUT_STREAM_TREADY => OUTPUT_STREAM_TREADY,
    OUTPUT_STREAM_TDATA => OUTPUT_STREAM_TDATA,
    OUTPUT_STREAM_TDEST => OUTPUT_STREAM_TDEST,
    OUTPUT_STREAM_TKEEP => OUTPUT_STREAM_TKEEP,
    OUTPUT_STREAM_TSTRB => OUTPUT_STREAM_TSTRB,
    OUTPUT_STREAM_TUSER => OUTPUT_STREAM_TUSER,
    OUTPUT_STREAM_TLAST => OUTPUT_STREAM_TLAST,
    OUTPUT_STREAM_TID => OUTPUT_STREAM_TID
  );
-- INST_TAG_END ------ End INSTANTIATION Template ---------

-- You must compile the wrapper file design_1_HLS_hmm_0_0.vhd when simulating
-- the core, design_1_HLS_hmm_0_0. When compiling the wrapper file, be sure to
-- reference the VHDL simulation library.

