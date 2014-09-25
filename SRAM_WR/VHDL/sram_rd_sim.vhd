--------------------------------------------------------------------------------
-- Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: K.39
--  \   \         Application: netgen
--  /   /         Filename: sram_rd_synthesis.vhd
-- /___/   /\     Timestamp: Tue Oct 26 16:07:11 2010
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -ar Structure -tm sram_rd -w -dir netgen/synthesis -ofmt vhdl -sim sram_rd.ngc sram_rd_synthesis.vhd 
-- Device	: xc4vlx100-12-ff1148
-- Input file	: sram_rd.ngc
-- Output file	: C:\Users\gstitt\Documents\teaching\fall10\temp\temp2\netgen\synthesis\sram_rd_synthesis.vhd
-- # of Entities	: 1
-- Design Name	: sram_rd
-- Xilinx	: C:\Xilinx\10.1\ISE
--             
-- Purpose:    
--     This VHDL netlist is a verification model and uses simulation 
--     primitives which may not represent the true implementation of the 
--     device, however the netlist is functionally correct and should not 
--     be modified. This file cannot be synthesized and should only be used 
--     with supported simulation tools.
--             
-- Reference:  
--     Development System Reference Guide, Chapter 23
--     Synthesis and Simulation Design Guide, Chapter 6
--             
--------------------------------------------------------------------------------


-- synthesis translate_off
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
use UNISIM.VPKG.ALL;

entity sram_rd is
  port (
    sram_fifo_empty : in STD_LOGIC := 'X'; 
    rd_en : in STD_LOGIC := 'X'; 
    rst : in STD_LOGIC := 'X'; 
    sram_valid : in STD_LOGIC := 'X'; 
    sram_request : out STD_LOGIC; 
    clear : in STD_LOGIC := 'X'; 
    go : in STD_LOGIC := 'X'; 
    user_clk : in STD_LOGIC := 'X'; 
    sram_ld_n : out STD_LOGIC; 
    done : out STD_LOGIC; 
    valid : out STD_LOGIC; 
    sram_calibrated : in STD_LOGIC := 'X'; 
    sram_clk : in STD_LOGIC := 'X'; 
    sram_rw_n : out STD_LOGIC; 
    stall : in STD_LOGIC := 'X'; 
    sram_wdata : out STD_LOGIC_VECTOR ( 63 downto 0 ); 
    sram_bw_n : out STD_LOGIC_VECTOR ( 7 downto 0 ); 
    sram_addr : out STD_LOGIC_VECTOR ( 20 downto 0 ); 
    data : out STD_LOGIC_VECTOR ( 15 downto 0 ); 
    sram_rdata : in STD_LOGIC_VECTOR ( 63 downto 0 ); 
    start_addr : in STD_LOGIC_VECTOR ( 20 downto 0 ); 
    size : in STD_LOGIC_VECTOR ( 31 downto 0 ) 
  );
end sram_rd;

architecture Structure of sram_rd is
  component fifo_64_prog_full
    port (
      prog_full : out STD_LOGIC; 
      rd_en : in STD_LOGIC := 'X'; 
      wr_en : in STD_LOGIC := 'X'; 
      full : out STD_LOGIC; 
      empty : out STD_LOGIC; 
      wr_clk : in STD_LOGIC := 'X'; 
      rst : in STD_LOGIC := 'X'; 
      rd_clk : in STD_LOGIC := 'X'; 
      dout : out STD_LOGIC_VECTOR ( 63 downto 0 ); 
      din : in STD_LOGIC_VECTOR ( 63 downto 0 ) 
    );
  end component;
  signal N37 : STD_LOGIC; 
  signal N55 : STD_LOGIC; 
  signal N56 : STD_LOGIC; 
  signal N57 : STD_LOGIC; 
  signal N6 : STD_LOGIC; 
  signal N8 : STD_LOGIC; 
  signal N9 : STD_LOGIC; 
  signal U_AG_SI_Madd_next_addr_current_addsub0000_cy_10_rt_8 : STD_LOGIC; 
  signal U_AG_SI_Madd_next_addr_current_addsub0000_cy_11_rt_10 : STD_LOGIC; 
  signal U_AG_SI_Madd_next_addr_current_addsub0000_cy_12_rt_12 : STD_LOGIC; 
  signal U_AG_SI_Madd_next_addr_current_addsub0000_cy_13_rt_14 : STD_LOGIC; 
  signal U_AG_SI_Madd_next_addr_current_addsub0000_cy_14_rt_16 : STD_LOGIC; 
  signal U_AG_SI_Madd_next_addr_current_addsub0000_cy_15_rt_18 : STD_LOGIC; 
  signal U_AG_SI_Madd_next_addr_current_addsub0000_cy_16_rt_20 : STD_LOGIC; 
  signal U_AG_SI_Madd_next_addr_current_addsub0000_cy_17_rt_22 : STD_LOGIC; 
  signal U_AG_SI_Madd_next_addr_current_addsub0000_cy_18_rt_24 : STD_LOGIC; 
  signal U_AG_SI_Madd_next_addr_current_addsub0000_cy_19_rt_26 : STD_LOGIC; 
  signal U_AG_SI_Madd_next_addr_current_addsub0000_cy_2_rt_29 : STD_LOGIC; 
  signal U_AG_SI_Madd_next_addr_current_addsub0000_cy_3_rt_31 : STD_LOGIC; 
  signal U_AG_SI_Madd_next_addr_current_addsub0000_cy_4_rt_33 : STD_LOGIC; 
  signal U_AG_SI_Madd_next_addr_current_addsub0000_cy_5_rt_35 : STD_LOGIC; 
  signal U_AG_SI_Madd_next_addr_current_addsub0000_cy_6_rt_37 : STD_LOGIC; 
  signal U_AG_SI_Madd_next_addr_current_addsub0000_cy_7_rt_39 : STD_LOGIC; 
  signal U_AG_SI_Madd_next_addr_current_addsub0000_cy_8_rt_41 : STD_LOGIC; 
  signal U_AG_SI_Madd_next_addr_current_addsub0000_cy_9_rt_43 : STD_LOGIC; 
  signal U_AG_SI_Madd_next_addr_current_addsub0000_xor_20_rt_45 : STD_LOGIC; 
  signal U_AG_SI_next_addr_current_10_271 : STD_LOGIC; 
  signal U_AG_SI_next_addr_current_11_271 : STD_LOGIC; 
  signal U_AG_SI_next_addr_current_12_271 : STD_LOGIC; 
  signal U_AG_SI_next_addr_current_13_271 : STD_LOGIC; 
  signal U_AG_SI_next_addr_current_14_271 : STD_LOGIC; 
  signal U_AG_SI_next_addr_current_15_271 : STD_LOGIC; 
  signal U_AG_SI_next_addr_current_16_271 : STD_LOGIC; 
  signal U_AG_SI_next_addr_current_17_271 : STD_LOGIC; 
  signal U_AG_SI_next_addr_current_18_271 : STD_LOGIC; 
  signal U_AG_SI_next_addr_current_19_271 : STD_LOGIC; 
  signal U_AG_SI_next_addr_current_1_271 : STD_LOGIC; 
  signal U_AG_SI_next_addr_current_20_271 : STD_LOGIC; 
  signal U_AG_SI_next_addr_current_2_271 : STD_LOGIC; 
  signal U_AG_SI_next_addr_current_3_271 : STD_LOGIC; 
  signal U_AG_SI_next_addr_current_4_271 : STD_LOGIC; 
  signal U_AG_SI_next_addr_current_5_271 : STD_LOGIC; 
  signal U_AG_SI_next_addr_current_6_271 : STD_LOGIC; 
  signal U_AG_SI_next_addr_current_7_271 : STD_LOGIC; 
  signal U_AG_SI_next_addr_current_8_271 : STD_LOGIC; 
  signal U_AG_SI_next_addr_current_9_271 : STD_LOGIC; 
  signal U_AG_SI_next_state : STD_LOGIC; 
  signal U_DONE_COUNT_Mcount_count : STD_LOGIC; 
  signal U_DONE_COUNT_Mcount_count1 : STD_LOGIC; 
  signal U_DONE_COUNT_Mcount_count10 : STD_LOGIC; 
  signal U_DONE_COUNT_Mcount_count11 : STD_LOGIC; 
  signal U_DONE_COUNT_Mcount_count12 : STD_LOGIC; 
  signal U_DONE_COUNT_Mcount_count13 : STD_LOGIC; 
  signal U_DONE_COUNT_Mcount_count14 : STD_LOGIC; 
  signal U_DONE_COUNT_Mcount_count15 : STD_LOGIC; 
  signal U_DONE_COUNT_Mcount_count16 : STD_LOGIC; 
  signal U_DONE_COUNT_Mcount_count17 : STD_LOGIC; 
  signal U_DONE_COUNT_Mcount_count18 : STD_LOGIC; 
  signal U_DONE_COUNT_Mcount_count19 : STD_LOGIC; 
  signal U_DONE_COUNT_Mcount_count2 : STD_LOGIC; 
  signal U_DONE_COUNT_Mcount_count20 : STD_LOGIC; 
  signal U_DONE_COUNT_Mcount_count21 : STD_LOGIC; 
  signal U_DONE_COUNT_Mcount_count22 : STD_LOGIC; 
  signal U_DONE_COUNT_Mcount_count23 : STD_LOGIC; 
  signal U_DONE_COUNT_Mcount_count24 : STD_LOGIC; 
  signal U_DONE_COUNT_Mcount_count25 : STD_LOGIC; 
  signal U_DONE_COUNT_Mcount_count26 : STD_LOGIC; 
  signal U_DONE_COUNT_Mcount_count27 : STD_LOGIC; 
  signal U_DONE_COUNT_Mcount_count28 : STD_LOGIC; 
  signal U_DONE_COUNT_Mcount_count29 : STD_LOGIC; 
  signal U_DONE_COUNT_Mcount_count3 : STD_LOGIC; 
  signal U_DONE_COUNT_Mcount_count30 : STD_LOGIC; 
  signal U_DONE_COUNT_Mcount_count31 : STD_LOGIC; 
  signal U_DONE_COUNT_Mcount_count4 : STD_LOGIC; 
  signal U_DONE_COUNT_Mcount_count5 : STD_LOGIC; 
  signal U_DONE_COUNT_Mcount_count6 : STD_LOGIC; 
  signal U_DONE_COUNT_Mcount_count7 : STD_LOGIC; 
  signal U_DONE_COUNT_Mcount_count8 : STD_LOGIC; 
  signal U_DONE_COUNT_Mcount_count9 : STD_LOGIC; 
  signal U_DONE_COUNT_count_0_rstpot_289 : STD_LOGIC; 
  signal U_DONE_COUNT_count_10_rstpot_292 : STD_LOGIC; 
  signal U_DONE_COUNT_count_11_rstpot_294 : STD_LOGIC; 
  signal U_DONE_COUNT_count_12_rstpot_296 : STD_LOGIC; 
  signal U_DONE_COUNT_count_13_rstpot_298 : STD_LOGIC; 
  signal U_DONE_COUNT_count_14_rstpot_300 : STD_LOGIC; 
  signal U_DONE_COUNT_count_15_rstpot_302 : STD_LOGIC; 
  signal U_DONE_COUNT_count_16_rstpot_304 : STD_LOGIC; 
  signal U_DONE_COUNT_count_17_rstpot_306 : STD_LOGIC; 
  signal U_DONE_COUNT_count_18_rstpot_308 : STD_LOGIC; 
  signal U_DONE_COUNT_count_19_rstpot_310 : STD_LOGIC; 
  signal U_DONE_COUNT_count_1_rstpot_311 : STD_LOGIC; 
  signal U_DONE_COUNT_count_20_rstpot_314 : STD_LOGIC; 
  signal U_DONE_COUNT_count_21_rstpot_316 : STD_LOGIC; 
  signal U_DONE_COUNT_count_22_rstpot_318 : STD_LOGIC; 
  signal U_DONE_COUNT_count_23_rstpot_320 : STD_LOGIC; 
  signal U_DONE_COUNT_count_24_rstpot_322 : STD_LOGIC; 
  signal U_DONE_COUNT_count_2_rstpot_328 : STD_LOGIC; 
  signal U_DONE_COUNT_count_3_rstpot_332 : STD_LOGIC; 
  signal U_DONE_COUNT_count_4_rstpot_334 : STD_LOGIC; 
  signal U_DONE_COUNT_count_5_rstpot_336 : STD_LOGIC; 
  signal U_DONE_COUNT_count_6_rstpot_338 : STD_LOGIC; 
  signal U_DONE_COUNT_count_7_rstpot_340 : STD_LOGIC; 
  signal U_DONE_COUNT_count_8_rstpot_342 : STD_LOGIC; 
  signal U_DONE_COUNT_count_9_rstpot_344 : STD_LOGIC; 
  signal U_DONE_COUNT_count_not0001 : STD_LOGIC; 
  signal U_DONE_COUNT_count_not00011_346 : STD_LOGIC; 
  signal U_HANDSHAKE_got_it_tg_353 : STD_LOGIC; 
  signal U_HANDSHAKE_got_it_tg_ff_354 : STD_LOGIC; 
  signal U_HANDSHAKE_got_it_tg_not0001 : STD_LOGIC; 
  signal U_HANDSHAKE_next_state : STD_LOGIC; 
  signal U_HANDSHAKE_start_pl : STD_LOGIC; 
  signal U_HANDSHAKE_take_it_tg_359 : STD_LOGIC; 
  signal U_HANDSHAKE_take_it_tg_ff_360 : STD_LOGIC; 
  signal U_HANDSHAKE_take_it_tg_not0001 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_N0 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_not0001_478 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_next_count_2_1_482 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_next_count_2_2_483 : STD_LOGIC; 
  signal ag_stall : STD_LOGIC; 
  signal busy_485 : STD_LOGIC; 
  signal busy_mux0001_486 : STD_LOGIC; 
  signal clear_inv : STD_LOGIC; 
  signal done_s : STD_LOGIC; 
  signal handshake_go_508 : STD_LOGIC; 
  signal handshake_go_mux0001 : STD_LOGIC; 
  signal handshake_rcv : STD_LOGIC; 
  signal mem_fifo_empty : STD_LOGIC; 
  signal mem_fifo_prog_full : STD_LOGIC; 
  signal mem_fifo_rd : STD_LOGIC; 
  signal rst_s : STD_LOGIC; 
  signal NlwRenamedSig_OI_sram_rw_n : STD_LOGIC; 
  signal start_addr_s_not0001 : STD_LOGIC; 
  signal state_FSM_FFd1_782 : STD_LOGIC; 
  signal state_FSM_FFd1_In : STD_LOGIC; 
  signal state_FSM_FFd2_784 : STD_LOGIC; 
  signal state_FSM_FFd2_In_785 : STD_LOGIC; 
  signal width_fifo_empty : STD_LOGIC; 
  signal width_fifo_full : STD_LOGIC; 
  signal NLW_U_FIFO_full_UNCONNECTED : STD_LOGIC; 
  signal U_AG_SI_Madd_next_addr_current_addsub0000_cy : STD_LOGIC_VECTOR ( 19 downto 1 ); 
  signal U_AG_SI_Madd_next_addr_current_addsub0000_lut : STD_LOGIC_VECTOR ( 1 downto 1 ); 
  signal U_AG_SI_addr_current : STD_LOGIC_VECTOR ( 20 downto 0 ); 
  signal U_AG_SI_next_addr_current : STD_LOGIC_VECTOR ( 20 downto 0 ); 
  signal U_AG_SI_next_addr_current_addsub0000 : STD_LOGIC_VECTOR ( 20 downto 1 ); 
  signal U_AG_SI_state : STD_LOGIC_VECTOR ( 0 downto 0 ); 
  signal U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy : STD_LOGIC_VECTOR ( 30 downto 0 ); 
  signal U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut : STD_LOGIC_VECTOR ( 31 downto 0 ); 
  signal U_DONE_COUNT_Mcount_count_cy : STD_LOGIC_VECTOR ( 30 downto 0 ); 
  signal U_DONE_COUNT_Mcount_count_lut : STD_LOGIC_VECTOR ( 31 downto 0 ); 
  signal U_DONE_COUNT_count : STD_LOGIC_VECTOR ( 31 downto 0 ); 
  signal U_HANDSHAKE_U_GOT_IT_SYNC_cdc : STD_LOGIC_VECTOR ( 0 downto 0 ); 
  signal U_HANDSHAKE_U_GOT_IT_SYNC_output : STD_LOGIC_VECTOR ( 0 downto 0 ); 
  signal U_HANDSHAKE_U_GOT_IT_SYNC_sync1 : STD_LOGIC_VECTOR ( 0 downto 0 ); 
  signal U_HANDSHAKE_U_TAKE_IT_SYNC_cdc : STD_LOGIC_VECTOR ( 0 downto 0 ); 
  signal U_HANDSHAKE_U_TAKE_IT_SYNC_output : STD_LOGIC_VECTOR ( 0 downto 0 ); 
  signal U_HANDSHAKE_U_TAKE_IT_SYNC_sync1 : STD_LOGIC_VECTOR ( 0 downto 0 ); 
  signal U_HANDSHAKE_state : STD_LOGIC_VECTOR ( 0 downto 0 ); 
  signal U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_count : STD_LOGIC_VECTOR ( 2 downto 0 ); 
  signal U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data : STD_LOGIC_VECTOR ( 63 downto 16 ); 
  signal U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000 : STD_LOGIC_VECTOR ( 63 downto 0 ); 
  signal U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_next_count : STD_LOGIC_VECTOR ( 2 downto 0 ); 
  signal mem_fifo_out : STD_LOGIC_VECTOR ( 63 downto 0 ); 
  signal size_s : STD_LOGIC_VECTOR ( 31 downto 0 ); 
  signal NlwRenamedSig_OI_sram_bw_n : STD_LOGIC_VECTOR ( 0 downto 0 ); 
  signal start_addr_s : STD_LOGIC_VECTOR ( 20 downto 0 ); 
begin
  sram_rw_n <= NlwRenamedSig_OI_sram_rw_n;
  sram_wdata(63) <= NlwRenamedSig_OI_sram_bw_n(0);
  sram_wdata(62) <= NlwRenamedSig_OI_sram_bw_n(0);
  sram_wdata(61) <= NlwRenamedSig_OI_sram_bw_n(0);
  sram_wdata(60) <= NlwRenamedSig_OI_sram_bw_n(0);
  sram_wdata(59) <= NlwRenamedSig_OI_sram_bw_n(0);
  sram_wdata(58) <= NlwRenamedSig_OI_sram_bw_n(0);
  sram_wdata(57) <= NlwRenamedSig_OI_sram_bw_n(0);
  sram_wdata(56) <= NlwRenamedSig_OI_sram_bw_n(0);
  sram_wdata(55) <= NlwRenamedSig_OI_sram_bw_n(0);
  sram_wdata(54) <= NlwRenamedSig_OI_sram_bw_n(0);
  sram_wdata(53) <= NlwRenamedSig_OI_sram_bw_n(0);
  sram_wdata(52) <= NlwRenamedSig_OI_sram_bw_n(0);
  sram_wdata(51) <= NlwRenamedSig_OI_sram_bw_n(0);
  sram_wdata(50) <= NlwRenamedSig_OI_sram_bw_n(0);
  sram_wdata(49) <= NlwRenamedSig_OI_sram_bw_n(0);
  sram_wdata(48) <= NlwRenamedSig_OI_sram_bw_n(0);
  sram_wdata(47) <= NlwRenamedSig_OI_sram_bw_n(0);
  sram_wdata(46) <= NlwRenamedSig_OI_sram_bw_n(0);
  sram_wdata(45) <= NlwRenamedSig_OI_sram_bw_n(0);
  sram_wdata(44) <= NlwRenamedSig_OI_sram_bw_n(0);
  sram_wdata(43) <= NlwRenamedSig_OI_sram_bw_n(0);
  sram_wdata(42) <= NlwRenamedSig_OI_sram_bw_n(0);
  sram_wdata(41) <= NlwRenamedSig_OI_sram_bw_n(0);
  sram_wdata(40) <= NlwRenamedSig_OI_sram_bw_n(0);
  sram_wdata(39) <= NlwRenamedSig_OI_sram_bw_n(0);
  sram_wdata(38) <= NlwRenamedSig_OI_sram_bw_n(0);
  sram_wdata(37) <= NlwRenamedSig_OI_sram_bw_n(0);
  sram_wdata(36) <= NlwRenamedSig_OI_sram_bw_n(0);
  sram_wdata(35) <= NlwRenamedSig_OI_sram_bw_n(0);
  sram_wdata(34) <= NlwRenamedSig_OI_sram_bw_n(0);
  sram_wdata(33) <= NlwRenamedSig_OI_sram_bw_n(0);
  sram_wdata(32) <= NlwRenamedSig_OI_sram_bw_n(0);
  sram_wdata(31) <= NlwRenamedSig_OI_sram_bw_n(0);
  sram_wdata(30) <= NlwRenamedSig_OI_sram_bw_n(0);
  sram_wdata(29) <= NlwRenamedSig_OI_sram_bw_n(0);
  sram_wdata(28) <= NlwRenamedSig_OI_sram_bw_n(0);
  sram_wdata(27) <= NlwRenamedSig_OI_sram_bw_n(0);
  sram_wdata(26) <= NlwRenamedSig_OI_sram_bw_n(0);
  sram_wdata(25) <= NlwRenamedSig_OI_sram_bw_n(0);
  sram_wdata(24) <= NlwRenamedSig_OI_sram_bw_n(0);
  sram_wdata(23) <= NlwRenamedSig_OI_sram_bw_n(0);
  sram_wdata(22) <= NlwRenamedSig_OI_sram_bw_n(0);
  sram_wdata(21) <= NlwRenamedSig_OI_sram_bw_n(0);
  sram_wdata(20) <= NlwRenamedSig_OI_sram_bw_n(0);
  sram_wdata(19) <= NlwRenamedSig_OI_sram_bw_n(0);
  sram_wdata(18) <= NlwRenamedSig_OI_sram_bw_n(0);
  sram_wdata(17) <= NlwRenamedSig_OI_sram_bw_n(0);
  sram_wdata(16) <= NlwRenamedSig_OI_sram_bw_n(0);
  sram_wdata(15) <= NlwRenamedSig_OI_sram_bw_n(0);
  sram_wdata(14) <= NlwRenamedSig_OI_sram_bw_n(0);
  sram_wdata(13) <= NlwRenamedSig_OI_sram_bw_n(0);
  sram_wdata(12) <= NlwRenamedSig_OI_sram_bw_n(0);
  sram_wdata(11) <= NlwRenamedSig_OI_sram_bw_n(0);
  sram_wdata(10) <= NlwRenamedSig_OI_sram_bw_n(0);
  sram_wdata(9) <= NlwRenamedSig_OI_sram_bw_n(0);
  sram_wdata(8) <= NlwRenamedSig_OI_sram_bw_n(0);
  sram_wdata(7) <= NlwRenamedSig_OI_sram_bw_n(0);
  sram_wdata(6) <= NlwRenamedSig_OI_sram_bw_n(0);
  sram_wdata(5) <= NlwRenamedSig_OI_sram_bw_n(0);
  sram_wdata(4) <= NlwRenamedSig_OI_sram_bw_n(0);
  sram_wdata(3) <= NlwRenamedSig_OI_sram_bw_n(0);
  sram_wdata(2) <= NlwRenamedSig_OI_sram_bw_n(0);
  sram_wdata(1) <= NlwRenamedSig_OI_sram_bw_n(0);
  sram_wdata(0) <= NlwRenamedSig_OI_sram_bw_n(0);
  sram_bw_n(7) <= NlwRenamedSig_OI_sram_bw_n(0);
  sram_bw_n(6) <= NlwRenamedSig_OI_sram_bw_n(0);
  sram_bw_n(5) <= NlwRenamedSig_OI_sram_bw_n(0);
  sram_bw_n(4) <= NlwRenamedSig_OI_sram_bw_n(0);
  sram_bw_n(3) <= NlwRenamedSig_OI_sram_bw_n(0);
  sram_bw_n(2) <= NlwRenamedSig_OI_sram_bw_n(0);
  sram_bw_n(1) <= NlwRenamedSig_OI_sram_bw_n(0);
  sram_bw_n(0) <= NlwRenamedSig_OI_sram_bw_n(0);
  XST_GND : GND
    port map (
      G => NlwRenamedSig_OI_sram_bw_n(0)
    );
  start_addr_s_0 : FDCE
    port map (
      C => user_clk,
      CE => start_addr_s_not0001,
      CLR => rst,
      D => start_addr(0),
      Q => start_addr_s(0)
    );
  start_addr_s_1 : FDCE
    port map (
      C => user_clk,
      CE => start_addr_s_not0001,
      CLR => rst,
      D => start_addr(1),
      Q => start_addr_s(1)
    );
  start_addr_s_2 : FDCE
    port map (
      C => user_clk,
      CE => start_addr_s_not0001,
      CLR => rst,
      D => start_addr(2),
      Q => start_addr_s(2)
    );
  start_addr_s_3 : FDCE
    port map (
      C => user_clk,
      CE => start_addr_s_not0001,
      CLR => rst,
      D => start_addr(3),
      Q => start_addr_s(3)
    );
  start_addr_s_4 : FDCE
    port map (
      C => user_clk,
      CE => start_addr_s_not0001,
      CLR => rst,
      D => start_addr(4),
      Q => start_addr_s(4)
    );
  start_addr_s_5 : FDCE
    port map (
      C => user_clk,
      CE => start_addr_s_not0001,
      CLR => rst,
      D => start_addr(5),
      Q => start_addr_s(5)
    );
  start_addr_s_6 : FDCE
    port map (
      C => user_clk,
      CE => start_addr_s_not0001,
      CLR => rst,
      D => start_addr(6),
      Q => start_addr_s(6)
    );
  start_addr_s_7 : FDCE
    port map (
      C => user_clk,
      CE => start_addr_s_not0001,
      CLR => rst,
      D => start_addr(7),
      Q => start_addr_s(7)
    );
  start_addr_s_8 : FDCE
    port map (
      C => user_clk,
      CE => start_addr_s_not0001,
      CLR => rst,
      D => start_addr(8),
      Q => start_addr_s(8)
    );
  start_addr_s_9 : FDCE
    port map (
      C => user_clk,
      CE => start_addr_s_not0001,
      CLR => rst,
      D => start_addr(9),
      Q => start_addr_s(9)
    );
  start_addr_s_10 : FDCE
    port map (
      C => user_clk,
      CE => start_addr_s_not0001,
      CLR => rst,
      D => start_addr(10),
      Q => start_addr_s(10)
    );
  start_addr_s_11 : FDCE
    port map (
      C => user_clk,
      CE => start_addr_s_not0001,
      CLR => rst,
      D => start_addr(11),
      Q => start_addr_s(11)
    );
  start_addr_s_12 : FDCE
    port map (
      C => user_clk,
      CE => start_addr_s_not0001,
      CLR => rst,
      D => start_addr(12),
      Q => start_addr_s(12)
    );
  start_addr_s_13 : FDCE
    port map (
      C => user_clk,
      CE => start_addr_s_not0001,
      CLR => rst,
      D => start_addr(13),
      Q => start_addr_s(13)
    );
  start_addr_s_14 : FDCE
    port map (
      C => user_clk,
      CE => start_addr_s_not0001,
      CLR => rst,
      D => start_addr(14),
      Q => start_addr_s(14)
    );
  start_addr_s_15 : FDCE
    port map (
      C => user_clk,
      CE => start_addr_s_not0001,
      CLR => rst,
      D => start_addr(15),
      Q => start_addr_s(15)
    );
  start_addr_s_16 : FDCE
    port map (
      C => user_clk,
      CE => start_addr_s_not0001,
      CLR => rst,
      D => start_addr(16),
      Q => start_addr_s(16)
    );
  start_addr_s_17 : FDCE
    port map (
      C => user_clk,
      CE => start_addr_s_not0001,
      CLR => rst,
      D => start_addr(17),
      Q => start_addr_s(17)
    );
  start_addr_s_18 : FDCE
    port map (
      C => user_clk,
      CE => start_addr_s_not0001,
      CLR => rst,
      D => start_addr(18),
      Q => start_addr_s(18)
    );
  start_addr_s_19 : FDCE
    port map (
      C => user_clk,
      CE => start_addr_s_not0001,
      CLR => rst,
      D => start_addr(19),
      Q => start_addr_s(19)
    );
  start_addr_s_20 : FDCE
    port map (
      C => user_clk,
      CE => start_addr_s_not0001,
      CLR => rst,
      D => start_addr(20),
      Q => start_addr_s(20)
    );
  size_s_0 : FDCE
    port map (
      C => user_clk,
      CE => start_addr_s_not0001,
      CLR => rst,
      D => size(0),
      Q => size_s(0)
    );
  size_s_1 : FDCE
    port map (
      C => user_clk,
      CE => start_addr_s_not0001,
      CLR => rst,
      D => size(1),
      Q => size_s(1)
    );
  size_s_2 : FDCE
    port map (
      C => user_clk,
      CE => start_addr_s_not0001,
      CLR => rst,
      D => size(2),
      Q => size_s(2)
    );
  size_s_3 : FDCE
    port map (
      C => user_clk,
      CE => start_addr_s_not0001,
      CLR => rst,
      D => size(3),
      Q => size_s(3)
    );
  size_s_4 : FDCE
    port map (
      C => user_clk,
      CE => start_addr_s_not0001,
      CLR => rst,
      D => size(4),
      Q => size_s(4)
    );
  size_s_5 : FDCE
    port map (
      C => user_clk,
      CE => start_addr_s_not0001,
      CLR => rst,
      D => size(5),
      Q => size_s(5)
    );
  size_s_6 : FDCE
    port map (
      C => user_clk,
      CE => start_addr_s_not0001,
      CLR => rst,
      D => size(6),
      Q => size_s(6)
    );
  size_s_7 : FDCE
    port map (
      C => user_clk,
      CE => start_addr_s_not0001,
      CLR => rst,
      D => size(7),
      Q => size_s(7)
    );
  size_s_8 : FDCE
    port map (
      C => user_clk,
      CE => start_addr_s_not0001,
      CLR => rst,
      D => size(8),
      Q => size_s(8)
    );
  size_s_9 : FDCE
    port map (
      C => user_clk,
      CE => start_addr_s_not0001,
      CLR => rst,
      D => size(9),
      Q => size_s(9)
    );
  size_s_10 : FDCE
    port map (
      C => user_clk,
      CE => start_addr_s_not0001,
      CLR => rst,
      D => size(10),
      Q => size_s(10)
    );
  size_s_11 : FDCE
    port map (
      C => user_clk,
      CE => start_addr_s_not0001,
      CLR => rst,
      D => size(11),
      Q => size_s(11)
    );
  size_s_12 : FDCE
    port map (
      C => user_clk,
      CE => start_addr_s_not0001,
      CLR => rst,
      D => size(12),
      Q => size_s(12)
    );
  size_s_13 : FDCE
    port map (
      C => user_clk,
      CE => start_addr_s_not0001,
      CLR => rst,
      D => size(13),
      Q => size_s(13)
    );
  size_s_14 : FDCE
    port map (
      C => user_clk,
      CE => start_addr_s_not0001,
      CLR => rst,
      D => size(14),
      Q => size_s(14)
    );
  size_s_15 : FDCE
    port map (
      C => user_clk,
      CE => start_addr_s_not0001,
      CLR => rst,
      D => size(15),
      Q => size_s(15)
    );
  size_s_16 : FDCE
    port map (
      C => user_clk,
      CE => start_addr_s_not0001,
      CLR => rst,
      D => size(16),
      Q => size_s(16)
    );
  size_s_17 : FDCE
    port map (
      C => user_clk,
      CE => start_addr_s_not0001,
      CLR => rst,
      D => size(17),
      Q => size_s(17)
    );
  size_s_18 : FDCE
    port map (
      C => user_clk,
      CE => start_addr_s_not0001,
      CLR => rst,
      D => size(18),
      Q => size_s(18)
    );
  size_s_19 : FDCE
    port map (
      C => user_clk,
      CE => start_addr_s_not0001,
      CLR => rst,
      D => size(19),
      Q => size_s(19)
    );
  size_s_20 : FDCE
    port map (
      C => user_clk,
      CE => start_addr_s_not0001,
      CLR => rst,
      D => size(20),
      Q => size_s(20)
    );
  size_s_21 : FDCE
    port map (
      C => user_clk,
      CE => start_addr_s_not0001,
      CLR => rst,
      D => size(21),
      Q => size_s(21)
    );
  size_s_22 : FDCE
    port map (
      C => user_clk,
      CE => start_addr_s_not0001,
      CLR => rst,
      D => size(22),
      Q => size_s(22)
    );
  size_s_23 : FDCE
    port map (
      C => user_clk,
      CE => start_addr_s_not0001,
      CLR => rst,
      D => size(23),
      Q => size_s(23)
    );
  size_s_24 : FDCE
    port map (
      C => user_clk,
      CE => start_addr_s_not0001,
      CLR => rst,
      D => size(24),
      Q => size_s(24)
    );
  size_s_25 : FDCE
    port map (
      C => user_clk,
      CE => start_addr_s_not0001,
      CLR => rst,
      D => size(25),
      Q => size_s(25)
    );
  size_s_26 : FDCE
    port map (
      C => user_clk,
      CE => start_addr_s_not0001,
      CLR => rst,
      D => size(26),
      Q => size_s(26)
    );
  size_s_27 : FDCE
    port map (
      C => user_clk,
      CE => start_addr_s_not0001,
      CLR => rst,
      D => size(27),
      Q => size_s(27)
    );
  size_s_28 : FDCE
    port map (
      C => user_clk,
      CE => start_addr_s_not0001,
      CLR => rst,
      D => size(28),
      Q => size_s(28)
    );
  size_s_29 : FDCE
    port map (
      C => user_clk,
      CE => start_addr_s_not0001,
      CLR => rst,
      D => size(29),
      Q => size_s(29)
    );
  size_s_30 : FDCE
    port map (
      C => user_clk,
      CE => start_addr_s_not0001,
      CLR => rst,
      D => size(30),
      Q => size_s(30)
    );
  size_s_31 : FDCE
    port map (
      C => user_clk,
      CE => start_addr_s_not0001,
      CLR => rst,
      D => size(31),
      Q => size_s(31)
    );
  busy : FDP
    port map (
      C => user_clk,
      D => busy_mux0001_486,
      PRE => rst,
      Q => busy_485
    );
  handshake_go : FDC
    port map (
      C => user_clk,
      CLR => rst,
      D => handshake_go_mux0001,
      Q => handshake_go_508
    );
  XST_VCC : VCC
    port map (
      P => NlwRenamedSig_OI_sram_rw_n
    );
  state_FSM_FFd1 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => user_clk,
      CLR => rst,
      D => state_FSM_FFd1_In,
      Q => state_FSM_FFd1_782
    );
  state_FSM_FFd2 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => user_clk,
      CLR => rst,
      D => state_FSM_FFd2_In_785,
      Q => state_FSM_FFd2_784
    );
  U_HANDSHAKE_U_TAKE_IT_SYNC_cdc_0 : FDCE
    port map (
      C => user_clk,
      CE => NlwRenamedSig_OI_sram_rw_n,
      CLR => rst_s,
      D => U_HANDSHAKE_take_it_tg_359,
      Q => U_HANDSHAKE_U_TAKE_IT_SYNC_cdc(0)
    );
  U_HANDSHAKE_U_TAKE_IT_SYNC_sync1_0 : FDC
    port map (
      C => sram_clk,
      CLR => rst_s,
      D => U_HANDSHAKE_U_TAKE_IT_SYNC_cdc(0),
      Q => U_HANDSHAKE_U_TAKE_IT_SYNC_sync1(0)
    );
  U_HANDSHAKE_U_TAKE_IT_SYNC_output_0 : FDC
    port map (
      C => sram_clk,
      CLR => rst_s,
      D => U_HANDSHAKE_U_TAKE_IT_SYNC_sync1(0),
      Q => U_HANDSHAKE_U_TAKE_IT_SYNC_output(0)
    );
  U_HANDSHAKE_U_GOT_IT_SYNC_cdc_0 : FDCE
    port map (
      C => sram_clk,
      CE => NlwRenamedSig_OI_sram_rw_n,
      CLR => rst_s,
      D => U_HANDSHAKE_got_it_tg_353,
      Q => U_HANDSHAKE_U_GOT_IT_SYNC_cdc(0)
    );
  U_HANDSHAKE_U_GOT_IT_SYNC_sync1_0 : FDC
    port map (
      C => user_clk,
      CLR => rst_s,
      D => U_HANDSHAKE_U_GOT_IT_SYNC_cdc(0),
      Q => U_HANDSHAKE_U_GOT_IT_SYNC_sync1(0)
    );
  U_HANDSHAKE_U_GOT_IT_SYNC_output_0 : FDC
    port map (
      C => user_clk,
      CLR => rst_s,
      D => U_HANDSHAKE_U_GOT_IT_SYNC_sync1(0),
      Q => U_HANDSHAKE_U_GOT_IT_SYNC_output(0)
    );
  U_HANDSHAKE_got_it_tg_ff : FDC
    port map (
      C => user_clk,
      CLR => rst_s,
      D => U_HANDSHAKE_U_GOT_IT_SYNC_output(0),
      Q => U_HANDSHAKE_got_it_tg_ff_354
    );
  U_HANDSHAKE_take_it_tg_ff : FDC
    port map (
      C => sram_clk,
      CLR => rst_s,
      D => U_HANDSHAKE_U_TAKE_IT_SYNC_output(0),
      Q => U_HANDSHAKE_take_it_tg_ff_360
    );
  U_HANDSHAKE_got_it_tg : FDCE
    port map (
      C => sram_clk,
      CE => handshake_rcv,
      CLR => rst_s,
      D => U_HANDSHAKE_got_it_tg_not0001,
      Q => U_HANDSHAKE_got_it_tg_353
    );
  U_HANDSHAKE_state_0 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => user_clk,
      CLR => rst_s,
      D => U_HANDSHAKE_next_state,
      Q => U_HANDSHAKE_state(0)
    );
  U_HANDSHAKE_take_it_tg : FDCE
    port map (
      C => user_clk,
      CE => U_HANDSHAKE_start_pl,
      CLR => rst_s,
      D => U_HANDSHAKE_take_it_tg_not0001,
      Q => U_HANDSHAKE_take_it_tg_359
    );
  U_DONE_COUNT_Mcount_count_cy_0_Q : MUXCY
    port map (
      CI => clear_inv,
      DI => NlwRenamedSig_OI_sram_bw_n(0),
      S => U_DONE_COUNT_Mcount_count_lut(0),
      O => U_DONE_COUNT_Mcount_count_cy(0)
    );
  U_DONE_COUNT_Mcount_count_xor_0_Q : XORCY
    port map (
      CI => clear_inv,
      LI => U_DONE_COUNT_Mcount_count_lut(0),
      O => U_DONE_COUNT_Mcount_count
    );
  U_DONE_COUNT_Mcount_count_cy_1_Q : MUXCY
    port map (
      CI => U_DONE_COUNT_Mcount_count_cy(0),
      DI => NlwRenamedSig_OI_sram_bw_n(0),
      S => U_DONE_COUNT_Mcount_count_lut(1),
      O => U_DONE_COUNT_Mcount_count_cy(1)
    );
  U_DONE_COUNT_Mcount_count_xor_1_Q : XORCY
    port map (
      CI => U_DONE_COUNT_Mcount_count_cy(0),
      LI => U_DONE_COUNT_Mcount_count_lut(1),
      O => U_DONE_COUNT_Mcount_count1
    );
  U_DONE_COUNT_Mcount_count_cy_2_Q : MUXCY
    port map (
      CI => U_DONE_COUNT_Mcount_count_cy(1),
      DI => NlwRenamedSig_OI_sram_bw_n(0),
      S => U_DONE_COUNT_Mcount_count_lut(2),
      O => U_DONE_COUNT_Mcount_count_cy(2)
    );
  U_DONE_COUNT_Mcount_count_xor_2_Q : XORCY
    port map (
      CI => U_DONE_COUNT_Mcount_count_cy(1),
      LI => U_DONE_COUNT_Mcount_count_lut(2),
      O => U_DONE_COUNT_Mcount_count2
    );
  U_DONE_COUNT_Mcount_count_cy_3_Q : MUXCY
    port map (
      CI => U_DONE_COUNT_Mcount_count_cy(2),
      DI => NlwRenamedSig_OI_sram_bw_n(0),
      S => U_DONE_COUNT_Mcount_count_lut(3),
      O => U_DONE_COUNT_Mcount_count_cy(3)
    );
  U_DONE_COUNT_Mcount_count_xor_3_Q : XORCY
    port map (
      CI => U_DONE_COUNT_Mcount_count_cy(2),
      LI => U_DONE_COUNT_Mcount_count_lut(3),
      O => U_DONE_COUNT_Mcount_count3
    );
  U_DONE_COUNT_Mcount_count_cy_4_Q : MUXCY
    port map (
      CI => U_DONE_COUNT_Mcount_count_cy(3),
      DI => NlwRenamedSig_OI_sram_bw_n(0),
      S => U_DONE_COUNT_Mcount_count_lut(4),
      O => U_DONE_COUNT_Mcount_count_cy(4)
    );
  U_DONE_COUNT_Mcount_count_xor_4_Q : XORCY
    port map (
      CI => U_DONE_COUNT_Mcount_count_cy(3),
      LI => U_DONE_COUNT_Mcount_count_lut(4),
      O => U_DONE_COUNT_Mcount_count4
    );
  U_DONE_COUNT_Mcount_count_lut_5_Q : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => clear,
      I1 => U_DONE_COUNT_count(5),
      I2 => NlwRenamedSig_OI_sram_bw_n(0),
      O => U_DONE_COUNT_Mcount_count_lut(5)
    );
  U_DONE_COUNT_Mcount_count_cy_5_Q : MUXCY
    port map (
      CI => U_DONE_COUNT_Mcount_count_cy(4),
      DI => NlwRenamedSig_OI_sram_bw_n(0),
      S => U_DONE_COUNT_Mcount_count_lut(5),
      O => U_DONE_COUNT_Mcount_count_cy(5)
    );
  U_DONE_COUNT_Mcount_count_xor_5_Q : XORCY
    port map (
      CI => U_DONE_COUNT_Mcount_count_cy(4),
      LI => U_DONE_COUNT_Mcount_count_lut(5),
      O => U_DONE_COUNT_Mcount_count5
    );
  U_DONE_COUNT_Mcount_count_lut_6_Q : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => clear,
      I1 => U_DONE_COUNT_count(6),
      I2 => NlwRenamedSig_OI_sram_bw_n(0),
      O => U_DONE_COUNT_Mcount_count_lut(6)
    );
  U_DONE_COUNT_Mcount_count_cy_6_Q : MUXCY
    port map (
      CI => U_DONE_COUNT_Mcount_count_cy(5),
      DI => NlwRenamedSig_OI_sram_bw_n(0),
      S => U_DONE_COUNT_Mcount_count_lut(6),
      O => U_DONE_COUNT_Mcount_count_cy(6)
    );
  U_DONE_COUNT_Mcount_count_xor_6_Q : XORCY
    port map (
      CI => U_DONE_COUNT_Mcount_count_cy(5),
      LI => U_DONE_COUNT_Mcount_count_lut(6),
      O => U_DONE_COUNT_Mcount_count6
    );
  U_DONE_COUNT_Mcount_count_lut_7_Q : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => clear,
      I1 => U_DONE_COUNT_count(7),
      I2 => NlwRenamedSig_OI_sram_bw_n(0),
      O => U_DONE_COUNT_Mcount_count_lut(7)
    );
  U_DONE_COUNT_Mcount_count_cy_7_Q : MUXCY
    port map (
      CI => U_DONE_COUNT_Mcount_count_cy(6),
      DI => NlwRenamedSig_OI_sram_bw_n(0),
      S => U_DONE_COUNT_Mcount_count_lut(7),
      O => U_DONE_COUNT_Mcount_count_cy(7)
    );
  U_DONE_COUNT_Mcount_count_xor_7_Q : XORCY
    port map (
      CI => U_DONE_COUNT_Mcount_count_cy(6),
      LI => U_DONE_COUNT_Mcount_count_lut(7),
      O => U_DONE_COUNT_Mcount_count7
    );
  U_DONE_COUNT_Mcount_count_lut_8_Q : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => clear,
      I1 => U_DONE_COUNT_count(8),
      I2 => NlwRenamedSig_OI_sram_bw_n(0),
      O => U_DONE_COUNT_Mcount_count_lut(8)
    );
  U_DONE_COUNT_Mcount_count_cy_8_Q : MUXCY
    port map (
      CI => U_DONE_COUNT_Mcount_count_cy(7),
      DI => NlwRenamedSig_OI_sram_bw_n(0),
      S => U_DONE_COUNT_Mcount_count_lut(8),
      O => U_DONE_COUNT_Mcount_count_cy(8)
    );
  U_DONE_COUNT_Mcount_count_xor_8_Q : XORCY
    port map (
      CI => U_DONE_COUNT_Mcount_count_cy(7),
      LI => U_DONE_COUNT_Mcount_count_lut(8),
      O => U_DONE_COUNT_Mcount_count8
    );
  U_DONE_COUNT_Mcount_count_lut_9_Q : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => clear,
      I1 => U_DONE_COUNT_count(9),
      I2 => NlwRenamedSig_OI_sram_bw_n(0),
      O => U_DONE_COUNT_Mcount_count_lut(9)
    );
  U_DONE_COUNT_Mcount_count_cy_9_Q : MUXCY
    port map (
      CI => U_DONE_COUNT_Mcount_count_cy(8),
      DI => NlwRenamedSig_OI_sram_bw_n(0),
      S => U_DONE_COUNT_Mcount_count_lut(9),
      O => U_DONE_COUNT_Mcount_count_cy(9)
    );
  U_DONE_COUNT_Mcount_count_xor_9_Q : XORCY
    port map (
      CI => U_DONE_COUNT_Mcount_count_cy(8),
      LI => U_DONE_COUNT_Mcount_count_lut(9),
      O => U_DONE_COUNT_Mcount_count9
    );
  U_DONE_COUNT_Mcount_count_lut_10_Q : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => clear,
      I1 => U_DONE_COUNT_count(10),
      I2 => NlwRenamedSig_OI_sram_bw_n(0),
      O => U_DONE_COUNT_Mcount_count_lut(10)
    );
  U_DONE_COUNT_Mcount_count_cy_10_Q : MUXCY
    port map (
      CI => U_DONE_COUNT_Mcount_count_cy(9),
      DI => NlwRenamedSig_OI_sram_bw_n(0),
      S => U_DONE_COUNT_Mcount_count_lut(10),
      O => U_DONE_COUNT_Mcount_count_cy(10)
    );
  U_DONE_COUNT_Mcount_count_xor_10_Q : XORCY
    port map (
      CI => U_DONE_COUNT_Mcount_count_cy(9),
      LI => U_DONE_COUNT_Mcount_count_lut(10),
      O => U_DONE_COUNT_Mcount_count10
    );
  U_DONE_COUNT_Mcount_count_lut_11_Q : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => clear,
      I1 => U_DONE_COUNT_count(11),
      I2 => NlwRenamedSig_OI_sram_bw_n(0),
      O => U_DONE_COUNT_Mcount_count_lut(11)
    );
  U_DONE_COUNT_Mcount_count_cy_11_Q : MUXCY
    port map (
      CI => U_DONE_COUNT_Mcount_count_cy(10),
      DI => NlwRenamedSig_OI_sram_bw_n(0),
      S => U_DONE_COUNT_Mcount_count_lut(11),
      O => U_DONE_COUNT_Mcount_count_cy(11)
    );
  U_DONE_COUNT_Mcount_count_xor_11_Q : XORCY
    port map (
      CI => U_DONE_COUNT_Mcount_count_cy(10),
      LI => U_DONE_COUNT_Mcount_count_lut(11),
      O => U_DONE_COUNT_Mcount_count11
    );
  U_DONE_COUNT_Mcount_count_lut_12_Q : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => clear,
      I1 => U_DONE_COUNT_count(12),
      I2 => NlwRenamedSig_OI_sram_bw_n(0),
      O => U_DONE_COUNT_Mcount_count_lut(12)
    );
  U_DONE_COUNT_Mcount_count_cy_12_Q : MUXCY
    port map (
      CI => U_DONE_COUNT_Mcount_count_cy(11),
      DI => NlwRenamedSig_OI_sram_bw_n(0),
      S => U_DONE_COUNT_Mcount_count_lut(12),
      O => U_DONE_COUNT_Mcount_count_cy(12)
    );
  U_DONE_COUNT_Mcount_count_xor_12_Q : XORCY
    port map (
      CI => U_DONE_COUNT_Mcount_count_cy(11),
      LI => U_DONE_COUNT_Mcount_count_lut(12),
      O => U_DONE_COUNT_Mcount_count12
    );
  U_DONE_COUNT_Mcount_count_lut_13_Q : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => clear,
      I1 => U_DONE_COUNT_count(13),
      I2 => NlwRenamedSig_OI_sram_bw_n(0),
      O => U_DONE_COUNT_Mcount_count_lut(13)
    );
  U_DONE_COUNT_Mcount_count_cy_13_Q : MUXCY
    port map (
      CI => U_DONE_COUNT_Mcount_count_cy(12),
      DI => NlwRenamedSig_OI_sram_bw_n(0),
      S => U_DONE_COUNT_Mcount_count_lut(13),
      O => U_DONE_COUNT_Mcount_count_cy(13)
    );
  U_DONE_COUNT_Mcount_count_xor_13_Q : XORCY
    port map (
      CI => U_DONE_COUNT_Mcount_count_cy(12),
      LI => U_DONE_COUNT_Mcount_count_lut(13),
      O => U_DONE_COUNT_Mcount_count13
    );
  U_DONE_COUNT_Mcount_count_lut_14_Q : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => clear,
      I1 => U_DONE_COUNT_count(14),
      I2 => NlwRenamedSig_OI_sram_bw_n(0),
      O => U_DONE_COUNT_Mcount_count_lut(14)
    );
  U_DONE_COUNT_Mcount_count_cy_14_Q : MUXCY
    port map (
      CI => U_DONE_COUNT_Mcount_count_cy(13),
      DI => NlwRenamedSig_OI_sram_bw_n(0),
      S => U_DONE_COUNT_Mcount_count_lut(14),
      O => U_DONE_COUNT_Mcount_count_cy(14)
    );
  U_DONE_COUNT_Mcount_count_xor_14_Q : XORCY
    port map (
      CI => U_DONE_COUNT_Mcount_count_cy(13),
      LI => U_DONE_COUNT_Mcount_count_lut(14),
      O => U_DONE_COUNT_Mcount_count14
    );
  U_DONE_COUNT_Mcount_count_lut_15_Q : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => clear,
      I1 => U_DONE_COUNT_count(15),
      I2 => NlwRenamedSig_OI_sram_bw_n(0),
      O => U_DONE_COUNT_Mcount_count_lut(15)
    );
  U_DONE_COUNT_Mcount_count_cy_15_Q : MUXCY
    port map (
      CI => U_DONE_COUNT_Mcount_count_cy(14),
      DI => NlwRenamedSig_OI_sram_bw_n(0),
      S => U_DONE_COUNT_Mcount_count_lut(15),
      O => U_DONE_COUNT_Mcount_count_cy(15)
    );
  U_DONE_COUNT_Mcount_count_xor_15_Q : XORCY
    port map (
      CI => U_DONE_COUNT_Mcount_count_cy(14),
      LI => U_DONE_COUNT_Mcount_count_lut(15),
      O => U_DONE_COUNT_Mcount_count15
    );
  U_DONE_COUNT_Mcount_count_lut_16_Q : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => clear,
      I1 => U_DONE_COUNT_count(16),
      I2 => NlwRenamedSig_OI_sram_bw_n(0),
      O => U_DONE_COUNT_Mcount_count_lut(16)
    );
  U_DONE_COUNT_Mcount_count_cy_16_Q : MUXCY
    port map (
      CI => U_DONE_COUNT_Mcount_count_cy(15),
      DI => NlwRenamedSig_OI_sram_bw_n(0),
      S => U_DONE_COUNT_Mcount_count_lut(16),
      O => U_DONE_COUNT_Mcount_count_cy(16)
    );
  U_DONE_COUNT_Mcount_count_xor_16_Q : XORCY
    port map (
      CI => U_DONE_COUNT_Mcount_count_cy(15),
      LI => U_DONE_COUNT_Mcount_count_lut(16),
      O => U_DONE_COUNT_Mcount_count16
    );
  U_DONE_COUNT_Mcount_count_lut_17_Q : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => clear,
      I1 => U_DONE_COUNT_count(17),
      I2 => NlwRenamedSig_OI_sram_bw_n(0),
      O => U_DONE_COUNT_Mcount_count_lut(17)
    );
  U_DONE_COUNT_Mcount_count_cy_17_Q : MUXCY
    port map (
      CI => U_DONE_COUNT_Mcount_count_cy(16),
      DI => NlwRenamedSig_OI_sram_bw_n(0),
      S => U_DONE_COUNT_Mcount_count_lut(17),
      O => U_DONE_COUNT_Mcount_count_cy(17)
    );
  U_DONE_COUNT_Mcount_count_xor_17_Q : XORCY
    port map (
      CI => U_DONE_COUNT_Mcount_count_cy(16),
      LI => U_DONE_COUNT_Mcount_count_lut(17),
      O => U_DONE_COUNT_Mcount_count17
    );
  U_DONE_COUNT_Mcount_count_lut_18_Q : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => clear,
      I1 => U_DONE_COUNT_count(18),
      I2 => NlwRenamedSig_OI_sram_bw_n(0),
      O => U_DONE_COUNT_Mcount_count_lut(18)
    );
  U_DONE_COUNT_Mcount_count_cy_18_Q : MUXCY
    port map (
      CI => U_DONE_COUNT_Mcount_count_cy(17),
      DI => NlwRenamedSig_OI_sram_bw_n(0),
      S => U_DONE_COUNT_Mcount_count_lut(18),
      O => U_DONE_COUNT_Mcount_count_cy(18)
    );
  U_DONE_COUNT_Mcount_count_xor_18_Q : XORCY
    port map (
      CI => U_DONE_COUNT_Mcount_count_cy(17),
      LI => U_DONE_COUNT_Mcount_count_lut(18),
      O => U_DONE_COUNT_Mcount_count18
    );
  U_DONE_COUNT_Mcount_count_lut_19_Q : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => clear,
      I1 => U_DONE_COUNT_count(19),
      I2 => NlwRenamedSig_OI_sram_bw_n(0),
      O => U_DONE_COUNT_Mcount_count_lut(19)
    );
  U_DONE_COUNT_Mcount_count_cy_19_Q : MUXCY
    port map (
      CI => U_DONE_COUNT_Mcount_count_cy(18),
      DI => NlwRenamedSig_OI_sram_bw_n(0),
      S => U_DONE_COUNT_Mcount_count_lut(19),
      O => U_DONE_COUNT_Mcount_count_cy(19)
    );
  U_DONE_COUNT_Mcount_count_xor_19_Q : XORCY
    port map (
      CI => U_DONE_COUNT_Mcount_count_cy(18),
      LI => U_DONE_COUNT_Mcount_count_lut(19),
      O => U_DONE_COUNT_Mcount_count19
    );
  U_DONE_COUNT_Mcount_count_lut_20_Q : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => clear,
      I1 => U_DONE_COUNT_count(20),
      I2 => NlwRenamedSig_OI_sram_bw_n(0),
      O => U_DONE_COUNT_Mcount_count_lut(20)
    );
  U_DONE_COUNT_Mcount_count_cy_20_Q : MUXCY
    port map (
      CI => U_DONE_COUNT_Mcount_count_cy(19),
      DI => NlwRenamedSig_OI_sram_bw_n(0),
      S => U_DONE_COUNT_Mcount_count_lut(20),
      O => U_DONE_COUNT_Mcount_count_cy(20)
    );
  U_DONE_COUNT_Mcount_count_xor_20_Q : XORCY
    port map (
      CI => U_DONE_COUNT_Mcount_count_cy(19),
      LI => U_DONE_COUNT_Mcount_count_lut(20),
      O => U_DONE_COUNT_Mcount_count20
    );
  U_DONE_COUNT_Mcount_count_lut_21_Q : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => clear,
      I1 => U_DONE_COUNT_count(21),
      I2 => NlwRenamedSig_OI_sram_bw_n(0),
      O => U_DONE_COUNT_Mcount_count_lut(21)
    );
  U_DONE_COUNT_Mcount_count_cy_21_Q : MUXCY
    port map (
      CI => U_DONE_COUNT_Mcount_count_cy(20),
      DI => NlwRenamedSig_OI_sram_bw_n(0),
      S => U_DONE_COUNT_Mcount_count_lut(21),
      O => U_DONE_COUNT_Mcount_count_cy(21)
    );
  U_DONE_COUNT_Mcount_count_xor_21_Q : XORCY
    port map (
      CI => U_DONE_COUNT_Mcount_count_cy(20),
      LI => U_DONE_COUNT_Mcount_count_lut(21),
      O => U_DONE_COUNT_Mcount_count21
    );
  U_DONE_COUNT_Mcount_count_lut_22_Q : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => clear,
      I1 => U_DONE_COUNT_count(22),
      I2 => NlwRenamedSig_OI_sram_bw_n(0),
      O => U_DONE_COUNT_Mcount_count_lut(22)
    );
  U_DONE_COUNT_Mcount_count_cy_22_Q : MUXCY
    port map (
      CI => U_DONE_COUNT_Mcount_count_cy(21),
      DI => NlwRenamedSig_OI_sram_bw_n(0),
      S => U_DONE_COUNT_Mcount_count_lut(22),
      O => U_DONE_COUNT_Mcount_count_cy(22)
    );
  U_DONE_COUNT_Mcount_count_xor_22_Q : XORCY
    port map (
      CI => U_DONE_COUNT_Mcount_count_cy(21),
      LI => U_DONE_COUNT_Mcount_count_lut(22),
      O => U_DONE_COUNT_Mcount_count22
    );
  U_DONE_COUNT_Mcount_count_lut_23_Q : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => clear,
      I1 => U_DONE_COUNT_count(23),
      I2 => NlwRenamedSig_OI_sram_bw_n(0),
      O => U_DONE_COUNT_Mcount_count_lut(23)
    );
  U_DONE_COUNT_Mcount_count_cy_23_Q : MUXCY
    port map (
      CI => U_DONE_COUNT_Mcount_count_cy(22),
      DI => NlwRenamedSig_OI_sram_bw_n(0),
      S => U_DONE_COUNT_Mcount_count_lut(23),
      O => U_DONE_COUNT_Mcount_count_cy(23)
    );
  U_DONE_COUNT_Mcount_count_xor_23_Q : XORCY
    port map (
      CI => U_DONE_COUNT_Mcount_count_cy(22),
      LI => U_DONE_COUNT_Mcount_count_lut(23),
      O => U_DONE_COUNT_Mcount_count23
    );
  U_DONE_COUNT_Mcount_count_lut_24_Q : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => clear,
      I1 => U_DONE_COUNT_count(24),
      I2 => NlwRenamedSig_OI_sram_bw_n(0),
      O => U_DONE_COUNT_Mcount_count_lut(24)
    );
  U_DONE_COUNT_Mcount_count_cy_24_Q : MUXCY
    port map (
      CI => U_DONE_COUNT_Mcount_count_cy(23),
      DI => NlwRenamedSig_OI_sram_bw_n(0),
      S => U_DONE_COUNT_Mcount_count_lut(24),
      O => U_DONE_COUNT_Mcount_count_cy(24)
    );
  U_DONE_COUNT_Mcount_count_xor_24_Q : XORCY
    port map (
      CI => U_DONE_COUNT_Mcount_count_cy(23),
      LI => U_DONE_COUNT_Mcount_count_lut(24),
      O => U_DONE_COUNT_Mcount_count24
    );
  U_DONE_COUNT_Mcount_count_lut_25_Q : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => clear,
      I1 => U_DONE_COUNT_count(25),
      I2 => NlwRenamedSig_OI_sram_bw_n(0),
      O => U_DONE_COUNT_Mcount_count_lut(25)
    );
  U_DONE_COUNT_Mcount_count_cy_25_Q : MUXCY
    port map (
      CI => U_DONE_COUNT_Mcount_count_cy(24),
      DI => NlwRenamedSig_OI_sram_bw_n(0),
      S => U_DONE_COUNT_Mcount_count_lut(25),
      O => U_DONE_COUNT_Mcount_count_cy(25)
    );
  U_DONE_COUNT_Mcount_count_xor_25_Q : XORCY
    port map (
      CI => U_DONE_COUNT_Mcount_count_cy(24),
      LI => U_DONE_COUNT_Mcount_count_lut(25),
      O => U_DONE_COUNT_Mcount_count25
    );
  U_DONE_COUNT_Mcount_count_lut_26_Q : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => clear,
      I1 => U_DONE_COUNT_count(26),
      I2 => NlwRenamedSig_OI_sram_bw_n(0),
      O => U_DONE_COUNT_Mcount_count_lut(26)
    );
  U_DONE_COUNT_Mcount_count_cy_26_Q : MUXCY
    port map (
      CI => U_DONE_COUNT_Mcount_count_cy(25),
      DI => NlwRenamedSig_OI_sram_bw_n(0),
      S => U_DONE_COUNT_Mcount_count_lut(26),
      O => U_DONE_COUNT_Mcount_count_cy(26)
    );
  U_DONE_COUNT_Mcount_count_xor_26_Q : XORCY
    port map (
      CI => U_DONE_COUNT_Mcount_count_cy(25),
      LI => U_DONE_COUNT_Mcount_count_lut(26),
      O => U_DONE_COUNT_Mcount_count26
    );
  U_DONE_COUNT_Mcount_count_lut_27_Q : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => clear,
      I1 => U_DONE_COUNT_count(27),
      I2 => NlwRenamedSig_OI_sram_bw_n(0),
      O => U_DONE_COUNT_Mcount_count_lut(27)
    );
  U_DONE_COUNT_Mcount_count_cy_27_Q : MUXCY
    port map (
      CI => U_DONE_COUNT_Mcount_count_cy(26),
      DI => NlwRenamedSig_OI_sram_bw_n(0),
      S => U_DONE_COUNT_Mcount_count_lut(27),
      O => U_DONE_COUNT_Mcount_count_cy(27)
    );
  U_DONE_COUNT_Mcount_count_xor_27_Q : XORCY
    port map (
      CI => U_DONE_COUNT_Mcount_count_cy(26),
      LI => U_DONE_COUNT_Mcount_count_lut(27),
      O => U_DONE_COUNT_Mcount_count27
    );
  U_DONE_COUNT_Mcount_count_lut_28_Q : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => clear,
      I1 => U_DONE_COUNT_count(28),
      I2 => NlwRenamedSig_OI_sram_bw_n(0),
      O => U_DONE_COUNT_Mcount_count_lut(28)
    );
  U_DONE_COUNT_Mcount_count_cy_28_Q : MUXCY
    port map (
      CI => U_DONE_COUNT_Mcount_count_cy(27),
      DI => NlwRenamedSig_OI_sram_bw_n(0),
      S => U_DONE_COUNT_Mcount_count_lut(28),
      O => U_DONE_COUNT_Mcount_count_cy(28)
    );
  U_DONE_COUNT_Mcount_count_xor_28_Q : XORCY
    port map (
      CI => U_DONE_COUNT_Mcount_count_cy(27),
      LI => U_DONE_COUNT_Mcount_count_lut(28),
      O => U_DONE_COUNT_Mcount_count28
    );
  U_DONE_COUNT_Mcount_count_lut_29_Q : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => clear,
      I1 => U_DONE_COUNT_count(29),
      I2 => NlwRenamedSig_OI_sram_bw_n(0),
      O => U_DONE_COUNT_Mcount_count_lut(29)
    );
  U_DONE_COUNT_Mcount_count_cy_29_Q : MUXCY
    port map (
      CI => U_DONE_COUNT_Mcount_count_cy(28),
      DI => NlwRenamedSig_OI_sram_bw_n(0),
      S => U_DONE_COUNT_Mcount_count_lut(29),
      O => U_DONE_COUNT_Mcount_count_cy(29)
    );
  U_DONE_COUNT_Mcount_count_xor_29_Q : XORCY
    port map (
      CI => U_DONE_COUNT_Mcount_count_cy(28),
      LI => U_DONE_COUNT_Mcount_count_lut(29),
      O => U_DONE_COUNT_Mcount_count29
    );
  U_DONE_COUNT_Mcount_count_lut_30_Q : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => clear,
      I1 => U_DONE_COUNT_count(30),
      I2 => NlwRenamedSig_OI_sram_bw_n(0),
      O => U_DONE_COUNT_Mcount_count_lut(30)
    );
  U_DONE_COUNT_Mcount_count_cy_30_Q : MUXCY
    port map (
      CI => U_DONE_COUNT_Mcount_count_cy(29),
      DI => NlwRenamedSig_OI_sram_bw_n(0),
      S => U_DONE_COUNT_Mcount_count_lut(30),
      O => U_DONE_COUNT_Mcount_count_cy(30)
    );
  U_DONE_COUNT_Mcount_count_xor_30_Q : XORCY
    port map (
      CI => U_DONE_COUNT_Mcount_count_cy(29),
      LI => U_DONE_COUNT_Mcount_count_lut(30),
      O => U_DONE_COUNT_Mcount_count30
    );
  U_DONE_COUNT_Mcount_count_lut_31_Q : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => clear,
      I1 => U_DONE_COUNT_count(31),
      I2 => NlwRenamedSig_OI_sram_bw_n(0),
      O => U_DONE_COUNT_Mcount_count_lut(31)
    );
  U_DONE_COUNT_Mcount_count_xor_31_Q : XORCY
    port map (
      CI => U_DONE_COUNT_Mcount_count_cy(30),
      LI => U_DONE_COUNT_Mcount_count_lut(31),
      O => U_DONE_COUNT_Mcount_count31
    );
  U_DONE_COUNT_count_25 : FDCE
    port map (
      C => user_clk,
      CE => U_DONE_COUNT_count_not0001,
      CLR => rst,
      D => U_DONE_COUNT_Mcount_count25,
      Q => U_DONE_COUNT_count(25)
    );
  U_DONE_COUNT_count_26 : FDCE
    port map (
      C => user_clk,
      CE => U_DONE_COUNT_count_not0001,
      CLR => rst,
      D => U_DONE_COUNT_Mcount_count26,
      Q => U_DONE_COUNT_count(26)
    );
  U_DONE_COUNT_count_27 : FDCE
    port map (
      C => user_clk,
      CE => U_DONE_COUNT_count_not0001,
      CLR => rst,
      D => U_DONE_COUNT_Mcount_count27,
      Q => U_DONE_COUNT_count(27)
    );
  U_DONE_COUNT_count_28 : FDCE
    port map (
      C => user_clk,
      CE => U_DONE_COUNT_count_not0001,
      CLR => rst,
      D => U_DONE_COUNT_Mcount_count28,
      Q => U_DONE_COUNT_count(28)
    );
  U_DONE_COUNT_count_29 : FDCE
    port map (
      C => user_clk,
      CE => U_DONE_COUNT_count_not0001,
      CLR => rst,
      D => U_DONE_COUNT_Mcount_count29,
      Q => U_DONE_COUNT_count(29)
    );
  U_DONE_COUNT_count_30 : FDCE
    port map (
      C => user_clk,
      CE => U_DONE_COUNT_count_not0001,
      CLR => rst,
      D => U_DONE_COUNT_Mcount_count30,
      Q => U_DONE_COUNT_count(30)
    );
  U_DONE_COUNT_count_31 : FDCE
    port map (
      C => user_clk,
      CE => U_DONE_COUNT_count_not0001,
      CLR => rst,
      D => U_DONE_COUNT_Mcount_count31,
      Q => U_DONE_COUNT_count(31)
    );
  U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut_0_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => size_s(0),
      I1 => U_DONE_COUNT_count(0),
      O => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut(0)
    );
  U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy_0_Q : MUXCY
    port map (
      CI => NlwRenamedSig_OI_sram_rw_n,
      DI => U_DONE_COUNT_count(0),
      S => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut(0),
      O => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy(0)
    );
  U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut_1_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => size_s(1),
      I1 => U_DONE_COUNT_count(1),
      O => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut(1)
    );
  U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy_1_Q : MUXCY
    port map (
      CI => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy(0),
      DI => U_DONE_COUNT_count(1),
      S => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut(1),
      O => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy(1)
    );
  U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut_2_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => size_s(2),
      I1 => U_DONE_COUNT_count(2),
      O => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut(2)
    );
  U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy_2_Q : MUXCY
    port map (
      CI => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy(1),
      DI => U_DONE_COUNT_count(2),
      S => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut(2),
      O => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy(2)
    );
  U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut_3_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => size_s(3),
      I1 => U_DONE_COUNT_count(3),
      O => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut(3)
    );
  U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy_3_Q : MUXCY
    port map (
      CI => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy(2),
      DI => U_DONE_COUNT_count(3),
      S => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut(3),
      O => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy(3)
    );
  U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut_4_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => size_s(4),
      I1 => U_DONE_COUNT_count(4),
      O => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut(4)
    );
  U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy_4_Q : MUXCY
    port map (
      CI => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy(3),
      DI => U_DONE_COUNT_count(4),
      S => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut(4),
      O => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy(4)
    );
  U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut_5_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => size_s(5),
      I1 => U_DONE_COUNT_count(5),
      O => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut(5)
    );
  U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy_5_Q : MUXCY
    port map (
      CI => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy(4),
      DI => U_DONE_COUNT_count(5),
      S => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut(5),
      O => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy(5)
    );
  U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut_6_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => size_s(6),
      I1 => U_DONE_COUNT_count(6),
      O => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut(6)
    );
  U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy_6_Q : MUXCY
    port map (
      CI => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy(5),
      DI => U_DONE_COUNT_count(6),
      S => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut(6),
      O => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy(6)
    );
  U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut_7_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => size_s(7),
      I1 => U_DONE_COUNT_count(7),
      O => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut(7)
    );
  U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy_7_Q : MUXCY
    port map (
      CI => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy(6),
      DI => U_DONE_COUNT_count(7),
      S => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut(7),
      O => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy(7)
    );
  U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut_8_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => size_s(8),
      I1 => U_DONE_COUNT_count(8),
      O => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut(8)
    );
  U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy_8_Q : MUXCY
    port map (
      CI => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy(7),
      DI => U_DONE_COUNT_count(8),
      S => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut(8),
      O => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy(8)
    );
  U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut_9_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => size_s(9),
      I1 => U_DONE_COUNT_count(9),
      O => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut(9)
    );
  U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy_9_Q : MUXCY
    port map (
      CI => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy(8),
      DI => U_DONE_COUNT_count(9),
      S => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut(9),
      O => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy(9)
    );
  U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut_10_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => size_s(10),
      I1 => U_DONE_COUNT_count(10),
      O => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut(10)
    );
  U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy_10_Q : MUXCY
    port map (
      CI => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy(9),
      DI => U_DONE_COUNT_count(10),
      S => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut(10),
      O => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy(10)
    );
  U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut_11_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => size_s(11),
      I1 => U_DONE_COUNT_count(11),
      O => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut(11)
    );
  U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy_11_Q : MUXCY
    port map (
      CI => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy(10),
      DI => U_DONE_COUNT_count(11),
      S => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut(11),
      O => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy(11)
    );
  U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut_12_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => size_s(12),
      I1 => U_DONE_COUNT_count(12),
      O => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut(12)
    );
  U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy_12_Q : MUXCY
    port map (
      CI => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy(11),
      DI => U_DONE_COUNT_count(12),
      S => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut(12),
      O => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy(12)
    );
  U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut_13_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => size_s(13),
      I1 => U_DONE_COUNT_count(13),
      O => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut(13)
    );
  U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy_13_Q : MUXCY
    port map (
      CI => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy(12),
      DI => U_DONE_COUNT_count(13),
      S => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut(13),
      O => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy(13)
    );
  U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut_14_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => size_s(14),
      I1 => U_DONE_COUNT_count(14),
      O => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut(14)
    );
  U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy_14_Q : MUXCY
    port map (
      CI => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy(13),
      DI => U_DONE_COUNT_count(14),
      S => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut(14),
      O => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy(14)
    );
  U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut_15_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => size_s(15),
      I1 => U_DONE_COUNT_count(15),
      O => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut(15)
    );
  U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy_15_Q : MUXCY
    port map (
      CI => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy(14),
      DI => U_DONE_COUNT_count(15),
      S => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut(15),
      O => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy(15)
    );
  U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut_16_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => size_s(16),
      I1 => U_DONE_COUNT_count(16),
      O => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut(16)
    );
  U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy_16_Q : MUXCY
    port map (
      CI => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy(15),
      DI => U_DONE_COUNT_count(16),
      S => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut(16),
      O => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy(16)
    );
  U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut_17_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => size_s(17),
      I1 => U_DONE_COUNT_count(17),
      O => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut(17)
    );
  U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy_17_Q : MUXCY
    port map (
      CI => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy(16),
      DI => U_DONE_COUNT_count(17),
      S => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut(17),
      O => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy(17)
    );
  U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut_18_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => size_s(18),
      I1 => U_DONE_COUNT_count(18),
      O => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut(18)
    );
  U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy_18_Q : MUXCY
    port map (
      CI => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy(17),
      DI => U_DONE_COUNT_count(18),
      S => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut(18),
      O => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy(18)
    );
  U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut_19_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => size_s(19),
      I1 => U_DONE_COUNT_count(19),
      O => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut(19)
    );
  U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy_19_Q : MUXCY
    port map (
      CI => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy(18),
      DI => U_DONE_COUNT_count(19),
      S => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut(19),
      O => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy(19)
    );
  U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut_20_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => size_s(20),
      I1 => U_DONE_COUNT_count(20),
      O => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut(20)
    );
  U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy_20_Q : MUXCY
    port map (
      CI => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy(19),
      DI => U_DONE_COUNT_count(20),
      S => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut(20),
      O => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy(20)
    );
  U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut_21_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => size_s(21),
      I1 => U_DONE_COUNT_count(21),
      O => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut(21)
    );
  U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy_21_Q : MUXCY
    port map (
      CI => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy(20),
      DI => U_DONE_COUNT_count(21),
      S => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut(21),
      O => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy(21)
    );
  U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut_22_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => size_s(22),
      I1 => U_DONE_COUNT_count(22),
      O => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut(22)
    );
  U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy_22_Q : MUXCY
    port map (
      CI => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy(21),
      DI => U_DONE_COUNT_count(22),
      S => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut(22),
      O => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy(22)
    );
  U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut_23_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => size_s(23),
      I1 => U_DONE_COUNT_count(23),
      O => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut(23)
    );
  U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy_23_Q : MUXCY
    port map (
      CI => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy(22),
      DI => U_DONE_COUNT_count(23),
      S => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut(23),
      O => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy(23)
    );
  U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut_24_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => U_DONE_COUNT_count(24),
      I1 => size_s(24),
      O => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut(24)
    );
  U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy_24_Q : MUXCY
    port map (
      CI => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy(23),
      DI => U_DONE_COUNT_count(24),
      S => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut(24),
      O => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy(24)
    );
  U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut_25_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => U_DONE_COUNT_count(25),
      I1 => size_s(25),
      O => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut(25)
    );
  U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy_25_Q : MUXCY
    port map (
      CI => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy(24),
      DI => U_DONE_COUNT_count(25),
      S => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut(25),
      O => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy(25)
    );
  U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut_26_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => U_DONE_COUNT_count(26),
      I1 => size_s(26),
      O => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut(26)
    );
  U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy_26_Q : MUXCY
    port map (
      CI => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy(25),
      DI => U_DONE_COUNT_count(26),
      S => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut(26),
      O => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy(26)
    );
  U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut_27_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => U_DONE_COUNT_count(27),
      I1 => size_s(27),
      O => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut(27)
    );
  U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy_27_Q : MUXCY
    port map (
      CI => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy(26),
      DI => U_DONE_COUNT_count(27),
      S => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut(27),
      O => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy(27)
    );
  U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut_28_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => U_DONE_COUNT_count(28),
      I1 => size_s(28),
      O => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut(28)
    );
  U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy_28_Q : MUXCY
    port map (
      CI => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy(27),
      DI => U_DONE_COUNT_count(28),
      S => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut(28),
      O => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy(28)
    );
  U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut_29_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => U_DONE_COUNT_count(29),
      I1 => size_s(29),
      O => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut(29)
    );
  U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy_29_Q : MUXCY
    port map (
      CI => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy(28),
      DI => U_DONE_COUNT_count(29),
      S => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut(29),
      O => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy(29)
    );
  U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut_30_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => U_DONE_COUNT_count(30),
      I1 => size_s(30),
      O => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut(30)
    );
  U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy_30_Q : MUXCY
    port map (
      CI => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy(29),
      DI => U_DONE_COUNT_count(30),
      S => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut(30),
      O => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy(30)
    );
  U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut_31_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => U_DONE_COUNT_count(31),
      I1 => size_s(31),
      O => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut(31)
    );
  U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy_31_Q : MUXCY
    port map (
      CI => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_cy(30),
      DI => U_DONE_COUNT_count(31),
      S => U_DONE_COUNT_Mcompar_done_s_cmp_ge0000_lut(31),
      O => done_s
    );
  U_AG_SI_Madd_next_addr_current_addsub0000_xor_20_Q : XORCY
    port map (
      CI => U_AG_SI_Madd_next_addr_current_addsub0000_cy(19),
      LI => U_AG_SI_Madd_next_addr_current_addsub0000_xor_20_rt_45,
      O => U_AG_SI_next_addr_current_addsub0000(20)
    );
  U_AG_SI_Madd_next_addr_current_addsub0000_xor_19_Q : XORCY
    port map (
      CI => U_AG_SI_Madd_next_addr_current_addsub0000_cy(18),
      LI => U_AG_SI_Madd_next_addr_current_addsub0000_cy_19_rt_26,
      O => U_AG_SI_next_addr_current_addsub0000(19)
    );
  U_AG_SI_Madd_next_addr_current_addsub0000_cy_19_Q : MUXCY
    port map (
      CI => U_AG_SI_Madd_next_addr_current_addsub0000_cy(18),
      DI => NlwRenamedSig_OI_sram_bw_n(0),
      S => U_AG_SI_Madd_next_addr_current_addsub0000_cy_19_rt_26,
      O => U_AG_SI_Madd_next_addr_current_addsub0000_cy(19)
    );
  U_AG_SI_Madd_next_addr_current_addsub0000_xor_18_Q : XORCY
    port map (
      CI => U_AG_SI_Madd_next_addr_current_addsub0000_cy(17),
      LI => U_AG_SI_Madd_next_addr_current_addsub0000_cy_18_rt_24,
      O => U_AG_SI_next_addr_current_addsub0000(18)
    );
  U_AG_SI_Madd_next_addr_current_addsub0000_cy_18_Q : MUXCY
    port map (
      CI => U_AG_SI_Madd_next_addr_current_addsub0000_cy(17),
      DI => NlwRenamedSig_OI_sram_bw_n(0),
      S => U_AG_SI_Madd_next_addr_current_addsub0000_cy_18_rt_24,
      O => U_AG_SI_Madd_next_addr_current_addsub0000_cy(18)
    );
  U_AG_SI_Madd_next_addr_current_addsub0000_xor_17_Q : XORCY
    port map (
      CI => U_AG_SI_Madd_next_addr_current_addsub0000_cy(16),
      LI => U_AG_SI_Madd_next_addr_current_addsub0000_cy_17_rt_22,
      O => U_AG_SI_next_addr_current_addsub0000(17)
    );
  U_AG_SI_Madd_next_addr_current_addsub0000_cy_17_Q : MUXCY
    port map (
      CI => U_AG_SI_Madd_next_addr_current_addsub0000_cy(16),
      DI => NlwRenamedSig_OI_sram_bw_n(0),
      S => U_AG_SI_Madd_next_addr_current_addsub0000_cy_17_rt_22,
      O => U_AG_SI_Madd_next_addr_current_addsub0000_cy(17)
    );
  U_AG_SI_Madd_next_addr_current_addsub0000_xor_16_Q : XORCY
    port map (
      CI => U_AG_SI_Madd_next_addr_current_addsub0000_cy(15),
      LI => U_AG_SI_Madd_next_addr_current_addsub0000_cy_16_rt_20,
      O => U_AG_SI_next_addr_current_addsub0000(16)
    );
  U_AG_SI_Madd_next_addr_current_addsub0000_cy_16_Q : MUXCY
    port map (
      CI => U_AG_SI_Madd_next_addr_current_addsub0000_cy(15),
      DI => NlwRenamedSig_OI_sram_bw_n(0),
      S => U_AG_SI_Madd_next_addr_current_addsub0000_cy_16_rt_20,
      O => U_AG_SI_Madd_next_addr_current_addsub0000_cy(16)
    );
  U_AG_SI_Madd_next_addr_current_addsub0000_xor_15_Q : XORCY
    port map (
      CI => U_AG_SI_Madd_next_addr_current_addsub0000_cy(14),
      LI => U_AG_SI_Madd_next_addr_current_addsub0000_cy_15_rt_18,
      O => U_AG_SI_next_addr_current_addsub0000(15)
    );
  U_AG_SI_Madd_next_addr_current_addsub0000_cy_15_Q : MUXCY
    port map (
      CI => U_AG_SI_Madd_next_addr_current_addsub0000_cy(14),
      DI => NlwRenamedSig_OI_sram_bw_n(0),
      S => U_AG_SI_Madd_next_addr_current_addsub0000_cy_15_rt_18,
      O => U_AG_SI_Madd_next_addr_current_addsub0000_cy(15)
    );
  U_AG_SI_Madd_next_addr_current_addsub0000_xor_14_Q : XORCY
    port map (
      CI => U_AG_SI_Madd_next_addr_current_addsub0000_cy(13),
      LI => U_AG_SI_Madd_next_addr_current_addsub0000_cy_14_rt_16,
      O => U_AG_SI_next_addr_current_addsub0000(14)
    );
  U_AG_SI_Madd_next_addr_current_addsub0000_cy_14_Q : MUXCY
    port map (
      CI => U_AG_SI_Madd_next_addr_current_addsub0000_cy(13),
      DI => NlwRenamedSig_OI_sram_bw_n(0),
      S => U_AG_SI_Madd_next_addr_current_addsub0000_cy_14_rt_16,
      O => U_AG_SI_Madd_next_addr_current_addsub0000_cy(14)
    );
  U_AG_SI_Madd_next_addr_current_addsub0000_xor_13_Q : XORCY
    port map (
      CI => U_AG_SI_Madd_next_addr_current_addsub0000_cy(12),
      LI => U_AG_SI_Madd_next_addr_current_addsub0000_cy_13_rt_14,
      O => U_AG_SI_next_addr_current_addsub0000(13)
    );
  U_AG_SI_Madd_next_addr_current_addsub0000_cy_13_Q : MUXCY
    port map (
      CI => U_AG_SI_Madd_next_addr_current_addsub0000_cy(12),
      DI => NlwRenamedSig_OI_sram_bw_n(0),
      S => U_AG_SI_Madd_next_addr_current_addsub0000_cy_13_rt_14,
      O => U_AG_SI_Madd_next_addr_current_addsub0000_cy(13)
    );
  U_AG_SI_Madd_next_addr_current_addsub0000_xor_12_Q : XORCY
    port map (
      CI => U_AG_SI_Madd_next_addr_current_addsub0000_cy(11),
      LI => U_AG_SI_Madd_next_addr_current_addsub0000_cy_12_rt_12,
      O => U_AG_SI_next_addr_current_addsub0000(12)
    );
  U_AG_SI_Madd_next_addr_current_addsub0000_cy_12_Q : MUXCY
    port map (
      CI => U_AG_SI_Madd_next_addr_current_addsub0000_cy(11),
      DI => NlwRenamedSig_OI_sram_bw_n(0),
      S => U_AG_SI_Madd_next_addr_current_addsub0000_cy_12_rt_12,
      O => U_AG_SI_Madd_next_addr_current_addsub0000_cy(12)
    );
  U_AG_SI_Madd_next_addr_current_addsub0000_xor_11_Q : XORCY
    port map (
      CI => U_AG_SI_Madd_next_addr_current_addsub0000_cy(10),
      LI => U_AG_SI_Madd_next_addr_current_addsub0000_cy_11_rt_10,
      O => U_AG_SI_next_addr_current_addsub0000(11)
    );
  U_AG_SI_Madd_next_addr_current_addsub0000_cy_11_Q : MUXCY
    port map (
      CI => U_AG_SI_Madd_next_addr_current_addsub0000_cy(10),
      DI => NlwRenamedSig_OI_sram_bw_n(0),
      S => U_AG_SI_Madd_next_addr_current_addsub0000_cy_11_rt_10,
      O => U_AG_SI_Madd_next_addr_current_addsub0000_cy(11)
    );
  U_AG_SI_Madd_next_addr_current_addsub0000_xor_10_Q : XORCY
    port map (
      CI => U_AG_SI_Madd_next_addr_current_addsub0000_cy(9),
      LI => U_AG_SI_Madd_next_addr_current_addsub0000_cy_10_rt_8,
      O => U_AG_SI_next_addr_current_addsub0000(10)
    );
  U_AG_SI_Madd_next_addr_current_addsub0000_cy_10_Q : MUXCY
    port map (
      CI => U_AG_SI_Madd_next_addr_current_addsub0000_cy(9),
      DI => NlwRenamedSig_OI_sram_bw_n(0),
      S => U_AG_SI_Madd_next_addr_current_addsub0000_cy_10_rt_8,
      O => U_AG_SI_Madd_next_addr_current_addsub0000_cy(10)
    );
  U_AG_SI_Madd_next_addr_current_addsub0000_xor_9_Q : XORCY
    port map (
      CI => U_AG_SI_Madd_next_addr_current_addsub0000_cy(8),
      LI => U_AG_SI_Madd_next_addr_current_addsub0000_cy_9_rt_43,
      O => U_AG_SI_next_addr_current_addsub0000(9)
    );
  U_AG_SI_Madd_next_addr_current_addsub0000_cy_9_Q : MUXCY
    port map (
      CI => U_AG_SI_Madd_next_addr_current_addsub0000_cy(8),
      DI => NlwRenamedSig_OI_sram_bw_n(0),
      S => U_AG_SI_Madd_next_addr_current_addsub0000_cy_9_rt_43,
      O => U_AG_SI_Madd_next_addr_current_addsub0000_cy(9)
    );
  U_AG_SI_Madd_next_addr_current_addsub0000_xor_8_Q : XORCY
    port map (
      CI => U_AG_SI_Madd_next_addr_current_addsub0000_cy(7),
      LI => U_AG_SI_Madd_next_addr_current_addsub0000_cy_8_rt_41,
      O => U_AG_SI_next_addr_current_addsub0000(8)
    );
  U_AG_SI_Madd_next_addr_current_addsub0000_cy_8_Q : MUXCY
    port map (
      CI => U_AG_SI_Madd_next_addr_current_addsub0000_cy(7),
      DI => NlwRenamedSig_OI_sram_bw_n(0),
      S => U_AG_SI_Madd_next_addr_current_addsub0000_cy_8_rt_41,
      O => U_AG_SI_Madd_next_addr_current_addsub0000_cy(8)
    );
  U_AG_SI_Madd_next_addr_current_addsub0000_xor_7_Q : XORCY
    port map (
      CI => U_AG_SI_Madd_next_addr_current_addsub0000_cy(6),
      LI => U_AG_SI_Madd_next_addr_current_addsub0000_cy_7_rt_39,
      O => U_AG_SI_next_addr_current_addsub0000(7)
    );
  U_AG_SI_Madd_next_addr_current_addsub0000_cy_7_Q : MUXCY
    port map (
      CI => U_AG_SI_Madd_next_addr_current_addsub0000_cy(6),
      DI => NlwRenamedSig_OI_sram_bw_n(0),
      S => U_AG_SI_Madd_next_addr_current_addsub0000_cy_7_rt_39,
      O => U_AG_SI_Madd_next_addr_current_addsub0000_cy(7)
    );
  U_AG_SI_Madd_next_addr_current_addsub0000_xor_6_Q : XORCY
    port map (
      CI => U_AG_SI_Madd_next_addr_current_addsub0000_cy(5),
      LI => U_AG_SI_Madd_next_addr_current_addsub0000_cy_6_rt_37,
      O => U_AG_SI_next_addr_current_addsub0000(6)
    );
  U_AG_SI_Madd_next_addr_current_addsub0000_cy_6_Q : MUXCY
    port map (
      CI => U_AG_SI_Madd_next_addr_current_addsub0000_cy(5),
      DI => NlwRenamedSig_OI_sram_bw_n(0),
      S => U_AG_SI_Madd_next_addr_current_addsub0000_cy_6_rt_37,
      O => U_AG_SI_Madd_next_addr_current_addsub0000_cy(6)
    );
  U_AG_SI_Madd_next_addr_current_addsub0000_xor_5_Q : XORCY
    port map (
      CI => U_AG_SI_Madd_next_addr_current_addsub0000_cy(4),
      LI => U_AG_SI_Madd_next_addr_current_addsub0000_cy_5_rt_35,
      O => U_AG_SI_next_addr_current_addsub0000(5)
    );
  U_AG_SI_Madd_next_addr_current_addsub0000_cy_5_Q : MUXCY
    port map (
      CI => U_AG_SI_Madd_next_addr_current_addsub0000_cy(4),
      DI => NlwRenamedSig_OI_sram_bw_n(0),
      S => U_AG_SI_Madd_next_addr_current_addsub0000_cy_5_rt_35,
      O => U_AG_SI_Madd_next_addr_current_addsub0000_cy(5)
    );
  U_AG_SI_Madd_next_addr_current_addsub0000_xor_4_Q : XORCY
    port map (
      CI => U_AG_SI_Madd_next_addr_current_addsub0000_cy(3),
      LI => U_AG_SI_Madd_next_addr_current_addsub0000_cy_4_rt_33,
      O => U_AG_SI_next_addr_current_addsub0000(4)
    );
  U_AG_SI_Madd_next_addr_current_addsub0000_cy_4_Q : MUXCY
    port map (
      CI => U_AG_SI_Madd_next_addr_current_addsub0000_cy(3),
      DI => NlwRenamedSig_OI_sram_bw_n(0),
      S => U_AG_SI_Madd_next_addr_current_addsub0000_cy_4_rt_33,
      O => U_AG_SI_Madd_next_addr_current_addsub0000_cy(4)
    );
  U_AG_SI_Madd_next_addr_current_addsub0000_xor_3_Q : XORCY
    port map (
      CI => U_AG_SI_Madd_next_addr_current_addsub0000_cy(2),
      LI => U_AG_SI_Madd_next_addr_current_addsub0000_cy_3_rt_31,
      O => U_AG_SI_next_addr_current_addsub0000(3)
    );
  U_AG_SI_Madd_next_addr_current_addsub0000_cy_3_Q : MUXCY
    port map (
      CI => U_AG_SI_Madd_next_addr_current_addsub0000_cy(2),
      DI => NlwRenamedSig_OI_sram_bw_n(0),
      S => U_AG_SI_Madd_next_addr_current_addsub0000_cy_3_rt_31,
      O => U_AG_SI_Madd_next_addr_current_addsub0000_cy(3)
    );
  U_AG_SI_Madd_next_addr_current_addsub0000_xor_2_Q : XORCY
    port map (
      CI => U_AG_SI_Madd_next_addr_current_addsub0000_cy(1),
      LI => U_AG_SI_Madd_next_addr_current_addsub0000_cy_2_rt_29,
      O => U_AG_SI_next_addr_current_addsub0000(2)
    );
  U_AG_SI_Madd_next_addr_current_addsub0000_cy_2_Q : MUXCY
    port map (
      CI => U_AG_SI_Madd_next_addr_current_addsub0000_cy(1),
      DI => NlwRenamedSig_OI_sram_bw_n(0),
      S => U_AG_SI_Madd_next_addr_current_addsub0000_cy_2_rt_29,
      O => U_AG_SI_Madd_next_addr_current_addsub0000_cy(2)
    );
  U_AG_SI_Madd_next_addr_current_addsub0000_xor_1_Q : XORCY
    port map (
      CI => NlwRenamedSig_OI_sram_bw_n(0),
      LI => U_AG_SI_Madd_next_addr_current_addsub0000_lut(1),
      O => U_AG_SI_next_addr_current_addsub0000(1)
    );
  U_AG_SI_Madd_next_addr_current_addsub0000_cy_1_Q : MUXCY
    port map (
      CI => NlwRenamedSig_OI_sram_bw_n(0),
      DI => NlwRenamedSig_OI_sram_rw_n,
      S => U_AG_SI_Madd_next_addr_current_addsub0000_lut(1),
      O => U_AG_SI_Madd_next_addr_current_addsub0000_cy(1)
    );
  U_AG_SI_addr_current_20 : FDC
    port map (
      C => sram_clk,
      CLR => rst_s,
      D => U_AG_SI_next_addr_current(20),
      Q => U_AG_SI_addr_current(20)
    );
  U_AG_SI_addr_current_19 : FDC
    port map (
      C => sram_clk,
      CLR => rst_s,
      D => U_AG_SI_next_addr_current(19),
      Q => U_AG_SI_addr_current(19)
    );
  U_AG_SI_addr_current_18 : FDC
    port map (
      C => sram_clk,
      CLR => rst_s,
      D => U_AG_SI_next_addr_current(18),
      Q => U_AG_SI_addr_current(18)
    );
  U_AG_SI_addr_current_17 : FDC
    port map (
      C => sram_clk,
      CLR => rst_s,
      D => U_AG_SI_next_addr_current(17),
      Q => U_AG_SI_addr_current(17)
    );
  U_AG_SI_addr_current_16 : FDC
    port map (
      C => sram_clk,
      CLR => rst_s,
      D => U_AG_SI_next_addr_current(16),
      Q => U_AG_SI_addr_current(16)
    );
  U_AG_SI_addr_current_15 : FDC
    port map (
      C => sram_clk,
      CLR => rst_s,
      D => U_AG_SI_next_addr_current(15),
      Q => U_AG_SI_addr_current(15)
    );
  U_AG_SI_addr_current_14 : FDC
    port map (
      C => sram_clk,
      CLR => rst_s,
      D => U_AG_SI_next_addr_current(14),
      Q => U_AG_SI_addr_current(14)
    );
  U_AG_SI_addr_current_13 : FDC
    port map (
      C => sram_clk,
      CLR => rst_s,
      D => U_AG_SI_next_addr_current(13),
      Q => U_AG_SI_addr_current(13)
    );
  U_AG_SI_addr_current_12 : FDC
    port map (
      C => sram_clk,
      CLR => rst_s,
      D => U_AG_SI_next_addr_current(12),
      Q => U_AG_SI_addr_current(12)
    );
  U_AG_SI_addr_current_11 : FDC
    port map (
      C => sram_clk,
      CLR => rst_s,
      D => U_AG_SI_next_addr_current(11),
      Q => U_AG_SI_addr_current(11)
    );
  U_AG_SI_addr_current_10 : FDC
    port map (
      C => sram_clk,
      CLR => rst_s,
      D => U_AG_SI_next_addr_current(10),
      Q => U_AG_SI_addr_current(10)
    );
  U_AG_SI_addr_current_9 : FDC
    port map (
      C => sram_clk,
      CLR => rst_s,
      D => U_AG_SI_next_addr_current(9),
      Q => U_AG_SI_addr_current(9)
    );
  U_AG_SI_addr_current_8 : FDC
    port map (
      C => sram_clk,
      CLR => rst_s,
      D => U_AG_SI_next_addr_current(8),
      Q => U_AG_SI_addr_current(8)
    );
  U_AG_SI_addr_current_7 : FDC
    port map (
      C => sram_clk,
      CLR => rst_s,
      D => U_AG_SI_next_addr_current(7),
      Q => U_AG_SI_addr_current(7)
    );
  U_AG_SI_addr_current_6 : FDC
    port map (
      C => sram_clk,
      CLR => rst_s,
      D => U_AG_SI_next_addr_current(6),
      Q => U_AG_SI_addr_current(6)
    );
  U_AG_SI_addr_current_5 : FDC
    port map (
      C => sram_clk,
      CLR => rst_s,
      D => U_AG_SI_next_addr_current(5),
      Q => U_AG_SI_addr_current(5)
    );
  U_AG_SI_addr_current_4 : FDC
    port map (
      C => sram_clk,
      CLR => rst_s,
      D => U_AG_SI_next_addr_current(4),
      Q => U_AG_SI_addr_current(4)
    );
  U_AG_SI_addr_current_3 : FDC
    port map (
      C => sram_clk,
      CLR => rst_s,
      D => U_AG_SI_next_addr_current(3),
      Q => U_AG_SI_addr_current(3)
    );
  U_AG_SI_addr_current_2 : FDC
    port map (
      C => sram_clk,
      CLR => rst_s,
      D => U_AG_SI_next_addr_current(2),
      Q => U_AG_SI_addr_current(2)
    );
  U_AG_SI_addr_current_1 : FDC
    port map (
      C => sram_clk,
      CLR => rst_s,
      D => U_AG_SI_next_addr_current(1),
      Q => U_AG_SI_addr_current(1)
    );
  U_AG_SI_addr_current_0 : FDC
    port map (
      C => sram_clk,
      CLR => rst_s,
      D => U_AG_SI_next_addr_current(0),
      Q => U_AG_SI_addr_current(0)
    );
  U_AG_SI_state_0 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => sram_clk,
      CLR => rst_s,
      D => U_AG_SI_next_state,
      Q => U_AG_SI_state(0)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_63 : FDCE
    port map (
      C => user_clk,
      CE => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_not0001_478,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(63),
      Q => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(63)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_62 : FDCE
    port map (
      C => user_clk,
      CE => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_not0001_478,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(62),
      Q => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(62)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_61 : FDCE
    port map (
      C => user_clk,
      CE => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_not0001_478,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(61),
      Q => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(61)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_60 : FDCE
    port map (
      C => user_clk,
      CE => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_not0001_478,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(60),
      Q => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(60)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_59 : FDCE
    port map (
      C => user_clk,
      CE => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_not0001_478,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(59),
      Q => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(59)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_58 : FDCE
    port map (
      C => user_clk,
      CE => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_not0001_478,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(58),
      Q => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(58)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_57 : FDCE
    port map (
      C => user_clk,
      CE => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_not0001_478,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(57),
      Q => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(57)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_56 : FDCE
    port map (
      C => user_clk,
      CE => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_not0001_478,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(56),
      Q => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(56)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_55 : FDCE
    port map (
      C => user_clk,
      CE => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_not0001_478,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(55),
      Q => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(55)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_54 : FDCE
    port map (
      C => user_clk,
      CE => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_not0001_478,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(54),
      Q => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(54)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_53 : FDCE
    port map (
      C => user_clk,
      CE => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_not0001_478,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(53),
      Q => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(53)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_52 : FDCE
    port map (
      C => user_clk,
      CE => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_not0001_478,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(52),
      Q => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(52)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_51 : FDCE
    port map (
      C => user_clk,
      CE => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_not0001_478,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(51),
      Q => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(51)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_50 : FDCE
    port map (
      C => user_clk,
      CE => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_not0001_478,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(50),
      Q => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(50)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_49 : FDCE
    port map (
      C => user_clk,
      CE => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_not0001_478,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(49),
      Q => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(49)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_48 : FDCE
    port map (
      C => user_clk,
      CE => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_not0001_478,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(48),
      Q => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(48)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_47 : FDCE
    port map (
      C => user_clk,
      CE => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_not0001_478,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(47),
      Q => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(47)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_46 : FDCE
    port map (
      C => user_clk,
      CE => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_not0001_478,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(46),
      Q => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(46)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_45 : FDCE
    port map (
      C => user_clk,
      CE => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_not0001_478,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(45),
      Q => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(45)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_44 : FDCE
    port map (
      C => user_clk,
      CE => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_not0001_478,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(44),
      Q => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(44)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_43 : FDCE
    port map (
      C => user_clk,
      CE => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_not0001_478,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(43),
      Q => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(43)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_42 : FDCE
    port map (
      C => user_clk,
      CE => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_not0001_478,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(42),
      Q => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(42)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_41 : FDCE
    port map (
      C => user_clk,
      CE => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_not0001_478,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(41),
      Q => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(41)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_40 : FDCE
    port map (
      C => user_clk,
      CE => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_not0001_478,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(40),
      Q => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(40)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_39 : FDCE
    port map (
      C => user_clk,
      CE => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_not0001_478,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(39),
      Q => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(39)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_38 : FDCE
    port map (
      C => user_clk,
      CE => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_not0001_478,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(38),
      Q => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(38)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_37 : FDCE
    port map (
      C => user_clk,
      CE => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_not0001_478,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(37),
      Q => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(37)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_36 : FDCE
    port map (
      C => user_clk,
      CE => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_not0001_478,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(36),
      Q => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(36)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_35 : FDCE
    port map (
      C => user_clk,
      CE => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_not0001_478,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(35),
      Q => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(35)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_34 : FDCE
    port map (
      C => user_clk,
      CE => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_not0001_478,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(34),
      Q => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(34)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_33 : FDCE
    port map (
      C => user_clk,
      CE => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_not0001_478,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(33),
      Q => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(33)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_32 : FDCE
    port map (
      C => user_clk,
      CE => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_not0001_478,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(32),
      Q => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(32)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_31 : FDCE
    port map (
      C => user_clk,
      CE => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_not0001_478,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(31),
      Q => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(31)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_30 : FDCE
    port map (
      C => user_clk,
      CE => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_not0001_478,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(30),
      Q => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(30)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_29 : FDCE
    port map (
      C => user_clk,
      CE => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_not0001_478,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(29),
      Q => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(29)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_28 : FDCE
    port map (
      C => user_clk,
      CE => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_not0001_478,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(28),
      Q => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(28)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_27 : FDCE
    port map (
      C => user_clk,
      CE => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_not0001_478,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(27),
      Q => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(27)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_26 : FDCE
    port map (
      C => user_clk,
      CE => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_not0001_478,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(26),
      Q => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(26)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_25 : FDCE
    port map (
      C => user_clk,
      CE => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_not0001_478,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(25),
      Q => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(25)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_24 : FDCE
    port map (
      C => user_clk,
      CE => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_not0001_478,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(24),
      Q => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(24)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_23 : FDCE
    port map (
      C => user_clk,
      CE => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_not0001_478,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(23),
      Q => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(23)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_22 : FDCE
    port map (
      C => user_clk,
      CE => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_not0001_478,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(22),
      Q => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(22)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_21 : FDCE
    port map (
      C => user_clk,
      CE => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_not0001_478,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(21),
      Q => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(21)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_20 : FDCE
    port map (
      C => user_clk,
      CE => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_not0001_478,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(20),
      Q => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(20)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_19 : FDCE
    port map (
      C => user_clk,
      CE => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_not0001_478,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(19),
      Q => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(19)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_18 : FDCE
    port map (
      C => user_clk,
      CE => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_not0001_478,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(18),
      Q => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(18)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_17 : FDCE
    port map (
      C => user_clk,
      CE => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_not0001_478,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(17),
      Q => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(17)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_16 : FDCE
    port map (
      C => user_clk,
      CE => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_not0001_478,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(16),
      Q => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(16)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_15 : FDCE
    port map (
      C => user_clk,
      CE => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_not0001_478,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(15),
      Q => data(15)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_14 : FDCE
    port map (
      C => user_clk,
      CE => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_not0001_478,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(14),
      Q => data(14)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_13 : FDCE
    port map (
      C => user_clk,
      CE => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_not0001_478,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(13),
      Q => data(13)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_12 : FDCE
    port map (
      C => user_clk,
      CE => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_not0001_478,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(12),
      Q => data(12)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_11 : FDCE
    port map (
      C => user_clk,
      CE => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_not0001_478,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(11),
      Q => data(11)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_10 : FDCE
    port map (
      C => user_clk,
      CE => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_not0001_478,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(10),
      Q => data(10)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_9 : FDCE
    port map (
      C => user_clk,
      CE => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_not0001_478,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(9),
      Q => data(9)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_8 : FDCE
    port map (
      C => user_clk,
      CE => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_not0001_478,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(8),
      Q => data(8)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_7 : FDCE
    port map (
      C => user_clk,
      CE => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_not0001_478,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(7),
      Q => data(7)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_6 : FDCE
    port map (
      C => user_clk,
      CE => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_not0001_478,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(6),
      Q => data(6)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_5 : FDCE
    port map (
      C => user_clk,
      CE => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_not0001_478,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(5),
      Q => data(5)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_4 : FDCE
    port map (
      C => user_clk,
      CE => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_not0001_478,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(4),
      Q => data(4)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_3 : FDCE
    port map (
      C => user_clk,
      CE => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_not0001_478,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(3),
      Q => data(3)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_2 : FDCE
    port map (
      C => user_clk,
      CE => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_not0001_478,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(2),
      Q => data(2)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_1 : FDCE
    port map (
      C => user_clk,
      CE => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_not0001_478,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(1),
      Q => data(1)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_0 : FDCE
    port map (
      C => user_clk,
      CE => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_not0001_478,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(0),
      Q => data(0)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_count_2 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => user_clk,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_next_count(2),
      Q => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_count(2)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_count_1 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => user_clk,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_next_count(1),
      Q => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_count(1)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_count_0 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => user_clk,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_next_count(0),
      Q => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_count(0)
    );
  rst_s1 : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => rst,
      I1 => clear,
      O => rst_s
    );
  U_AG_SI_addr_out_9_1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => U_AG_SI_state(0),
      I1 => U_AG_SI_addr_current(9),
      O => sram_addr(9)
    );
  U_AG_SI_addr_out_8_1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => U_AG_SI_state(0),
      I1 => U_AG_SI_addr_current(8),
      O => sram_addr(8)
    );
  U_AG_SI_addr_out_7_1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => U_AG_SI_state(0),
      I1 => U_AG_SI_addr_current(7),
      O => sram_addr(7)
    );
  U_AG_SI_addr_out_6_1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => U_AG_SI_state(0),
      I1 => U_AG_SI_addr_current(6),
      O => sram_addr(6)
    );
  U_AG_SI_addr_out_5_1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => U_AG_SI_state(0),
      I1 => U_AG_SI_addr_current(5),
      O => sram_addr(5)
    );
  U_AG_SI_addr_out_4_1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => U_AG_SI_state(0),
      I1 => U_AG_SI_addr_current(4),
      O => sram_addr(4)
    );
  U_AG_SI_addr_out_3_1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => U_AG_SI_state(0),
      I1 => U_AG_SI_addr_current(3),
      O => sram_addr(3)
    );
  U_AG_SI_addr_out_2_1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => U_AG_SI_state(0),
      I1 => U_AG_SI_addr_current(2),
      O => sram_addr(2)
    );
  U_AG_SI_addr_out_20_1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => U_AG_SI_state(0),
      I1 => U_AG_SI_addr_current(20),
      O => sram_addr(20)
    );
  U_AG_SI_addr_out_1_1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => U_AG_SI_state(0),
      I1 => U_AG_SI_addr_current(1),
      O => sram_addr(1)
    );
  U_AG_SI_addr_out_19_1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => U_AG_SI_state(0),
      I1 => U_AG_SI_addr_current(19),
      O => sram_addr(19)
    );
  U_AG_SI_addr_out_18_1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => U_AG_SI_state(0),
      I1 => U_AG_SI_addr_current(18),
      O => sram_addr(18)
    );
  U_AG_SI_addr_out_17_1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => U_AG_SI_state(0),
      I1 => U_AG_SI_addr_current(17),
      O => sram_addr(17)
    );
  U_AG_SI_addr_out_16_1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => U_AG_SI_state(0),
      I1 => U_AG_SI_addr_current(16),
      O => sram_addr(16)
    );
  U_AG_SI_addr_out_15_1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => U_AG_SI_state(0),
      I1 => U_AG_SI_addr_current(15),
      O => sram_addr(15)
    );
  U_AG_SI_addr_out_14_1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => U_AG_SI_state(0),
      I1 => U_AG_SI_addr_current(14),
      O => sram_addr(14)
    );
  U_AG_SI_addr_out_13_1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => U_AG_SI_state(0),
      I1 => U_AG_SI_addr_current(13),
      O => sram_addr(13)
    );
  U_AG_SI_addr_out_12_1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => U_AG_SI_state(0),
      I1 => U_AG_SI_addr_current(12),
      O => sram_addr(12)
    );
  U_AG_SI_addr_out_11_1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => U_AG_SI_state(0),
      I1 => U_AG_SI_addr_current(11),
      O => sram_addr(11)
    );
  U_AG_SI_addr_out_10_1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => U_AG_SI_state(0),
      I1 => U_AG_SI_addr_current(10),
      O => sram_addr(10)
    );
  U_AG_SI_addr_out_0_1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => U_AG_SI_state(0),
      I1 => U_AG_SI_addr_current(0),
      O => sram_addr(0)
    );
  U_AG_SI_next_addr_current_0_1 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U_AG_SI_state(0),
      I1 => start_addr_s(0),
      I2 => U_AG_SI_addr_current(0),
      O => U_AG_SI_next_addr_current(0)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_next_count_0_1 : LUT4
    generic map(
      INIT => X"6662"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_count(0),
      I1 => rd_en,
      I2 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_count(1),
      I3 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_count(2),
      O => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_next_count(0)
    );
  U_HANDSHAKE_next_state_0_mux00001 : LUT4
    generic map(
      INIT => X"FF82"
    )
    port map (
      I0 => U_HANDSHAKE_state(0),
      I1 => U_HANDSHAKE_got_it_tg_ff_354,
      I2 => U_HANDSHAKE_U_GOT_IT_SYNC_output(0),
      I3 => handshake_go_508,
      O => U_HANDSHAKE_next_state
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_next_count_1_1 : LUT4
    generic map(
      INIT => X"9A8A"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_count(1),
      I1 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_count(0),
      I2 => rd_en,
      I3 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_count(2),
      O => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_next_count(1)
    );
  state_FSM_FFd1_In1 : LUT4
    generic map(
      INIT => X"96F0"
    )
    port map (
      I0 => U_HANDSHAKE_got_it_tg_ff_354,
      I1 => U_HANDSHAKE_U_GOT_IT_SYNC_output(0),
      I2 => state_FSM_FFd1_782,
      I3 => state_FSM_FFd2_784,
      O => state_FSM_FFd1_In
    );
  U_HANDSHAKE_start_pl1 : LUT4
    generic map(
      INIT => X"28AA"
    )
    port map (
      I0 => handshake_go_508,
      I1 => U_HANDSHAKE_got_it_tg_ff_354,
      I2 => U_HANDSHAKE_U_GOT_IT_SYNC_output(0),
      I3 => U_HANDSHAKE_state(0),
      O => U_HANDSHAKE_start_pl
    );
  busy_mux000111 : LUT3
    generic map(
      INIT => X"02"
    )
    port map (
      I0 => go,
      I1 => state_FSM_FFd1_782,
      I2 => state_FSM_FFd2_784,
      O => start_addr_s_not0001
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_not000121 : LUT3
    generic map(
      INIT => X"01"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_count(1),
      I1 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_count(2),
      I2 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_count(0),
      O => width_fifo_empty
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000_63_1 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => mem_fifo_out(63),
      I1 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_N0,
      O => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(63)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000_62_1 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => mem_fifo_out(62),
      I1 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_N0,
      O => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(62)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000_61_1 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => mem_fifo_out(61),
      I1 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_N0,
      O => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(61)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000_60_1 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => mem_fifo_out(60),
      I1 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_N0,
      O => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(60)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000_59_1 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => mem_fifo_out(59),
      I1 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_N0,
      O => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(59)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000_58_1 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => mem_fifo_out(58),
      I1 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_N0,
      O => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(58)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000_57_1 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => mem_fifo_out(57),
      I1 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_N0,
      O => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(57)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000_56_1 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => mem_fifo_out(56),
      I1 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_N0,
      O => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(56)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000_55_1 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => mem_fifo_out(55),
      I1 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_N0,
      O => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(55)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000_54_1 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => mem_fifo_out(54),
      I1 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_N0,
      O => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(54)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000_53_1 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => mem_fifo_out(53),
      I1 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_N0,
      O => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(53)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000_52_1 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => mem_fifo_out(52),
      I1 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_N0,
      O => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(52)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000_51_1 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => mem_fifo_out(51),
      I1 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_N0,
      O => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(51)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000_50_1 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => mem_fifo_out(50),
      I1 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_N0,
      O => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(50)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000_49_1 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => mem_fifo_out(49),
      I1 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_N0,
      O => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(49)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000_48_1 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => mem_fifo_out(48),
      I1 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_N0,
      O => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(48)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000_9_1 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(25),
      I1 => mem_fifo_out(9),
      I2 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_N0,
      O => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(9)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000_8_1 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(24),
      I1 => mem_fifo_out(8),
      I2 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_N0,
      O => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(8)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000_7_1 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(23),
      I1 => mem_fifo_out(7),
      I2 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_N0,
      O => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(7)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000_6_1 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(22),
      I1 => mem_fifo_out(6),
      I2 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_N0,
      O => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(6)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000_5_1 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(21),
      I1 => mem_fifo_out(5),
      I2 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_N0,
      O => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(5)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000_4_1 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(20),
      I1 => mem_fifo_out(4),
      I2 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_N0,
      O => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(4)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000_47_1 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(63),
      I1 => mem_fifo_out(47),
      I2 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_N0,
      O => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(47)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000_46_1 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(62),
      I1 => mem_fifo_out(46),
      I2 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_N0,
      O => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(46)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000_45_1 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(61),
      I1 => mem_fifo_out(45),
      I2 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_N0,
      O => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(45)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000_44_1 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(60),
      I1 => mem_fifo_out(44),
      I2 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_N0,
      O => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(44)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000_43_1 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(59),
      I1 => mem_fifo_out(43),
      I2 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_N0,
      O => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(43)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000_42_1 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(58),
      I1 => mem_fifo_out(42),
      I2 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_N0,
      O => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(42)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000_41_1 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(57),
      I1 => mem_fifo_out(41),
      I2 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_N0,
      O => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(41)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000_40_1 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(56),
      I1 => mem_fifo_out(40),
      I2 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_N0,
      O => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(40)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000_3_1 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(19),
      I1 => mem_fifo_out(3),
      I2 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_N0,
      O => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(3)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000_39_1 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(55),
      I1 => mem_fifo_out(39),
      I2 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_N0,
      O => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(39)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000_38_1 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(54),
      I1 => mem_fifo_out(38),
      I2 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_N0,
      O => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(38)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000_37_1 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(53),
      I1 => mem_fifo_out(37),
      I2 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_N0,
      O => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(37)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000_36_1 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(52),
      I1 => mem_fifo_out(36),
      I2 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_N0,
      O => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(36)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000_35_1 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(51),
      I1 => mem_fifo_out(35),
      I2 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_N0,
      O => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(35)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000_34_1 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(50),
      I1 => mem_fifo_out(34),
      I2 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_N0,
      O => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(34)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000_33_1 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(49),
      I1 => mem_fifo_out(33),
      I2 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_N0,
      O => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(33)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000_32_1 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(48),
      I1 => mem_fifo_out(32),
      I2 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_N0,
      O => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(32)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000_31_1 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(47),
      I1 => mem_fifo_out(31),
      I2 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_N0,
      O => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(31)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000_30_1 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(46),
      I1 => mem_fifo_out(30),
      I2 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_N0,
      O => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(30)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000_2_1 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(18),
      I1 => mem_fifo_out(2),
      I2 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_N0,
      O => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(2)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000_29_1 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(45),
      I1 => mem_fifo_out(29),
      I2 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_N0,
      O => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(29)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000_28_1 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(44),
      I1 => mem_fifo_out(28),
      I2 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_N0,
      O => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(28)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000_27_1 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(43),
      I1 => mem_fifo_out(27),
      I2 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_N0,
      O => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(27)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000_26_1 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(42),
      I1 => mem_fifo_out(26),
      I2 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_N0,
      O => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(26)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000_25_1 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(41),
      I1 => mem_fifo_out(25),
      I2 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_N0,
      O => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(25)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000_24_1 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(40),
      I1 => mem_fifo_out(24),
      I2 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_N0,
      O => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(24)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000_23_1 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(39),
      I1 => mem_fifo_out(23),
      I2 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_N0,
      O => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(23)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000_22_1 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(38),
      I1 => mem_fifo_out(22),
      I2 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_N0,
      O => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(22)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000_21_1 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(37),
      I1 => mem_fifo_out(21),
      I2 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_N0,
      O => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(21)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000_20_1 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(36),
      I1 => mem_fifo_out(20),
      I2 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_N0,
      O => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(20)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000_1_1 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(17),
      I1 => mem_fifo_out(1),
      I2 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_N0,
      O => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(1)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000_19_1 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(35),
      I1 => mem_fifo_out(19),
      I2 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_N0,
      O => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(19)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000_18_1 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(34),
      I1 => mem_fifo_out(18),
      I2 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_N0,
      O => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(18)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000_17_1 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(33),
      I1 => mem_fifo_out(17),
      I2 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_N0,
      O => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(17)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000_16_1 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(32),
      I1 => mem_fifo_out(16),
      I2 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_N0,
      O => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(16)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000_15_1 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(31),
      I1 => mem_fifo_out(15),
      I2 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_N0,
      O => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(15)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000_14_1 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(30),
      I1 => mem_fifo_out(14),
      I2 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_N0,
      O => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(14)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000_13_1 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(29),
      I1 => mem_fifo_out(13),
      I2 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_N0,
      O => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(13)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000_12_1 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(28),
      I1 => mem_fifo_out(12),
      I2 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_N0,
      O => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(12)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000_11_1 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(27),
      I1 => mem_fifo_out(11),
      I2 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_N0,
      O => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(11)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000_10_1 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(26),
      I1 => mem_fifo_out(10),
      I2 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_N0,
      O => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(10)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000_0_2 : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data(16),
      I1 => mem_fifo_out(0),
      I2 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_N0,
      O => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000(0)
    );
  U_HANDSHAKE_Mxor_take_it_pl_Result1 : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => U_HANDSHAKE_U_TAKE_IT_SYNC_output(0),
      I1 => U_HANDSHAKE_take_it_tg_ff_360,
      O => handshake_rcv
    );
  ag_stall1 : LUT4
    generic map(
      INIT => X"FDFF"
    )
    port map (
      I0 => sram_fifo_empty,
      I1 => stall,
      I2 => mem_fifo_prog_full,
      I3 => sram_calibrated,
      O => ag_stall
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_not0001 : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => rd_en,
      I1 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_count(0),
      I2 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_count(2),
      I3 => N6,
      O => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_not0001_478
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_full1 : LUT4
    generic map(
      INIT => X"FFF4"
    )
    port map (
      I0 => rd_en,
      I1 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_count(0),
      I2 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_count(1),
      I3 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_count(2),
      O => width_fifo_full
    );
  done1 : LUT3
    generic map(
      INIT => X"02"
    )
    port map (
      I0 => done_s,
      I1 => busy_485,
      I2 => go,
      O => done
    );
  state_FSM_FFd2_In_SW0 : LUT3
    generic map(
      INIT => X"90"
    )
    port map (
      I0 => U_HANDSHAKE_U_GOT_IT_SYNC_output(0),
      I1 => U_HANDSHAKE_got_it_tg_ff_354,
      I2 => state_FSM_FFd2_784,
      O => N8
    );
  state_FSM_FFd2_In_SW1 : LUT4
    generic map(
      INIT => X"E44E"
    )
    port map (
      I0 => state_FSM_FFd2_784,
      I1 => state_FSM_FFd1_782,
      I2 => U_HANDSHAKE_got_it_tg_ff_354,
      I3 => U_HANDSHAKE_U_GOT_IT_SYNC_output(0),
      O => N9
    );
  state_FSM_FFd2_In : LUT4
    generic map(
      INIT => X"FCFA"
    )
    port map (
      I0 => N8,
      I1 => N9,
      I2 => start_addr_s_not0001,
      I3 => done_s,
      O => state_FSM_FFd2_In_785
    );
  U_DONE_COUNT_count_not00011 : LUT4
    generic map(
      INIT => X"CCCE"
    )
    port map (
      I0 => rd_en,
      I1 => clear,
      I2 => width_fifo_empty,
      I3 => done_s,
      O => U_DONE_COUNT_count_not0001
    );
  U_AG_SI_Madd_next_addr_current_addsub0000_cy_19_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U_AG_SI_addr_current(19),
      O => U_AG_SI_Madd_next_addr_current_addsub0000_cy_19_rt_26
    );
  U_AG_SI_Madd_next_addr_current_addsub0000_cy_18_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U_AG_SI_addr_current(18),
      O => U_AG_SI_Madd_next_addr_current_addsub0000_cy_18_rt_24
    );
  U_AG_SI_Madd_next_addr_current_addsub0000_cy_17_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U_AG_SI_addr_current(17),
      O => U_AG_SI_Madd_next_addr_current_addsub0000_cy_17_rt_22
    );
  U_AG_SI_Madd_next_addr_current_addsub0000_cy_16_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U_AG_SI_addr_current(16),
      O => U_AG_SI_Madd_next_addr_current_addsub0000_cy_16_rt_20
    );
  U_AG_SI_Madd_next_addr_current_addsub0000_cy_15_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U_AG_SI_addr_current(15),
      O => U_AG_SI_Madd_next_addr_current_addsub0000_cy_15_rt_18
    );
  U_AG_SI_Madd_next_addr_current_addsub0000_cy_14_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U_AG_SI_addr_current(14),
      O => U_AG_SI_Madd_next_addr_current_addsub0000_cy_14_rt_16
    );
  U_AG_SI_Madd_next_addr_current_addsub0000_cy_13_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U_AG_SI_addr_current(13),
      O => U_AG_SI_Madd_next_addr_current_addsub0000_cy_13_rt_14
    );
  U_AG_SI_Madd_next_addr_current_addsub0000_cy_12_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U_AG_SI_addr_current(12),
      O => U_AG_SI_Madd_next_addr_current_addsub0000_cy_12_rt_12
    );
  U_AG_SI_Madd_next_addr_current_addsub0000_cy_11_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U_AG_SI_addr_current(11),
      O => U_AG_SI_Madd_next_addr_current_addsub0000_cy_11_rt_10
    );
  U_AG_SI_Madd_next_addr_current_addsub0000_cy_10_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U_AG_SI_addr_current(10),
      O => U_AG_SI_Madd_next_addr_current_addsub0000_cy_10_rt_8
    );
  U_AG_SI_Madd_next_addr_current_addsub0000_cy_9_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U_AG_SI_addr_current(9),
      O => U_AG_SI_Madd_next_addr_current_addsub0000_cy_9_rt_43
    );
  U_AG_SI_Madd_next_addr_current_addsub0000_cy_8_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U_AG_SI_addr_current(8),
      O => U_AG_SI_Madd_next_addr_current_addsub0000_cy_8_rt_41
    );
  U_AG_SI_Madd_next_addr_current_addsub0000_cy_7_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U_AG_SI_addr_current(7),
      O => U_AG_SI_Madd_next_addr_current_addsub0000_cy_7_rt_39
    );
  U_AG_SI_Madd_next_addr_current_addsub0000_cy_6_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U_AG_SI_addr_current(6),
      O => U_AG_SI_Madd_next_addr_current_addsub0000_cy_6_rt_37
    );
  U_AG_SI_Madd_next_addr_current_addsub0000_cy_5_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U_AG_SI_addr_current(5),
      O => U_AG_SI_Madd_next_addr_current_addsub0000_cy_5_rt_35
    );
  U_AG_SI_Madd_next_addr_current_addsub0000_cy_4_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U_AG_SI_addr_current(4),
      O => U_AG_SI_Madd_next_addr_current_addsub0000_cy_4_rt_33
    );
  U_AG_SI_Madd_next_addr_current_addsub0000_cy_3_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U_AG_SI_addr_current(3),
      O => U_AG_SI_Madd_next_addr_current_addsub0000_cy_3_rt_31
    );
  U_AG_SI_Madd_next_addr_current_addsub0000_cy_2_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U_AG_SI_addr_current(2),
      O => U_AG_SI_Madd_next_addr_current_addsub0000_cy_2_rt_29
    );
  U_AG_SI_Madd_next_addr_current_addsub0000_xor_20_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U_AG_SI_addr_current(20),
      O => U_AG_SI_Madd_next_addr_current_addsub0000_xor_20_rt_45
    );
  U_DONE_COUNT_count_0_rstpot : LUT3
    generic map(
      INIT => X"CA"
    )
    port map (
      I0 => U_DONE_COUNT_count(0),
      I1 => U_DONE_COUNT_Mcount_count,
      I2 => N57,
      O => U_DONE_COUNT_count_0_rstpot_289
    );
  U_DONE_COUNT_count_0 : FDC
    port map (
      C => user_clk,
      CLR => rst,
      D => U_DONE_COUNT_count_0_rstpot_289,
      Q => U_DONE_COUNT_count(0)
    );
  U_DONE_COUNT_count_1_rstpot : LUT3
    generic map(
      INIT => X"CA"
    )
    port map (
      I0 => U_DONE_COUNT_count(1),
      I1 => U_DONE_COUNT_Mcount_count1,
      I2 => U_DONE_COUNT_count_not00011_346,
      O => U_DONE_COUNT_count_1_rstpot_311
    );
  U_DONE_COUNT_count_1 : FDC
    port map (
      C => user_clk,
      CLR => rst,
      D => U_DONE_COUNT_count_1_rstpot_311,
      Q => U_DONE_COUNT_count(1)
    );
  U_DONE_COUNT_count_2_rstpot : LUT3
    generic map(
      INIT => X"CA"
    )
    port map (
      I0 => U_DONE_COUNT_count(2),
      I1 => U_DONE_COUNT_Mcount_count2,
      I2 => U_DONE_COUNT_count_not00011_346,
      O => U_DONE_COUNT_count_2_rstpot_328
    );
  U_DONE_COUNT_count_2 : FDC
    port map (
      C => user_clk,
      CLR => rst,
      D => U_DONE_COUNT_count_2_rstpot_328,
      Q => U_DONE_COUNT_count(2)
    );
  U_DONE_COUNT_count_3_rstpot : LUT3
    generic map(
      INIT => X"CA"
    )
    port map (
      I0 => U_DONE_COUNT_count(3),
      I1 => U_DONE_COUNT_Mcount_count3,
      I2 => U_DONE_COUNT_count_not00011_346,
      O => U_DONE_COUNT_count_3_rstpot_332
    );
  U_DONE_COUNT_count_3 : FDC
    port map (
      C => user_clk,
      CLR => rst,
      D => U_DONE_COUNT_count_3_rstpot_332,
      Q => U_DONE_COUNT_count(3)
    );
  U_DONE_COUNT_count_4_rstpot : LUT3
    generic map(
      INIT => X"CA"
    )
    port map (
      I0 => U_DONE_COUNT_count(4),
      I1 => U_DONE_COUNT_Mcount_count4,
      I2 => U_DONE_COUNT_count_not00011_346,
      O => U_DONE_COUNT_count_4_rstpot_334
    );
  U_DONE_COUNT_count_4 : FDC
    port map (
      C => user_clk,
      CLR => rst,
      D => U_DONE_COUNT_count_4_rstpot_334,
      Q => U_DONE_COUNT_count(4)
    );
  U_DONE_COUNT_count_5_rstpot : LUT3
    generic map(
      INIT => X"CA"
    )
    port map (
      I0 => U_DONE_COUNT_count(5),
      I1 => U_DONE_COUNT_Mcount_count5,
      I2 => U_DONE_COUNT_count_not00011_346,
      O => U_DONE_COUNT_count_5_rstpot_336
    );
  U_DONE_COUNT_count_5 : FDC
    port map (
      C => user_clk,
      CLR => rst,
      D => U_DONE_COUNT_count_5_rstpot_336,
      Q => U_DONE_COUNT_count(5)
    );
  U_DONE_COUNT_count_6_rstpot : LUT3
    generic map(
      INIT => X"CA"
    )
    port map (
      I0 => U_DONE_COUNT_count(6),
      I1 => U_DONE_COUNT_Mcount_count6,
      I2 => U_DONE_COUNT_count_not00011_346,
      O => U_DONE_COUNT_count_6_rstpot_338
    );
  U_DONE_COUNT_count_6 : FDC
    port map (
      C => user_clk,
      CLR => rst,
      D => U_DONE_COUNT_count_6_rstpot_338,
      Q => U_DONE_COUNT_count(6)
    );
  U_DONE_COUNT_count_7_rstpot : LUT3
    generic map(
      INIT => X"CA"
    )
    port map (
      I0 => U_DONE_COUNT_count(7),
      I1 => U_DONE_COUNT_Mcount_count7,
      I2 => U_DONE_COUNT_count_not00011_346,
      O => U_DONE_COUNT_count_7_rstpot_340
    );
  U_DONE_COUNT_count_7 : FDC
    port map (
      C => user_clk,
      CLR => rst,
      D => U_DONE_COUNT_count_7_rstpot_340,
      Q => U_DONE_COUNT_count(7)
    );
  U_DONE_COUNT_count_8_rstpot : LUT3
    generic map(
      INIT => X"CA"
    )
    port map (
      I0 => U_DONE_COUNT_count(8),
      I1 => U_DONE_COUNT_Mcount_count8,
      I2 => U_DONE_COUNT_count_not00011_346,
      O => U_DONE_COUNT_count_8_rstpot_342
    );
  U_DONE_COUNT_count_8 : FDC
    port map (
      C => user_clk,
      CLR => rst,
      D => U_DONE_COUNT_count_8_rstpot_342,
      Q => U_DONE_COUNT_count(8)
    );
  U_DONE_COUNT_count_9_rstpot : LUT3
    generic map(
      INIT => X"CA"
    )
    port map (
      I0 => U_DONE_COUNT_count(9),
      I1 => U_DONE_COUNT_Mcount_count9,
      I2 => U_DONE_COUNT_count_not00011_346,
      O => U_DONE_COUNT_count_9_rstpot_344
    );
  U_DONE_COUNT_count_9 : FDC
    port map (
      C => user_clk,
      CLR => rst,
      D => U_DONE_COUNT_count_9_rstpot_344,
      Q => U_DONE_COUNT_count(9)
    );
  U_DONE_COUNT_count_10_rstpot : LUT3
    generic map(
      INIT => X"CA"
    )
    port map (
      I0 => U_DONE_COUNT_count(10),
      I1 => U_DONE_COUNT_Mcount_count10,
      I2 => U_DONE_COUNT_count_not00011_346,
      O => U_DONE_COUNT_count_10_rstpot_292
    );
  U_DONE_COUNT_count_10 : FDC
    port map (
      C => user_clk,
      CLR => rst,
      D => U_DONE_COUNT_count_10_rstpot_292,
      Q => U_DONE_COUNT_count(10)
    );
  U_DONE_COUNT_count_11_rstpot : LUT3
    generic map(
      INIT => X"CA"
    )
    port map (
      I0 => U_DONE_COUNT_count(11),
      I1 => U_DONE_COUNT_Mcount_count11,
      I2 => U_DONE_COUNT_count_not00011_346,
      O => U_DONE_COUNT_count_11_rstpot_294
    );
  U_DONE_COUNT_count_11 : FDC
    port map (
      C => user_clk,
      CLR => rst,
      D => U_DONE_COUNT_count_11_rstpot_294,
      Q => U_DONE_COUNT_count(11)
    );
  U_DONE_COUNT_count_12_rstpot : LUT3
    generic map(
      INIT => X"CA"
    )
    port map (
      I0 => U_DONE_COUNT_count(12),
      I1 => U_DONE_COUNT_Mcount_count12,
      I2 => U_DONE_COUNT_count_not00011_346,
      O => U_DONE_COUNT_count_12_rstpot_296
    );
  U_DONE_COUNT_count_12 : FDC
    port map (
      C => user_clk,
      CLR => rst,
      D => U_DONE_COUNT_count_12_rstpot_296,
      Q => U_DONE_COUNT_count(12)
    );
  U_DONE_COUNT_count_13_rstpot : LUT3
    generic map(
      INIT => X"CA"
    )
    port map (
      I0 => U_DONE_COUNT_count(13),
      I1 => U_DONE_COUNT_Mcount_count13,
      I2 => U_DONE_COUNT_count_not00011_346,
      O => U_DONE_COUNT_count_13_rstpot_298
    );
  U_DONE_COUNT_count_13 : FDC
    port map (
      C => user_clk,
      CLR => rst,
      D => U_DONE_COUNT_count_13_rstpot_298,
      Q => U_DONE_COUNT_count(13)
    );
  U_DONE_COUNT_count_14_rstpot : LUT3
    generic map(
      INIT => X"CA"
    )
    port map (
      I0 => U_DONE_COUNT_count(14),
      I1 => U_DONE_COUNT_Mcount_count14,
      I2 => U_DONE_COUNT_count_not00011_346,
      O => U_DONE_COUNT_count_14_rstpot_300
    );
  U_DONE_COUNT_count_14 : FDC
    port map (
      C => user_clk,
      CLR => rst,
      D => U_DONE_COUNT_count_14_rstpot_300,
      Q => U_DONE_COUNT_count(14)
    );
  U_DONE_COUNT_count_15_rstpot : LUT3
    generic map(
      INIT => X"CA"
    )
    port map (
      I0 => U_DONE_COUNT_count(15),
      I1 => U_DONE_COUNT_Mcount_count15,
      I2 => U_DONE_COUNT_count_not00011_346,
      O => U_DONE_COUNT_count_15_rstpot_302
    );
  U_DONE_COUNT_count_15 : FDC
    port map (
      C => user_clk,
      CLR => rst,
      D => U_DONE_COUNT_count_15_rstpot_302,
      Q => U_DONE_COUNT_count(15)
    );
  U_DONE_COUNT_count_16_rstpot : LUT3
    generic map(
      INIT => X"CA"
    )
    port map (
      I0 => U_DONE_COUNT_count(16),
      I1 => U_DONE_COUNT_Mcount_count16,
      I2 => U_DONE_COUNT_count_not0001,
      O => U_DONE_COUNT_count_16_rstpot_304
    );
  U_DONE_COUNT_count_16 : FDC
    port map (
      C => user_clk,
      CLR => rst,
      D => U_DONE_COUNT_count_16_rstpot_304,
      Q => U_DONE_COUNT_count(16)
    );
  U_DONE_COUNT_count_17_rstpot : LUT3
    generic map(
      INIT => X"CA"
    )
    port map (
      I0 => U_DONE_COUNT_count(17),
      I1 => U_DONE_COUNT_Mcount_count17,
      I2 => U_DONE_COUNT_count_not0001,
      O => U_DONE_COUNT_count_17_rstpot_306
    );
  U_DONE_COUNT_count_17 : FDC
    port map (
      C => user_clk,
      CLR => rst,
      D => U_DONE_COUNT_count_17_rstpot_306,
      Q => U_DONE_COUNT_count(17)
    );
  U_DONE_COUNT_count_18_rstpot : LUT3
    generic map(
      INIT => X"CA"
    )
    port map (
      I0 => U_DONE_COUNT_count(18),
      I1 => U_DONE_COUNT_Mcount_count18,
      I2 => U_DONE_COUNT_count_not0001,
      O => U_DONE_COUNT_count_18_rstpot_308
    );
  U_DONE_COUNT_count_18 : FDC
    port map (
      C => user_clk,
      CLR => rst,
      D => U_DONE_COUNT_count_18_rstpot_308,
      Q => U_DONE_COUNT_count(18)
    );
  U_DONE_COUNT_count_19_rstpot : LUT3
    generic map(
      INIT => X"CA"
    )
    port map (
      I0 => U_DONE_COUNT_count(19),
      I1 => U_DONE_COUNT_Mcount_count19,
      I2 => U_DONE_COUNT_count_not0001,
      O => U_DONE_COUNT_count_19_rstpot_310
    );
  U_DONE_COUNT_count_19 : FDC
    port map (
      C => user_clk,
      CLR => rst,
      D => U_DONE_COUNT_count_19_rstpot_310,
      Q => U_DONE_COUNT_count(19)
    );
  U_DONE_COUNT_count_20_rstpot : LUT3
    generic map(
      INIT => X"CA"
    )
    port map (
      I0 => U_DONE_COUNT_count(20),
      I1 => U_DONE_COUNT_Mcount_count20,
      I2 => U_DONE_COUNT_count_not0001,
      O => U_DONE_COUNT_count_20_rstpot_314
    );
  U_DONE_COUNT_count_20 : FDC
    port map (
      C => user_clk,
      CLR => rst,
      D => U_DONE_COUNT_count_20_rstpot_314,
      Q => U_DONE_COUNT_count(20)
    );
  U_DONE_COUNT_count_21_rstpot : LUT3
    generic map(
      INIT => X"CA"
    )
    port map (
      I0 => U_DONE_COUNT_count(21),
      I1 => U_DONE_COUNT_Mcount_count21,
      I2 => U_DONE_COUNT_count_not0001,
      O => U_DONE_COUNT_count_21_rstpot_316
    );
  U_DONE_COUNT_count_21 : FDC
    port map (
      C => user_clk,
      CLR => rst,
      D => U_DONE_COUNT_count_21_rstpot_316,
      Q => U_DONE_COUNT_count(21)
    );
  U_DONE_COUNT_count_22_rstpot : LUT3
    generic map(
      INIT => X"CA"
    )
    port map (
      I0 => U_DONE_COUNT_count(22),
      I1 => U_DONE_COUNT_Mcount_count22,
      I2 => U_DONE_COUNT_count_not0001,
      O => U_DONE_COUNT_count_22_rstpot_318
    );
  U_DONE_COUNT_count_22 : FDC
    port map (
      C => user_clk,
      CLR => rst,
      D => U_DONE_COUNT_count_22_rstpot_318,
      Q => U_DONE_COUNT_count(22)
    );
  U_DONE_COUNT_count_23_rstpot : LUT3
    generic map(
      INIT => X"CA"
    )
    port map (
      I0 => U_DONE_COUNT_count(23),
      I1 => U_DONE_COUNT_Mcount_count23,
      I2 => U_DONE_COUNT_count_not0001,
      O => U_DONE_COUNT_count_23_rstpot_320
    );
  U_DONE_COUNT_count_23 : FDC
    port map (
      C => user_clk,
      CLR => rst,
      D => U_DONE_COUNT_count_23_rstpot_320,
      Q => U_DONE_COUNT_count(23)
    );
  U_DONE_COUNT_count_24_rstpot : LUT3
    generic map(
      INIT => X"CA"
    )
    port map (
      I0 => U_DONE_COUNT_count(24),
      I1 => U_DONE_COUNT_Mcount_count24,
      I2 => U_DONE_COUNT_count_not0001,
      O => U_DONE_COUNT_count_24_rstpot_322
    );
  U_DONE_COUNT_count_24 : FDC
    port map (
      C => user_clk,
      CLR => rst,
      D => U_DONE_COUNT_count_24_rstpot_322,
      Q => U_DONE_COUNT_count(24)
    );
  handshake_go_mux00011 : LUT4
    generic map(
      INIT => X"3120"
    )
    port map (
      I0 => state_FSM_FFd1_782,
      I1 => state_FSM_FFd2_784,
      I2 => done_s,
      I3 => go,
      O => handshake_go_mux0001
    );
  U_DONE_COUNT_Mcount_count_lut_0_Q : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U_DONE_COUNT_count(0),
      I1 => clear,
      O => U_DONE_COUNT_Mcount_count_lut(0)
    );
  U_DONE_COUNT_Mcount_count_lut_1_Q : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U_DONE_COUNT_count(1),
      I1 => clear,
      O => U_DONE_COUNT_Mcount_count_lut(1)
    );
  U_DONE_COUNT_Mcount_count_lut_2_Q : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U_DONE_COUNT_count(2),
      I1 => clear,
      O => U_DONE_COUNT_Mcount_count_lut(2)
    );
  U_DONE_COUNT_Mcount_count_lut_3_Q : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U_DONE_COUNT_count(3),
      I1 => clear,
      O => U_DONE_COUNT_Mcount_count_lut(3)
    );
  U_DONE_COUNT_Mcount_count_lut_4_Q : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U_DONE_COUNT_count(4),
      I1 => clear,
      O => U_DONE_COUNT_Mcount_count_lut(4)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000_0_1 : LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_count(1),
      I1 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_count(2),
      I2 => N37,
      I3 => width_fifo_full,
      O => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_N0
    );
  U_AG_SI_next_state_0_mux00001 : LUT3
    generic map(
      INIT => X"96"
    )
    port map (
      I0 => U_AG_SI_state(0),
      I1 => U_HANDSHAKE_U_TAKE_IT_SYNC_output(0),
      I2 => U_HANDSHAKE_take_it_tg_ff_360,
      O => U_AG_SI_next_state
    );
  mem_fifo_rd1 : LUT4
    generic map(
      INIT => X"000B"
    )
    port map (
      I0 => rd_en,
      I1 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_count(0),
      I2 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_count(1),
      I3 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_count(2),
      O => mem_fifo_rd
    );
  valid1 : LUT4
    generic map(
      INIT => X"3332"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_count(2),
      I1 => done_s,
      I2 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_count(0),
      I3 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_count(1),
      O => valid
    );
  U_AG_SI_sram_ld_n1 : LUT4
    generic map(
      INIT => X"F6FF"
    )
    port map (
      I0 => U_HANDSHAKE_take_it_tg_ff_360,
      I1 => U_HANDSHAKE_U_TAKE_IT_SYNC_output(0),
      I2 => ag_stall,
      I3 => U_AG_SI_state(0),
      O => sram_ld_n
    );
  U_AG_SI_sram_request1 : LUT4
    generic map(
      INIT => X"0082"
    )
    port map (
      I0 => U_AG_SI_state(0),
      I1 => U_HANDSHAKE_U_TAKE_IT_SYNC_output(0),
      I2 => U_HANDSHAKE_take_it_tg_ff_360,
      I3 => ag_stall,
      O => sram_request
    );
  busy_mux0001 : MUXF5
    port map (
      I0 => N55,
      I1 => N56,
      S => state_FSM_FFd1_782,
      O => busy_mux0001_486
    );
  busy_mux0001_F : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => state_FSM_FFd2_784,
      I1 => go,
      I2 => busy_485,
      O => N55
    );
  busy_mux0001_G : LUT4
    generic map(
      INIT => X"82AA"
    )
    port map (
      I0 => busy_485,
      I1 => U_HANDSHAKE_got_it_tg_ff_354,
      I2 => U_HANDSHAKE_U_GOT_IT_SYNC_output(0),
      I3 => state_FSM_FFd2_784,
      O => N56
    );
  U_AG_SI_Madd_next_addr_current_addsub0000_lut_1_INV_0 : INV
    port map (
      I => U_AG_SI_addr_current(1),
      O => U_AG_SI_Madd_next_addr_current_addsub0000_lut(1)
    );
  U_HANDSHAKE_take_it_tg_not00011_INV_0 : INV
    port map (
      I => U_HANDSHAKE_take_it_tg_359,
      O => U_HANDSHAKE_take_it_tg_not0001
    );
  U_HANDSHAKE_got_it_tg_not00011_INV_0 : INV
    port map (
      I => U_HANDSHAKE_got_it_tg_353,
      O => U_HANDSHAKE_got_it_tg_not0001
    );
  clear_inv1_INV_0 : INV
    port map (
      I => clear,
      O => clear_inv
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_next_count_2_1 : LUT3
    generic map(
      INIT => X"FD"
    )
    port map (
      I0 => rd_en,
      I1 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_count(1),
      I2 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_count(0),
      O => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_next_count_2_1_482
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_next_count_2_2 : LUT4
    generic map(
      INIT => X"0501"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_count(1),
      I1 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_count(0),
      I2 => mem_fifo_empty,
      I3 => rd_en,
      O => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_next_count_2_2_483
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_next_count_2_f5 : MUXF5
    port map (
      I0 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_next_count_2_2_483,
      I1 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_next_count_2_1_482,
      S => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_count(2),
      O => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_next_count(2)
    );
  U_AG_SI_next_addr_current_16_2711 : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => U_AG_SI_addr_current(16),
      I1 => handshake_rcv,
      I2 => ag_stall,
      I3 => U_AG_SI_next_addr_current_addsub0000(16),
      O => U_AG_SI_next_addr_current_16_271
    );
  U_AG_SI_next_addr_current_16_271_f5 : MUXF5
    port map (
      I0 => start_addr_s(16),
      I1 => U_AG_SI_next_addr_current_16_271,
      S => U_AG_SI_state(0),
      O => U_AG_SI_next_addr_current(16)
    );
  U_AG_SI_next_addr_current_20_2711 : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => U_AG_SI_addr_current(20),
      I1 => handshake_rcv,
      I2 => ag_stall,
      I3 => U_AG_SI_next_addr_current_addsub0000(20),
      O => U_AG_SI_next_addr_current_20_271
    );
  U_AG_SI_next_addr_current_20_271_f5 : MUXF5
    port map (
      I0 => start_addr_s(20),
      I1 => U_AG_SI_next_addr_current_20_271,
      S => U_AG_SI_state(0),
      O => U_AG_SI_next_addr_current(20)
    );
  U_AG_SI_next_addr_current_19_2711 : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => U_AG_SI_addr_current(19),
      I1 => handshake_rcv,
      I2 => ag_stall,
      I3 => U_AG_SI_next_addr_current_addsub0000(19),
      O => U_AG_SI_next_addr_current_19_271
    );
  U_AG_SI_next_addr_current_19_271_f5 : MUXF5
    port map (
      I0 => start_addr_s(19),
      I1 => U_AG_SI_next_addr_current_19_271,
      S => U_AG_SI_state(0),
      O => U_AG_SI_next_addr_current(19)
    );
  U_AG_SI_next_addr_current_18_2711 : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => U_AG_SI_addr_current(18),
      I1 => handshake_rcv,
      I2 => ag_stall,
      I3 => U_AG_SI_next_addr_current_addsub0000(18),
      O => U_AG_SI_next_addr_current_18_271
    );
  U_AG_SI_next_addr_current_18_271_f5 : MUXF5
    port map (
      I0 => start_addr_s(18),
      I1 => U_AG_SI_next_addr_current_18_271,
      S => U_AG_SI_state(0),
      O => U_AG_SI_next_addr_current(18)
    );
  U_AG_SI_next_addr_current_17_2711 : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => U_AG_SI_addr_current(17),
      I1 => handshake_rcv,
      I2 => ag_stall,
      I3 => U_AG_SI_next_addr_current_addsub0000(17),
      O => U_AG_SI_next_addr_current_17_271
    );
  U_AG_SI_next_addr_current_17_271_f5 : MUXF5
    port map (
      I0 => start_addr_s(17),
      I1 => U_AG_SI_next_addr_current_17_271,
      S => U_AG_SI_state(0),
      O => U_AG_SI_next_addr_current(17)
    );
  U_AG_SI_next_addr_current_15_2711 : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => U_AG_SI_addr_current(15),
      I1 => handshake_rcv,
      I2 => ag_stall,
      I3 => U_AG_SI_next_addr_current_addsub0000(15),
      O => U_AG_SI_next_addr_current_15_271
    );
  U_AG_SI_next_addr_current_15_271_f5 : MUXF5
    port map (
      I0 => start_addr_s(15),
      I1 => U_AG_SI_next_addr_current_15_271,
      S => U_AG_SI_state(0),
      O => U_AG_SI_next_addr_current(15)
    );
  U_AG_SI_next_addr_current_14_2711 : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => U_AG_SI_addr_current(14),
      I1 => handshake_rcv,
      I2 => ag_stall,
      I3 => U_AG_SI_next_addr_current_addsub0000(14),
      O => U_AG_SI_next_addr_current_14_271
    );
  U_AG_SI_next_addr_current_14_271_f5 : MUXF5
    port map (
      I0 => start_addr_s(14),
      I1 => U_AG_SI_next_addr_current_14_271,
      S => U_AG_SI_state(0),
      O => U_AG_SI_next_addr_current(14)
    );
  U_AG_SI_next_addr_current_13_2711 : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => U_AG_SI_addr_current(13),
      I1 => handshake_rcv,
      I2 => ag_stall,
      I3 => U_AG_SI_next_addr_current_addsub0000(13),
      O => U_AG_SI_next_addr_current_13_271
    );
  U_AG_SI_next_addr_current_13_271_f5 : MUXF5
    port map (
      I0 => start_addr_s(13),
      I1 => U_AG_SI_next_addr_current_13_271,
      S => U_AG_SI_state(0),
      O => U_AG_SI_next_addr_current(13)
    );
  U_AG_SI_next_addr_current_12_2711 : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => U_AG_SI_addr_current(12),
      I1 => handshake_rcv,
      I2 => ag_stall,
      I3 => U_AG_SI_next_addr_current_addsub0000(12),
      O => U_AG_SI_next_addr_current_12_271
    );
  U_AG_SI_next_addr_current_12_271_f5 : MUXF5
    port map (
      I0 => start_addr_s(12),
      I1 => U_AG_SI_next_addr_current_12_271,
      S => U_AG_SI_state(0),
      O => U_AG_SI_next_addr_current(12)
    );
  U_AG_SI_next_addr_current_11_2711 : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => U_AG_SI_addr_current(11),
      I1 => handshake_rcv,
      I2 => ag_stall,
      I3 => U_AG_SI_next_addr_current_addsub0000(11),
      O => U_AG_SI_next_addr_current_11_271
    );
  U_AG_SI_next_addr_current_11_271_f5 : MUXF5
    port map (
      I0 => start_addr_s(11),
      I1 => U_AG_SI_next_addr_current_11_271,
      S => U_AG_SI_state(0),
      O => U_AG_SI_next_addr_current(11)
    );
  U_AG_SI_next_addr_current_10_2711 : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => U_AG_SI_addr_current(10),
      I1 => handshake_rcv,
      I2 => ag_stall,
      I3 => U_AG_SI_next_addr_current_addsub0000(10),
      O => U_AG_SI_next_addr_current_10_271
    );
  U_AG_SI_next_addr_current_10_271_f5 : MUXF5
    port map (
      I0 => start_addr_s(10),
      I1 => U_AG_SI_next_addr_current_10_271,
      S => U_AG_SI_state(0),
      O => U_AG_SI_next_addr_current(10)
    );
  U_AG_SI_next_addr_current_9_2711 : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => U_AG_SI_addr_current(9),
      I1 => handshake_rcv,
      I2 => ag_stall,
      I3 => U_AG_SI_next_addr_current_addsub0000(9),
      O => U_AG_SI_next_addr_current_9_271
    );
  U_AG_SI_next_addr_current_9_271_f5 : MUXF5
    port map (
      I0 => start_addr_s(9),
      I1 => U_AG_SI_next_addr_current_9_271,
      S => U_AG_SI_state(0),
      O => U_AG_SI_next_addr_current(9)
    );
  U_AG_SI_next_addr_current_8_2711 : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => U_AG_SI_addr_current(8),
      I1 => handshake_rcv,
      I2 => ag_stall,
      I3 => U_AG_SI_next_addr_current_addsub0000(8),
      O => U_AG_SI_next_addr_current_8_271
    );
  U_AG_SI_next_addr_current_8_271_f5 : MUXF5
    port map (
      I0 => start_addr_s(8),
      I1 => U_AG_SI_next_addr_current_8_271,
      S => U_AG_SI_state(0),
      O => U_AG_SI_next_addr_current(8)
    );
  U_AG_SI_next_addr_current_7_2711 : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => U_AG_SI_addr_current(7),
      I1 => handshake_rcv,
      I2 => ag_stall,
      I3 => U_AG_SI_next_addr_current_addsub0000(7),
      O => U_AG_SI_next_addr_current_7_271
    );
  U_AG_SI_next_addr_current_7_271_f5 : MUXF5
    port map (
      I0 => start_addr_s(7),
      I1 => U_AG_SI_next_addr_current_7_271,
      S => U_AG_SI_state(0),
      O => U_AG_SI_next_addr_current(7)
    );
  U_AG_SI_next_addr_current_6_2711 : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => U_AG_SI_addr_current(6),
      I1 => handshake_rcv,
      I2 => ag_stall,
      I3 => U_AG_SI_next_addr_current_addsub0000(6),
      O => U_AG_SI_next_addr_current_6_271
    );
  U_AG_SI_next_addr_current_6_271_f5 : MUXF5
    port map (
      I0 => start_addr_s(6),
      I1 => U_AG_SI_next_addr_current_6_271,
      S => U_AG_SI_state(0),
      O => U_AG_SI_next_addr_current(6)
    );
  U_AG_SI_next_addr_current_5_2711 : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => U_AG_SI_addr_current(5),
      I1 => handshake_rcv,
      I2 => ag_stall,
      I3 => U_AG_SI_next_addr_current_addsub0000(5),
      O => U_AG_SI_next_addr_current_5_271
    );
  U_AG_SI_next_addr_current_5_271_f5 : MUXF5
    port map (
      I0 => start_addr_s(5),
      I1 => U_AG_SI_next_addr_current_5_271,
      S => U_AG_SI_state(0),
      O => U_AG_SI_next_addr_current(5)
    );
  U_AG_SI_next_addr_current_4_2711 : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => U_AG_SI_addr_current(4),
      I1 => handshake_rcv,
      I2 => ag_stall,
      I3 => U_AG_SI_next_addr_current_addsub0000(4),
      O => U_AG_SI_next_addr_current_4_271
    );
  U_AG_SI_next_addr_current_4_271_f5 : MUXF5
    port map (
      I0 => start_addr_s(4),
      I1 => U_AG_SI_next_addr_current_4_271,
      S => U_AG_SI_state(0),
      O => U_AG_SI_next_addr_current(4)
    );
  U_AG_SI_next_addr_current_3_2711 : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => U_AG_SI_addr_current(3),
      I1 => handshake_rcv,
      I2 => ag_stall,
      I3 => U_AG_SI_next_addr_current_addsub0000(3),
      O => U_AG_SI_next_addr_current_3_271
    );
  U_AG_SI_next_addr_current_3_271_f5 : MUXF5
    port map (
      I0 => start_addr_s(3),
      I1 => U_AG_SI_next_addr_current_3_271,
      S => U_AG_SI_state(0),
      O => U_AG_SI_next_addr_current(3)
    );
  U_AG_SI_next_addr_current_2_2711 : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => U_AG_SI_addr_current(2),
      I1 => handshake_rcv,
      I2 => ag_stall,
      I3 => U_AG_SI_next_addr_current_addsub0000(2),
      O => U_AG_SI_next_addr_current_2_271
    );
  U_AG_SI_next_addr_current_2_271_f5 : MUXF5
    port map (
      I0 => start_addr_s(2),
      I1 => U_AG_SI_next_addr_current_2_271,
      S => U_AG_SI_state(0),
      O => U_AG_SI_next_addr_current(2)
    );
  U_AG_SI_next_addr_current_1_2711 : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => U_AG_SI_addr_current(1),
      I1 => handshake_rcv,
      I2 => ag_stall,
      I3 => U_AG_SI_next_addr_current_addsub0000(1),
      O => U_AG_SI_next_addr_current_1_271
    );
  U_AG_SI_next_addr_current_1_271_f5 : MUXF5
    port map (
      I0 => start_addr_s(1),
      I1 => U_AG_SI_next_addr_current_1_271,
      S => U_AG_SI_state(0),
      O => U_AG_SI_next_addr_current(1)
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_not0001_SW0 : LUT4_L
    generic map(
      INIT => X"888D"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_count(1),
      I1 => rd_en,
      I2 => mem_fifo_empty,
      I3 => width_fifo_full,
      LO => N6
    );
  U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_data_mux0000_0_1_SW1 : LUT3_L
    generic map(
      INIT => X"F2"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_SHRINK_U_SHRINK_FIFO_count(0),
      I1 => rd_en,
      I2 => mem_fifo_empty,
      LO => N37
    );
  U_DONE_COUNT_count_not00011_1 : LUT4_D
    generic map(
      INIT => X"CCCE"
    )
    port map (
      I0 => rd_en,
      I1 => clear,
      I2 => width_fifo_empty,
      I3 => done_s,
      LO => N57,
      O => U_DONE_COUNT_count_not00011_346
    );
  U_FIFO : fifo_64_prog_full
    port map (
      prog_full => mem_fifo_prog_full,
      rd_en => mem_fifo_rd,
      wr_en => sram_valid,
      full => NLW_U_FIFO_full_UNCONNECTED,
      empty => mem_fifo_empty,
      wr_clk => sram_clk,
      rst => rst_s,
      rd_clk => user_clk,
      dout(63) => mem_fifo_out(63),
      dout(62) => mem_fifo_out(62),
      dout(61) => mem_fifo_out(61),
      dout(60) => mem_fifo_out(60),
      dout(59) => mem_fifo_out(59),
      dout(58) => mem_fifo_out(58),
      dout(57) => mem_fifo_out(57),
      dout(56) => mem_fifo_out(56),
      dout(55) => mem_fifo_out(55),
      dout(54) => mem_fifo_out(54),
      dout(53) => mem_fifo_out(53),
      dout(52) => mem_fifo_out(52),
      dout(51) => mem_fifo_out(51),
      dout(50) => mem_fifo_out(50),
      dout(49) => mem_fifo_out(49),
      dout(48) => mem_fifo_out(48),
      dout(47) => mem_fifo_out(47),
      dout(46) => mem_fifo_out(46),
      dout(45) => mem_fifo_out(45),
      dout(44) => mem_fifo_out(44),
      dout(43) => mem_fifo_out(43),
      dout(42) => mem_fifo_out(42),
      dout(41) => mem_fifo_out(41),
      dout(40) => mem_fifo_out(40),
      dout(39) => mem_fifo_out(39),
      dout(38) => mem_fifo_out(38),
      dout(37) => mem_fifo_out(37),
      dout(36) => mem_fifo_out(36),
      dout(35) => mem_fifo_out(35),
      dout(34) => mem_fifo_out(34),
      dout(33) => mem_fifo_out(33),
      dout(32) => mem_fifo_out(32),
      dout(31) => mem_fifo_out(31),
      dout(30) => mem_fifo_out(30),
      dout(29) => mem_fifo_out(29),
      dout(28) => mem_fifo_out(28),
      dout(27) => mem_fifo_out(27),
      dout(26) => mem_fifo_out(26),
      dout(25) => mem_fifo_out(25),
      dout(24) => mem_fifo_out(24),
      dout(23) => mem_fifo_out(23),
      dout(22) => mem_fifo_out(22),
      dout(21) => mem_fifo_out(21),
      dout(20) => mem_fifo_out(20),
      dout(19) => mem_fifo_out(19),
      dout(18) => mem_fifo_out(18),
      dout(17) => mem_fifo_out(17),
      dout(16) => mem_fifo_out(16),
      dout(15) => mem_fifo_out(15),
      dout(14) => mem_fifo_out(14),
      dout(13) => mem_fifo_out(13),
      dout(12) => mem_fifo_out(12),
      dout(11) => mem_fifo_out(11),
      dout(10) => mem_fifo_out(10),
      dout(9) => mem_fifo_out(9),
      dout(8) => mem_fifo_out(8),
      dout(7) => mem_fifo_out(7),
      dout(6) => mem_fifo_out(6),
      dout(5) => mem_fifo_out(5),
      dout(4) => mem_fifo_out(4),
      dout(3) => mem_fifo_out(3),
      dout(2) => mem_fifo_out(2),
      dout(1) => mem_fifo_out(1),
      dout(0) => mem_fifo_out(0),
      din(63) => sram_rdata(63),
      din(62) => sram_rdata(62),
      din(61) => sram_rdata(61),
      din(60) => sram_rdata(60),
      din(59) => sram_rdata(59),
      din(58) => sram_rdata(58),
      din(57) => sram_rdata(57),
      din(56) => sram_rdata(56),
      din(55) => sram_rdata(55),
      din(54) => sram_rdata(54),
      din(53) => sram_rdata(53),
      din(52) => sram_rdata(52),
      din(51) => sram_rdata(51),
      din(50) => sram_rdata(50),
      din(49) => sram_rdata(49),
      din(48) => sram_rdata(48),
      din(47) => sram_rdata(47),
      din(46) => sram_rdata(46),
      din(45) => sram_rdata(45),
      din(44) => sram_rdata(44),
      din(43) => sram_rdata(43),
      din(42) => sram_rdata(42),
      din(41) => sram_rdata(41),
      din(40) => sram_rdata(40),
      din(39) => sram_rdata(39),
      din(38) => sram_rdata(38),
      din(37) => sram_rdata(37),
      din(36) => sram_rdata(36),
      din(35) => sram_rdata(35),
      din(34) => sram_rdata(34),
      din(33) => sram_rdata(33),
      din(32) => sram_rdata(32),
      din(31) => sram_rdata(31),
      din(30) => sram_rdata(30),
      din(29) => sram_rdata(29),
      din(28) => sram_rdata(28),
      din(27) => sram_rdata(27),
      din(26) => sram_rdata(26),
      din(25) => sram_rdata(25),
      din(24) => sram_rdata(24),
      din(23) => sram_rdata(23),
      din(22) => sram_rdata(22),
      din(21) => sram_rdata(21),
      din(20) => sram_rdata(20),
      din(19) => sram_rdata(19),
      din(18) => sram_rdata(18),
      din(17) => sram_rdata(17),
      din(16) => sram_rdata(16),
      din(15) => sram_rdata(15),
      din(14) => sram_rdata(14),
      din(13) => sram_rdata(13),
      din(12) => sram_rdata(12),
      din(11) => sram_rdata(11),
      din(10) => sram_rdata(10),
      din(9) => sram_rdata(9),
      din(8) => sram_rdata(8),
      din(7) => sram_rdata(7),
      din(6) => sram_rdata(6),
      din(5) => sram_rdata(5),
      din(4) => sram_rdata(4),
      din(3) => sram_rdata(3),
      din(2) => sram_rdata(2),
      din(1) => sram_rdata(1),
      din(0) => sram_rdata(0)
    );

end Structure;

-- synthesis translate_on
