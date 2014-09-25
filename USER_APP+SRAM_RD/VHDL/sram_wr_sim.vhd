--------------------------------------------------------------------------------
-- Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: K.39
--  \   \         Application: netgen
--  /   /         Filename: sram_wr_synthesis.vhd
-- /___/   /\     Timestamp: Tue Oct 26 16:13:59 2010
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -ar Structure -tm sram_wr -w -dir netgen/synthesis -ofmt vhdl -sim sram_wr.ngc sram_wr_synthesis.vhd 
-- Device	: xc4vlx100-12-ff1148
-- Input file	: sram_wr.ngc
-- Output file	: C:\Users\gstitt\Documents\teaching\fall10\temp\temp2\netgen\synthesis\sram_wr_synthesis.vhd
-- # of Entities	: 1
-- Design Name	: sram_wr
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

entity sram_wr is
  port (
    sram_fifo_empty : in STD_LOGIC := 'X'; 
    rst : in STD_LOGIC := 'X'; 
    sram_request : out STD_LOGIC; 
    clear : in STD_LOGIC := 'X'; 
    go : in STD_LOGIC := 'X'; 
    user_clk : in STD_LOGIC := 'X'; 
    wr_en : in STD_LOGIC := 'X'; 
    sram_ld_n : out STD_LOGIC; 
    done : out STD_LOGIC; 
    sram_calibrated : in STD_LOGIC := 'X'; 
    sram_fifo_full : in STD_LOGIC := 'X'; 
    sram_clk : in STD_LOGIC := 'X'; 
    ready : out STD_LOGIC; 
    sram_rw_n : out STD_LOGIC; 
    sram_wdata : out STD_LOGIC_VECTOR ( 63 downto 0 ); 
    sram_bw_n : out STD_LOGIC_VECTOR ( 7 downto 0 ); 
    sram_addr : out STD_LOGIC_VECTOR ( 20 downto 0 ); 
    start_addr : in STD_LOGIC_VECTOR ( 20 downto 0 ); 
    size : in STD_LOGIC_VECTOR ( 31 downto 0 ); 
    data : in STD_LOGIC_VECTOR ( 15 downto 0 ) 
  );
end sram_wr;

architecture Structure of sram_wr is
  component fifo_64
    port (
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
  signal Mcount_empty_count : STD_LOGIC; 
  signal Mcount_empty_count3 : STD_LOGIC; 
  signal Mcount_empty_count6 : STD_LOGIC; 
  signal N1 : STD_LOGIC; 
  signal N11 : STD_LOGIC; 
  signal N13 : STD_LOGIC; 
  signal N15 : STD_LOGIC; 
  signal N2 : STD_LOGIC; 
  signal N4 : STD_LOGIC; 
  signal N62 : STD_LOGIC; 
  signal N63 : STD_LOGIC; 
  signal N64 : STD_LOGIC; 
  signal N65 : STD_LOGIC; 
  signal N66 : STD_LOGIC; 
  signal N67 : STD_LOGIC; 
  signal N68 : STD_LOGIC; 
  signal N69 : STD_LOGIC; 
  signal N70 : STD_LOGIC; 
  signal N71 : STD_LOGIC; 
  signal N72 : STD_LOGIC; 
  signal N73 : STD_LOGIC; 
  signal N74 : STD_LOGIC; 
  signal N75 : STD_LOGIC; 
  signal N76 : STD_LOGIC; 
  signal N8 : STD_LOGIC; 
  signal N9 : STD_LOGIC; 
  signal U_AG_SO_Madd_next_addr_current_addsub0000_cy_10_rt_27 : STD_LOGIC; 
  signal U_AG_SO_Madd_next_addr_current_addsub0000_cy_11_rt_29 : STD_LOGIC; 
  signal U_AG_SO_Madd_next_addr_current_addsub0000_cy_12_rt_31 : STD_LOGIC; 
  signal U_AG_SO_Madd_next_addr_current_addsub0000_cy_13_rt_33 : STD_LOGIC; 
  signal U_AG_SO_Madd_next_addr_current_addsub0000_cy_14_rt_35 : STD_LOGIC; 
  signal U_AG_SO_Madd_next_addr_current_addsub0000_cy_15_rt_37 : STD_LOGIC; 
  signal U_AG_SO_Madd_next_addr_current_addsub0000_cy_16_rt_39 : STD_LOGIC; 
  signal U_AG_SO_Madd_next_addr_current_addsub0000_cy_17_rt_41 : STD_LOGIC; 
  signal U_AG_SO_Madd_next_addr_current_addsub0000_cy_18_rt_43 : STD_LOGIC; 
  signal U_AG_SO_Madd_next_addr_current_addsub0000_cy_19_rt_45 : STD_LOGIC; 
  signal U_AG_SO_Madd_next_addr_current_addsub0000_cy_2_rt_48 : STD_LOGIC; 
  signal U_AG_SO_Madd_next_addr_current_addsub0000_cy_3_rt_50 : STD_LOGIC; 
  signal U_AG_SO_Madd_next_addr_current_addsub0000_cy_4_rt_52 : STD_LOGIC; 
  signal U_AG_SO_Madd_next_addr_current_addsub0000_cy_5_rt_54 : STD_LOGIC; 
  signal U_AG_SO_Madd_next_addr_current_addsub0000_cy_6_rt_56 : STD_LOGIC; 
  signal U_AG_SO_Madd_next_addr_current_addsub0000_cy_7_rt_58 : STD_LOGIC; 
  signal U_AG_SO_Madd_next_addr_current_addsub0000_cy_8_rt_60 : STD_LOGIC; 
  signal U_AG_SO_Madd_next_addr_current_addsub0000_cy_9_rt_62 : STD_LOGIC; 
  signal U_AG_SO_Madd_next_addr_current_addsub0000_xor_20_rt_64 : STD_LOGIC; 
  signal U_AG_SO_next_addr_current_10_271 : STD_LOGIC; 
  signal U_AG_SO_next_addr_current_11_271 : STD_LOGIC; 
  signal U_AG_SO_next_addr_current_12_271 : STD_LOGIC; 
  signal U_AG_SO_next_addr_current_13_271 : STD_LOGIC; 
  signal U_AG_SO_next_addr_current_14_271 : STD_LOGIC; 
  signal U_AG_SO_next_addr_current_15_271 : STD_LOGIC; 
  signal U_AG_SO_next_addr_current_16_271 : STD_LOGIC; 
  signal U_AG_SO_next_addr_current_17_271 : STD_LOGIC; 
  signal U_AG_SO_next_addr_current_18_271 : STD_LOGIC; 
  signal U_AG_SO_next_addr_current_19_271 : STD_LOGIC; 
  signal U_AG_SO_next_addr_current_1_271 : STD_LOGIC; 
  signal U_AG_SO_next_addr_current_20_271 : STD_LOGIC; 
  signal U_AG_SO_next_addr_current_2_271 : STD_LOGIC; 
  signal U_AG_SO_next_addr_current_3_271 : STD_LOGIC; 
  signal U_AG_SO_next_addr_current_4_271 : STD_LOGIC; 
  signal U_AG_SO_next_addr_current_5_271 : STD_LOGIC; 
  signal U_AG_SO_next_addr_current_6_271 : STD_LOGIC; 
  signal U_AG_SO_next_addr_current_7_271 : STD_LOGIC; 
  signal U_AG_SO_next_addr_current_8_271 : STD_LOGIC; 
  signal U_AG_SO_next_addr_current_9_271 : STD_LOGIC; 
  signal U_AG_SO_next_state : STD_LOGIC; 
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
  signal U_DONE_COUNT_count_0_rstpot_308 : STD_LOGIC; 
  signal U_DONE_COUNT_count_10_rstpot_311 : STD_LOGIC; 
  signal U_DONE_COUNT_count_11_rstpot_313 : STD_LOGIC; 
  signal U_DONE_COUNT_count_12_rstpot_315 : STD_LOGIC; 
  signal U_DONE_COUNT_count_13_rstpot_317 : STD_LOGIC; 
  signal U_DONE_COUNT_count_14_rstpot_319 : STD_LOGIC; 
  signal U_DONE_COUNT_count_15_rstpot_321 : STD_LOGIC; 
  signal U_DONE_COUNT_count_16_rstpot_323 : STD_LOGIC; 
  signal U_DONE_COUNT_count_17_rstpot_325 : STD_LOGIC; 
  signal U_DONE_COUNT_count_18_rstpot_327 : STD_LOGIC; 
  signal U_DONE_COUNT_count_19_rstpot_329 : STD_LOGIC; 
  signal U_DONE_COUNT_count_1_rstpot_330 : STD_LOGIC; 
  signal U_DONE_COUNT_count_20_rstpot_333 : STD_LOGIC; 
  signal U_DONE_COUNT_count_21_rstpot_335 : STD_LOGIC; 
  signal U_DONE_COUNT_count_22_rstpot_337 : STD_LOGIC; 
  signal U_DONE_COUNT_count_23_rstpot_339 : STD_LOGIC; 
  signal U_DONE_COUNT_count_24_rstpot_341 : STD_LOGIC; 
  signal U_DONE_COUNT_count_2_rstpot_347 : STD_LOGIC; 
  signal U_DONE_COUNT_count_3_rstpot_351 : STD_LOGIC; 
  signal U_DONE_COUNT_count_4_rstpot_353 : STD_LOGIC; 
  signal U_DONE_COUNT_count_5_rstpot_355 : STD_LOGIC; 
  signal U_DONE_COUNT_count_6_rstpot_357 : STD_LOGIC; 
  signal U_DONE_COUNT_count_7_rstpot_359 : STD_LOGIC; 
  signal U_DONE_COUNT_count_8_rstpot_361 : STD_LOGIC; 
  signal U_DONE_COUNT_count_9_rstpot_363 : STD_LOGIC; 
  signal U_DONE_COUNT_count_not0001 : STD_LOGIC; 
  signal U_DONE_COUNT_count_not00011_365 : STD_LOGIC; 
  signal U_HANDSHAKE_got_it_tg_372 : STD_LOGIC; 
  signal U_HANDSHAKE_got_it_tg_ff_373 : STD_LOGIC; 
  signal U_HANDSHAKE_got_it_tg_not0001 : STD_LOGIC; 
  signal U_HANDSHAKE_next_state : STD_LOGIC; 
  signal U_HANDSHAKE_start_pl : STD_LOGIC; 
  signal U_HANDSHAKE_take_it_tg_378 : STD_LOGIC; 
  signal U_HANDSHAKE_take_it_tg_ff_379 : STD_LOGIC; 
  signal U_HANDSHAKE_take_it_tg_not0001 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_N5 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count_0_rstpot_383 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count_1_rstpot_385 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count_2_rstpot_387 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count_not0001 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_0_389 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_0_rstpot_390 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_1_391 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_10_392 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_10_rstpot_393 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_11_394 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_11_rstpot_395 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_12_396 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_12_rstpot_397 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_13_398 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_13_rstpot_399 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_14_400 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_14_rstpot_401 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_15_402 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_15_rstpot_403 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_1_rstpot_404 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_2_405 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_2_rstpot_406 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_3_407 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_3_rstpot_408 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_4_409 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_4_rstpot_410 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_5_411 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_5_rstpot_412 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_6_413 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_6_rstpot_414 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_7_415 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_7_rstpot_416 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_8_417 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_8_rstpot_418 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_9_419 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_9_rstpot_420 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and0000 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and00001_422 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and000011 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and000012 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_0_425 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_0_rstpot_426 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_1_427 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_10_428 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_10_rstpot_429 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_11_430 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_11_rstpot_431 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_12_432 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_12_rstpot_433 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_13_434 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_13_rstpot_435 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_14_436 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_14_rstpot_437 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_15_438 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_15_rstpot_439 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_1_rstpot_440 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_2_441 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_2_rstpot_442 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_3_443 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_3_rstpot_444 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_4_445 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_4_rstpot_446 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_5_447 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_5_rstpot_448 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_6_449 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_6_rstpot_450 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_7_451 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_7_rstpot_452 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_8_453 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_8_rstpot_454 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_9_455 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_9_rstpot_456 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_0_457 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_0_rstpot_458 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_1_459 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_10_460 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_10_rstpot_461 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_11_462 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_11_rstpot_463 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_12_464 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_12_rstpot_465 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_13_466 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_13_rstpot_467 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_14_468 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_14_rstpot_469 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_15_470 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_15_rstpot_471 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_1_rstpot_472 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_2_473 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_2_rstpot_474 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_3_475 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_3_rstpot_476 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_4_477 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_4_rstpot_478 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_5_479 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_5_rstpot_480 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_6_481 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_6_rstpot_482 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_7_483 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_7_rstpot_484 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_8_485 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_8_rstpot_486 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_9_487 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_9_rstpot_488 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_0_489 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_0_rstpot_490 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_1_491 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_10_492 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_10_rstpot_493 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_11_494 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_11_rstpot_495 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_12_496 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_12_rstpot_497 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_13_498 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_13_rstpot_499 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_14_500 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_14_rstpot_501 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_15_502 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_15_rstpot_503 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_1_rstpot_504 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_2_505 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_2_rstpot_506 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_3_507 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_3_rstpot_508 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_4_509 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_4_rstpot_510 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_5_511 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_5_rstpot_512 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_6_513 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_6_rstpot_514 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_7_515 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_7_rstpot_516 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_8_517 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_8_rstpot_518 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_9_519 : STD_LOGIC; 
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_9_rstpot_520 : STD_LOGIC; 
  signal actually_empty_521 : STD_LOGIC; 
  signal actually_empty_cmp_eq0000 : STD_LOGIC; 
  signal ag_stall : STD_LOGIC; 
  signal busy_524 : STD_LOGIC; 
  signal busy_mux0001 : STD_LOGIC; 
  signal clear_inv : STD_LOGIC; 
  signal done_s : STD_LOGIC; 
  signal empty_count_not0001 : STD_LOGIC; 
  signal handshake_go_551 : STD_LOGIC; 
  signal handshake_go_mux0001 : STD_LOGIC; 
  signal handshake_rcv : STD_LOGIC; 
  signal mem_fifo_empty : STD_LOGIC; 
  signal mem_fifo_full : STD_LOGIC; 
  signal mem_fifo_rd : STD_LOGIC; 
  signal mem_fifo_wr : STD_LOGIC; 
  signal rst_s : STD_LOGIC; 
  signal NlwRenamedSignal_sram_rw_n : STD_LOGIC; 
  signal state_FSM_FFd1_758 : STD_LOGIC; 
  signal state_FSM_FFd1_In_759 : STD_LOGIC; 
  signal state_FSM_FFd2_760 : STD_LOGIC; 
  signal state_FSM_FFd2_In : STD_LOGIC; 
  signal width_fifo_empty_internal : STD_LOGIC; 
  signal width_fifo_full : STD_LOGIC; 
  signal width_fifo_wr_765 : STD_LOGIC; 
  signal U_AG_SO_Madd_next_addr_current_addsub0000_cy : STD_LOGIC_VECTOR ( 19 downto 1 ); 
  signal U_AG_SO_Madd_next_addr_current_addsub0000_lut : STD_LOGIC_VECTOR ( 1 downto 1 ); 
  signal U_AG_SO_addr_current : STD_LOGIC_VECTOR ( 20 downto 0 ); 
  signal U_AG_SO_next_addr_current : STD_LOGIC_VECTOR ( 20 downto 0 ); 
  signal U_AG_SO_next_addr_current_addsub0000 : STD_LOGIC_VECTOR ( 20 downto 1 ); 
  signal U_AG_SO_state : STD_LOGIC_VECTOR ( 0 downto 0 ); 
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
  signal U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count : STD_LOGIC_VECTOR ( 2 downto 0 ); 
  signal empty_count : STD_LOGIC_VECTOR ( 2 downto 0 ); 
  signal size_s : STD_LOGIC_VECTOR ( 31 downto 0 ); 
  signal NlwRenamedSig_OI_sram_bw_n : STD_LOGIC_VECTOR ( 0 downto 0 ); 
  signal start_addr_s : STD_LOGIC_VECTOR ( 20 downto 0 ); 
begin
  sram_ld_n <= NlwRenamedSignal_sram_rw_n;
  sram_rw_n <= NlwRenamedSignal_sram_rw_n;
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
  XST_VCC : VCC
    port map (
      P => N1
    );
  start_addr_s_0 : FDCE
    port map (
      C => user_clk,
      CE => handshake_go_mux0001,
      CLR => rst,
      D => start_addr(0),
      Q => start_addr_s(0)
    );
  start_addr_s_1 : FDCE
    port map (
      C => user_clk,
      CE => handshake_go_mux0001,
      CLR => rst,
      D => start_addr(1),
      Q => start_addr_s(1)
    );
  start_addr_s_2 : FDCE
    port map (
      C => user_clk,
      CE => handshake_go_mux0001,
      CLR => rst,
      D => start_addr(2),
      Q => start_addr_s(2)
    );
  start_addr_s_3 : FDCE
    port map (
      C => user_clk,
      CE => handshake_go_mux0001,
      CLR => rst,
      D => start_addr(3),
      Q => start_addr_s(3)
    );
  start_addr_s_4 : FDCE
    port map (
      C => user_clk,
      CE => handshake_go_mux0001,
      CLR => rst,
      D => start_addr(4),
      Q => start_addr_s(4)
    );
  start_addr_s_5 : FDCE
    port map (
      C => user_clk,
      CE => handshake_go_mux0001,
      CLR => rst,
      D => start_addr(5),
      Q => start_addr_s(5)
    );
  start_addr_s_6 : FDCE
    port map (
      C => user_clk,
      CE => handshake_go_mux0001,
      CLR => rst,
      D => start_addr(6),
      Q => start_addr_s(6)
    );
  start_addr_s_7 : FDCE
    port map (
      C => user_clk,
      CE => handshake_go_mux0001,
      CLR => rst,
      D => start_addr(7),
      Q => start_addr_s(7)
    );
  start_addr_s_8 : FDCE
    port map (
      C => user_clk,
      CE => handshake_go_mux0001,
      CLR => rst,
      D => start_addr(8),
      Q => start_addr_s(8)
    );
  start_addr_s_9 : FDCE
    port map (
      C => user_clk,
      CE => handshake_go_mux0001,
      CLR => rst,
      D => start_addr(9),
      Q => start_addr_s(9)
    );
  start_addr_s_10 : FDCE
    port map (
      C => user_clk,
      CE => handshake_go_mux0001,
      CLR => rst,
      D => start_addr(10),
      Q => start_addr_s(10)
    );
  start_addr_s_11 : FDCE
    port map (
      C => user_clk,
      CE => handshake_go_mux0001,
      CLR => rst,
      D => start_addr(11),
      Q => start_addr_s(11)
    );
  start_addr_s_12 : FDCE
    port map (
      C => user_clk,
      CE => handshake_go_mux0001,
      CLR => rst,
      D => start_addr(12),
      Q => start_addr_s(12)
    );
  start_addr_s_13 : FDCE
    port map (
      C => user_clk,
      CE => handshake_go_mux0001,
      CLR => rst,
      D => start_addr(13),
      Q => start_addr_s(13)
    );
  start_addr_s_14 : FDCE
    port map (
      C => user_clk,
      CE => handshake_go_mux0001,
      CLR => rst,
      D => start_addr(14),
      Q => start_addr_s(14)
    );
  start_addr_s_15 : FDCE
    port map (
      C => user_clk,
      CE => handshake_go_mux0001,
      CLR => rst,
      D => start_addr(15),
      Q => start_addr_s(15)
    );
  start_addr_s_16 : FDCE
    port map (
      C => user_clk,
      CE => handshake_go_mux0001,
      CLR => rst,
      D => start_addr(16),
      Q => start_addr_s(16)
    );
  start_addr_s_17 : FDCE
    port map (
      C => user_clk,
      CE => handshake_go_mux0001,
      CLR => rst,
      D => start_addr(17),
      Q => start_addr_s(17)
    );
  start_addr_s_18 : FDCE
    port map (
      C => user_clk,
      CE => handshake_go_mux0001,
      CLR => rst,
      D => start_addr(18),
      Q => start_addr_s(18)
    );
  start_addr_s_19 : FDCE
    port map (
      C => user_clk,
      CE => handshake_go_mux0001,
      CLR => rst,
      D => start_addr(19),
      Q => start_addr_s(19)
    );
  start_addr_s_20 : FDCE
    port map (
      C => user_clk,
      CE => handshake_go_mux0001,
      CLR => rst,
      D => start_addr(20),
      Q => start_addr_s(20)
    );
  handshake_go : FDC
    port map (
      C => user_clk,
      CLR => rst,
      D => handshake_go_mux0001,
      Q => handshake_go_551
    );
  size_s_0 : FDCE
    port map (
      C => user_clk,
      CE => handshake_go_mux0001,
      CLR => rst,
      D => size(0),
      Q => size_s(0)
    );
  size_s_1 : FDCE
    port map (
      C => user_clk,
      CE => handshake_go_mux0001,
      CLR => rst,
      D => size(1),
      Q => size_s(1)
    );
  size_s_2 : FDCE
    port map (
      C => user_clk,
      CE => handshake_go_mux0001,
      CLR => rst,
      D => size(2),
      Q => size_s(2)
    );
  size_s_3 : FDCE
    port map (
      C => user_clk,
      CE => handshake_go_mux0001,
      CLR => rst,
      D => size(3),
      Q => size_s(3)
    );
  size_s_4 : FDCE
    port map (
      C => user_clk,
      CE => handshake_go_mux0001,
      CLR => rst,
      D => size(4),
      Q => size_s(4)
    );
  size_s_5 : FDCE
    port map (
      C => user_clk,
      CE => handshake_go_mux0001,
      CLR => rst,
      D => size(5),
      Q => size_s(5)
    );
  size_s_6 : FDCE
    port map (
      C => user_clk,
      CE => handshake_go_mux0001,
      CLR => rst,
      D => size(6),
      Q => size_s(6)
    );
  size_s_7 : FDCE
    port map (
      C => user_clk,
      CE => handshake_go_mux0001,
      CLR => rst,
      D => size(7),
      Q => size_s(7)
    );
  size_s_8 : FDCE
    port map (
      C => user_clk,
      CE => handshake_go_mux0001,
      CLR => rst,
      D => size(8),
      Q => size_s(8)
    );
  size_s_9 : FDCE
    port map (
      C => user_clk,
      CE => handshake_go_mux0001,
      CLR => rst,
      D => size(9),
      Q => size_s(9)
    );
  size_s_10 : FDCE
    port map (
      C => user_clk,
      CE => handshake_go_mux0001,
      CLR => rst,
      D => size(10),
      Q => size_s(10)
    );
  size_s_11 : FDCE
    port map (
      C => user_clk,
      CE => handshake_go_mux0001,
      CLR => rst,
      D => size(11),
      Q => size_s(11)
    );
  size_s_12 : FDCE
    port map (
      C => user_clk,
      CE => handshake_go_mux0001,
      CLR => rst,
      D => size(12),
      Q => size_s(12)
    );
  size_s_13 : FDCE
    port map (
      C => user_clk,
      CE => handshake_go_mux0001,
      CLR => rst,
      D => size(13),
      Q => size_s(13)
    );
  size_s_14 : FDCE
    port map (
      C => user_clk,
      CE => handshake_go_mux0001,
      CLR => rst,
      D => size(14),
      Q => size_s(14)
    );
  size_s_15 : FDCE
    port map (
      C => user_clk,
      CE => handshake_go_mux0001,
      CLR => rst,
      D => size(15),
      Q => size_s(15)
    );
  size_s_16 : FDCE
    port map (
      C => user_clk,
      CE => handshake_go_mux0001,
      CLR => rst,
      D => size(16),
      Q => size_s(16)
    );
  size_s_17 : FDCE
    port map (
      C => user_clk,
      CE => handshake_go_mux0001,
      CLR => rst,
      D => size(17),
      Q => size_s(17)
    );
  size_s_18 : FDCE
    port map (
      C => user_clk,
      CE => handshake_go_mux0001,
      CLR => rst,
      D => size(18),
      Q => size_s(18)
    );
  size_s_19 : FDCE
    port map (
      C => user_clk,
      CE => handshake_go_mux0001,
      CLR => rst,
      D => size(19),
      Q => size_s(19)
    );
  size_s_20 : FDCE
    port map (
      C => user_clk,
      CE => handshake_go_mux0001,
      CLR => rst,
      D => size(20),
      Q => size_s(20)
    );
  size_s_21 : FDCE
    port map (
      C => user_clk,
      CE => handshake_go_mux0001,
      CLR => rst,
      D => size(21),
      Q => size_s(21)
    );
  size_s_22 : FDCE
    port map (
      C => user_clk,
      CE => handshake_go_mux0001,
      CLR => rst,
      D => size(22),
      Q => size_s(22)
    );
  size_s_23 : FDCE
    port map (
      C => user_clk,
      CE => handshake_go_mux0001,
      CLR => rst,
      D => size(23),
      Q => size_s(23)
    );
  size_s_24 : FDCE
    port map (
      C => user_clk,
      CE => handshake_go_mux0001,
      CLR => rst,
      D => size(24),
      Q => size_s(24)
    );
  size_s_25 : FDCE
    port map (
      C => user_clk,
      CE => handshake_go_mux0001,
      CLR => rst,
      D => size(25),
      Q => size_s(25)
    );
  size_s_26 : FDCE
    port map (
      C => user_clk,
      CE => handshake_go_mux0001,
      CLR => rst,
      D => size(26),
      Q => size_s(26)
    );
  size_s_27 : FDCE
    port map (
      C => user_clk,
      CE => handshake_go_mux0001,
      CLR => rst,
      D => size(27),
      Q => size_s(27)
    );
  size_s_28 : FDCE
    port map (
      C => user_clk,
      CE => handshake_go_mux0001,
      CLR => rst,
      D => size(28),
      Q => size_s(28)
    );
  size_s_29 : FDCE
    port map (
      C => user_clk,
      CE => handshake_go_mux0001,
      CLR => rst,
      D => size(29),
      Q => size_s(29)
    );
  size_s_30 : FDCE
    port map (
      C => user_clk,
      CE => handshake_go_mux0001,
      CLR => rst,
      D => size(30),
      Q => size_s(30)
    );
  size_s_31 : FDCE
    port map (
      C => user_clk,
      CE => handshake_go_mux0001,
      CLR => rst,
      D => size(31),
      Q => size_s(31)
    );
  busy : FDP
    port map (
      C => user_clk,
      D => busy_mux0001,
      PRE => rst,
      Q => busy_524
    );
  actually_empty : FDC
    port map (
      C => user_clk,
      CLR => rst,
      D => actually_empty_cmp_eq0000,
      Q => actually_empty_521
    );
  state_FSM_FFd1 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => user_clk,
      CLR => rst,
      D => state_FSM_FFd1_In_759,
      Q => state_FSM_FFd1_758
    );
  state_FSM_FFd2 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => user_clk,
      CLR => rst,
      D => state_FSM_FFd2_In,
      Q => state_FSM_FFd2_760
    );
  U_HANDSHAKE_U_TAKE_IT_SYNC_cdc_0 : FDCE
    port map (
      C => user_clk,
      CE => N1,
      CLR => rst_s,
      D => U_HANDSHAKE_take_it_tg_378,
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
      CE => N1,
      CLR => rst_s,
      D => U_HANDSHAKE_got_it_tg_372,
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
      Q => U_HANDSHAKE_got_it_tg_ff_373
    );
  U_HANDSHAKE_take_it_tg_ff : FDC
    port map (
      C => sram_clk,
      CLR => rst_s,
      D => U_HANDSHAKE_U_TAKE_IT_SYNC_output(0),
      Q => U_HANDSHAKE_take_it_tg_ff_379
    );
  U_HANDSHAKE_got_it_tg : FDCE
    port map (
      C => sram_clk,
      CE => handshake_rcv,
      CLR => rst_s,
      D => U_HANDSHAKE_got_it_tg_not0001,
      Q => U_HANDSHAKE_got_it_tg_372
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
      Q => U_HANDSHAKE_take_it_tg_378
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
  empty_count_0 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => user_clk,
      CE => empty_count_not0001,
      CLR => rst,
      D => Mcount_empty_count,
      Q => empty_count(0)
    );
  empty_count_1 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => user_clk,
      CE => empty_count_not0001,
      CLR => rst,
      D => Mcount_empty_count3,
      Q => empty_count(1)
    );
  empty_count_2 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => user_clk,
      CE => empty_count_not0001,
      CLR => rst,
      D => Mcount_empty_count6,
      Q => empty_count(2)
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
      CI => N1,
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
      I0 => size_s(24),
      I1 => U_DONE_COUNT_count(24),
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
  U_AG_SO_Madd_next_addr_current_addsub0000_xor_20_Q : XORCY
    port map (
      CI => U_AG_SO_Madd_next_addr_current_addsub0000_cy(19),
      LI => U_AG_SO_Madd_next_addr_current_addsub0000_xor_20_rt_64,
      O => U_AG_SO_next_addr_current_addsub0000(20)
    );
  U_AG_SO_Madd_next_addr_current_addsub0000_xor_19_Q : XORCY
    port map (
      CI => U_AG_SO_Madd_next_addr_current_addsub0000_cy(18),
      LI => U_AG_SO_Madd_next_addr_current_addsub0000_cy_19_rt_45,
      O => U_AG_SO_next_addr_current_addsub0000(19)
    );
  U_AG_SO_Madd_next_addr_current_addsub0000_cy_19_Q : MUXCY
    port map (
      CI => U_AG_SO_Madd_next_addr_current_addsub0000_cy(18),
      DI => NlwRenamedSig_OI_sram_bw_n(0),
      S => U_AG_SO_Madd_next_addr_current_addsub0000_cy_19_rt_45,
      O => U_AG_SO_Madd_next_addr_current_addsub0000_cy(19)
    );
  U_AG_SO_Madd_next_addr_current_addsub0000_xor_18_Q : XORCY
    port map (
      CI => U_AG_SO_Madd_next_addr_current_addsub0000_cy(17),
      LI => U_AG_SO_Madd_next_addr_current_addsub0000_cy_18_rt_43,
      O => U_AG_SO_next_addr_current_addsub0000(18)
    );
  U_AG_SO_Madd_next_addr_current_addsub0000_cy_18_Q : MUXCY
    port map (
      CI => U_AG_SO_Madd_next_addr_current_addsub0000_cy(17),
      DI => NlwRenamedSig_OI_sram_bw_n(0),
      S => U_AG_SO_Madd_next_addr_current_addsub0000_cy_18_rt_43,
      O => U_AG_SO_Madd_next_addr_current_addsub0000_cy(18)
    );
  U_AG_SO_Madd_next_addr_current_addsub0000_xor_17_Q : XORCY
    port map (
      CI => U_AG_SO_Madd_next_addr_current_addsub0000_cy(16),
      LI => U_AG_SO_Madd_next_addr_current_addsub0000_cy_17_rt_41,
      O => U_AG_SO_next_addr_current_addsub0000(17)
    );
  U_AG_SO_Madd_next_addr_current_addsub0000_cy_17_Q : MUXCY
    port map (
      CI => U_AG_SO_Madd_next_addr_current_addsub0000_cy(16),
      DI => NlwRenamedSig_OI_sram_bw_n(0),
      S => U_AG_SO_Madd_next_addr_current_addsub0000_cy_17_rt_41,
      O => U_AG_SO_Madd_next_addr_current_addsub0000_cy(17)
    );
  U_AG_SO_Madd_next_addr_current_addsub0000_xor_16_Q : XORCY
    port map (
      CI => U_AG_SO_Madd_next_addr_current_addsub0000_cy(15),
      LI => U_AG_SO_Madd_next_addr_current_addsub0000_cy_16_rt_39,
      O => U_AG_SO_next_addr_current_addsub0000(16)
    );
  U_AG_SO_Madd_next_addr_current_addsub0000_cy_16_Q : MUXCY
    port map (
      CI => U_AG_SO_Madd_next_addr_current_addsub0000_cy(15),
      DI => NlwRenamedSig_OI_sram_bw_n(0),
      S => U_AG_SO_Madd_next_addr_current_addsub0000_cy_16_rt_39,
      O => U_AG_SO_Madd_next_addr_current_addsub0000_cy(16)
    );
  U_AG_SO_Madd_next_addr_current_addsub0000_xor_15_Q : XORCY
    port map (
      CI => U_AG_SO_Madd_next_addr_current_addsub0000_cy(14),
      LI => U_AG_SO_Madd_next_addr_current_addsub0000_cy_15_rt_37,
      O => U_AG_SO_next_addr_current_addsub0000(15)
    );
  U_AG_SO_Madd_next_addr_current_addsub0000_cy_15_Q : MUXCY
    port map (
      CI => U_AG_SO_Madd_next_addr_current_addsub0000_cy(14),
      DI => NlwRenamedSig_OI_sram_bw_n(0),
      S => U_AG_SO_Madd_next_addr_current_addsub0000_cy_15_rt_37,
      O => U_AG_SO_Madd_next_addr_current_addsub0000_cy(15)
    );
  U_AG_SO_Madd_next_addr_current_addsub0000_xor_14_Q : XORCY
    port map (
      CI => U_AG_SO_Madd_next_addr_current_addsub0000_cy(13),
      LI => U_AG_SO_Madd_next_addr_current_addsub0000_cy_14_rt_35,
      O => U_AG_SO_next_addr_current_addsub0000(14)
    );
  U_AG_SO_Madd_next_addr_current_addsub0000_cy_14_Q : MUXCY
    port map (
      CI => U_AG_SO_Madd_next_addr_current_addsub0000_cy(13),
      DI => NlwRenamedSig_OI_sram_bw_n(0),
      S => U_AG_SO_Madd_next_addr_current_addsub0000_cy_14_rt_35,
      O => U_AG_SO_Madd_next_addr_current_addsub0000_cy(14)
    );
  U_AG_SO_Madd_next_addr_current_addsub0000_xor_13_Q : XORCY
    port map (
      CI => U_AG_SO_Madd_next_addr_current_addsub0000_cy(12),
      LI => U_AG_SO_Madd_next_addr_current_addsub0000_cy_13_rt_33,
      O => U_AG_SO_next_addr_current_addsub0000(13)
    );
  U_AG_SO_Madd_next_addr_current_addsub0000_cy_13_Q : MUXCY
    port map (
      CI => U_AG_SO_Madd_next_addr_current_addsub0000_cy(12),
      DI => NlwRenamedSig_OI_sram_bw_n(0),
      S => U_AG_SO_Madd_next_addr_current_addsub0000_cy_13_rt_33,
      O => U_AG_SO_Madd_next_addr_current_addsub0000_cy(13)
    );
  U_AG_SO_Madd_next_addr_current_addsub0000_xor_12_Q : XORCY
    port map (
      CI => U_AG_SO_Madd_next_addr_current_addsub0000_cy(11),
      LI => U_AG_SO_Madd_next_addr_current_addsub0000_cy_12_rt_31,
      O => U_AG_SO_next_addr_current_addsub0000(12)
    );
  U_AG_SO_Madd_next_addr_current_addsub0000_cy_12_Q : MUXCY
    port map (
      CI => U_AG_SO_Madd_next_addr_current_addsub0000_cy(11),
      DI => NlwRenamedSig_OI_sram_bw_n(0),
      S => U_AG_SO_Madd_next_addr_current_addsub0000_cy_12_rt_31,
      O => U_AG_SO_Madd_next_addr_current_addsub0000_cy(12)
    );
  U_AG_SO_Madd_next_addr_current_addsub0000_xor_11_Q : XORCY
    port map (
      CI => U_AG_SO_Madd_next_addr_current_addsub0000_cy(10),
      LI => U_AG_SO_Madd_next_addr_current_addsub0000_cy_11_rt_29,
      O => U_AG_SO_next_addr_current_addsub0000(11)
    );
  U_AG_SO_Madd_next_addr_current_addsub0000_cy_11_Q : MUXCY
    port map (
      CI => U_AG_SO_Madd_next_addr_current_addsub0000_cy(10),
      DI => NlwRenamedSig_OI_sram_bw_n(0),
      S => U_AG_SO_Madd_next_addr_current_addsub0000_cy_11_rt_29,
      O => U_AG_SO_Madd_next_addr_current_addsub0000_cy(11)
    );
  U_AG_SO_Madd_next_addr_current_addsub0000_xor_10_Q : XORCY
    port map (
      CI => U_AG_SO_Madd_next_addr_current_addsub0000_cy(9),
      LI => U_AG_SO_Madd_next_addr_current_addsub0000_cy_10_rt_27,
      O => U_AG_SO_next_addr_current_addsub0000(10)
    );
  U_AG_SO_Madd_next_addr_current_addsub0000_cy_10_Q : MUXCY
    port map (
      CI => U_AG_SO_Madd_next_addr_current_addsub0000_cy(9),
      DI => NlwRenamedSig_OI_sram_bw_n(0),
      S => U_AG_SO_Madd_next_addr_current_addsub0000_cy_10_rt_27,
      O => U_AG_SO_Madd_next_addr_current_addsub0000_cy(10)
    );
  U_AG_SO_Madd_next_addr_current_addsub0000_xor_9_Q : XORCY
    port map (
      CI => U_AG_SO_Madd_next_addr_current_addsub0000_cy(8),
      LI => U_AG_SO_Madd_next_addr_current_addsub0000_cy_9_rt_62,
      O => U_AG_SO_next_addr_current_addsub0000(9)
    );
  U_AG_SO_Madd_next_addr_current_addsub0000_cy_9_Q : MUXCY
    port map (
      CI => U_AG_SO_Madd_next_addr_current_addsub0000_cy(8),
      DI => NlwRenamedSig_OI_sram_bw_n(0),
      S => U_AG_SO_Madd_next_addr_current_addsub0000_cy_9_rt_62,
      O => U_AG_SO_Madd_next_addr_current_addsub0000_cy(9)
    );
  U_AG_SO_Madd_next_addr_current_addsub0000_xor_8_Q : XORCY
    port map (
      CI => U_AG_SO_Madd_next_addr_current_addsub0000_cy(7),
      LI => U_AG_SO_Madd_next_addr_current_addsub0000_cy_8_rt_60,
      O => U_AG_SO_next_addr_current_addsub0000(8)
    );
  U_AG_SO_Madd_next_addr_current_addsub0000_cy_8_Q : MUXCY
    port map (
      CI => U_AG_SO_Madd_next_addr_current_addsub0000_cy(7),
      DI => NlwRenamedSig_OI_sram_bw_n(0),
      S => U_AG_SO_Madd_next_addr_current_addsub0000_cy_8_rt_60,
      O => U_AG_SO_Madd_next_addr_current_addsub0000_cy(8)
    );
  U_AG_SO_Madd_next_addr_current_addsub0000_xor_7_Q : XORCY
    port map (
      CI => U_AG_SO_Madd_next_addr_current_addsub0000_cy(6),
      LI => U_AG_SO_Madd_next_addr_current_addsub0000_cy_7_rt_58,
      O => U_AG_SO_next_addr_current_addsub0000(7)
    );
  U_AG_SO_Madd_next_addr_current_addsub0000_cy_7_Q : MUXCY
    port map (
      CI => U_AG_SO_Madd_next_addr_current_addsub0000_cy(6),
      DI => NlwRenamedSig_OI_sram_bw_n(0),
      S => U_AG_SO_Madd_next_addr_current_addsub0000_cy_7_rt_58,
      O => U_AG_SO_Madd_next_addr_current_addsub0000_cy(7)
    );
  U_AG_SO_Madd_next_addr_current_addsub0000_xor_6_Q : XORCY
    port map (
      CI => U_AG_SO_Madd_next_addr_current_addsub0000_cy(5),
      LI => U_AG_SO_Madd_next_addr_current_addsub0000_cy_6_rt_56,
      O => U_AG_SO_next_addr_current_addsub0000(6)
    );
  U_AG_SO_Madd_next_addr_current_addsub0000_cy_6_Q : MUXCY
    port map (
      CI => U_AG_SO_Madd_next_addr_current_addsub0000_cy(5),
      DI => NlwRenamedSig_OI_sram_bw_n(0),
      S => U_AG_SO_Madd_next_addr_current_addsub0000_cy_6_rt_56,
      O => U_AG_SO_Madd_next_addr_current_addsub0000_cy(6)
    );
  U_AG_SO_Madd_next_addr_current_addsub0000_xor_5_Q : XORCY
    port map (
      CI => U_AG_SO_Madd_next_addr_current_addsub0000_cy(4),
      LI => U_AG_SO_Madd_next_addr_current_addsub0000_cy_5_rt_54,
      O => U_AG_SO_next_addr_current_addsub0000(5)
    );
  U_AG_SO_Madd_next_addr_current_addsub0000_cy_5_Q : MUXCY
    port map (
      CI => U_AG_SO_Madd_next_addr_current_addsub0000_cy(4),
      DI => NlwRenamedSig_OI_sram_bw_n(0),
      S => U_AG_SO_Madd_next_addr_current_addsub0000_cy_5_rt_54,
      O => U_AG_SO_Madd_next_addr_current_addsub0000_cy(5)
    );
  U_AG_SO_Madd_next_addr_current_addsub0000_xor_4_Q : XORCY
    port map (
      CI => U_AG_SO_Madd_next_addr_current_addsub0000_cy(3),
      LI => U_AG_SO_Madd_next_addr_current_addsub0000_cy_4_rt_52,
      O => U_AG_SO_next_addr_current_addsub0000(4)
    );
  U_AG_SO_Madd_next_addr_current_addsub0000_cy_4_Q : MUXCY
    port map (
      CI => U_AG_SO_Madd_next_addr_current_addsub0000_cy(3),
      DI => NlwRenamedSig_OI_sram_bw_n(0),
      S => U_AG_SO_Madd_next_addr_current_addsub0000_cy_4_rt_52,
      O => U_AG_SO_Madd_next_addr_current_addsub0000_cy(4)
    );
  U_AG_SO_Madd_next_addr_current_addsub0000_xor_3_Q : XORCY
    port map (
      CI => U_AG_SO_Madd_next_addr_current_addsub0000_cy(2),
      LI => U_AG_SO_Madd_next_addr_current_addsub0000_cy_3_rt_50,
      O => U_AG_SO_next_addr_current_addsub0000(3)
    );
  U_AG_SO_Madd_next_addr_current_addsub0000_cy_3_Q : MUXCY
    port map (
      CI => U_AG_SO_Madd_next_addr_current_addsub0000_cy(2),
      DI => NlwRenamedSig_OI_sram_bw_n(0),
      S => U_AG_SO_Madd_next_addr_current_addsub0000_cy_3_rt_50,
      O => U_AG_SO_Madd_next_addr_current_addsub0000_cy(3)
    );
  U_AG_SO_Madd_next_addr_current_addsub0000_xor_2_Q : XORCY
    port map (
      CI => U_AG_SO_Madd_next_addr_current_addsub0000_cy(1),
      LI => U_AG_SO_Madd_next_addr_current_addsub0000_cy_2_rt_48,
      O => U_AG_SO_next_addr_current_addsub0000(2)
    );
  U_AG_SO_Madd_next_addr_current_addsub0000_cy_2_Q : MUXCY
    port map (
      CI => U_AG_SO_Madd_next_addr_current_addsub0000_cy(1),
      DI => NlwRenamedSig_OI_sram_bw_n(0),
      S => U_AG_SO_Madd_next_addr_current_addsub0000_cy_2_rt_48,
      O => U_AG_SO_Madd_next_addr_current_addsub0000_cy(2)
    );
  U_AG_SO_Madd_next_addr_current_addsub0000_xor_1_Q : XORCY
    port map (
      CI => NlwRenamedSig_OI_sram_bw_n(0),
      LI => U_AG_SO_Madd_next_addr_current_addsub0000_lut(1),
      O => U_AG_SO_next_addr_current_addsub0000(1)
    );
  U_AG_SO_Madd_next_addr_current_addsub0000_cy_1_Q : MUXCY
    port map (
      CI => NlwRenamedSig_OI_sram_bw_n(0),
      DI => N1,
      S => U_AG_SO_Madd_next_addr_current_addsub0000_lut(1),
      O => U_AG_SO_Madd_next_addr_current_addsub0000_cy(1)
    );
  U_AG_SO_addr_current_20 : FDC
    port map (
      C => sram_clk,
      CLR => rst_s,
      D => U_AG_SO_next_addr_current(20),
      Q => U_AG_SO_addr_current(20)
    );
  U_AG_SO_addr_current_19 : FDC
    port map (
      C => sram_clk,
      CLR => rst_s,
      D => U_AG_SO_next_addr_current(19),
      Q => U_AG_SO_addr_current(19)
    );
  U_AG_SO_addr_current_18 : FDC
    port map (
      C => sram_clk,
      CLR => rst_s,
      D => U_AG_SO_next_addr_current(18),
      Q => U_AG_SO_addr_current(18)
    );
  U_AG_SO_addr_current_17 : FDC
    port map (
      C => sram_clk,
      CLR => rst_s,
      D => U_AG_SO_next_addr_current(17),
      Q => U_AG_SO_addr_current(17)
    );
  U_AG_SO_addr_current_16 : FDC
    port map (
      C => sram_clk,
      CLR => rst_s,
      D => U_AG_SO_next_addr_current(16),
      Q => U_AG_SO_addr_current(16)
    );
  U_AG_SO_addr_current_15 : FDC
    port map (
      C => sram_clk,
      CLR => rst_s,
      D => U_AG_SO_next_addr_current(15),
      Q => U_AG_SO_addr_current(15)
    );
  U_AG_SO_addr_current_14 : FDC
    port map (
      C => sram_clk,
      CLR => rst_s,
      D => U_AG_SO_next_addr_current(14),
      Q => U_AG_SO_addr_current(14)
    );
  U_AG_SO_addr_current_13 : FDC
    port map (
      C => sram_clk,
      CLR => rst_s,
      D => U_AG_SO_next_addr_current(13),
      Q => U_AG_SO_addr_current(13)
    );
  U_AG_SO_addr_current_12 : FDC
    port map (
      C => sram_clk,
      CLR => rst_s,
      D => U_AG_SO_next_addr_current(12),
      Q => U_AG_SO_addr_current(12)
    );
  U_AG_SO_addr_current_11 : FDC
    port map (
      C => sram_clk,
      CLR => rst_s,
      D => U_AG_SO_next_addr_current(11),
      Q => U_AG_SO_addr_current(11)
    );
  U_AG_SO_addr_current_10 : FDC
    port map (
      C => sram_clk,
      CLR => rst_s,
      D => U_AG_SO_next_addr_current(10),
      Q => U_AG_SO_addr_current(10)
    );
  U_AG_SO_addr_current_9 : FDC
    port map (
      C => sram_clk,
      CLR => rst_s,
      D => U_AG_SO_next_addr_current(9),
      Q => U_AG_SO_addr_current(9)
    );
  U_AG_SO_addr_current_8 : FDC
    port map (
      C => sram_clk,
      CLR => rst_s,
      D => U_AG_SO_next_addr_current(8),
      Q => U_AG_SO_addr_current(8)
    );
  U_AG_SO_addr_current_7 : FDC
    port map (
      C => sram_clk,
      CLR => rst_s,
      D => U_AG_SO_next_addr_current(7),
      Q => U_AG_SO_addr_current(7)
    );
  U_AG_SO_addr_current_6 : FDC
    port map (
      C => sram_clk,
      CLR => rst_s,
      D => U_AG_SO_next_addr_current(6),
      Q => U_AG_SO_addr_current(6)
    );
  U_AG_SO_addr_current_5 : FDC
    port map (
      C => sram_clk,
      CLR => rst_s,
      D => U_AG_SO_next_addr_current(5),
      Q => U_AG_SO_addr_current(5)
    );
  U_AG_SO_addr_current_4 : FDC
    port map (
      C => sram_clk,
      CLR => rst_s,
      D => U_AG_SO_next_addr_current(4),
      Q => U_AG_SO_addr_current(4)
    );
  U_AG_SO_addr_current_3 : FDC
    port map (
      C => sram_clk,
      CLR => rst_s,
      D => U_AG_SO_next_addr_current(3),
      Q => U_AG_SO_addr_current(3)
    );
  U_AG_SO_addr_current_2 : FDC
    port map (
      C => sram_clk,
      CLR => rst_s,
      D => U_AG_SO_next_addr_current(2),
      Q => U_AG_SO_addr_current(2)
    );
  U_AG_SO_addr_current_1 : FDC
    port map (
      C => sram_clk,
      CLR => rst_s,
      D => U_AG_SO_next_addr_current(1),
      Q => U_AG_SO_addr_current(1)
    );
  U_AG_SO_addr_current_0 : FDC
    port map (
      C => sram_clk,
      CLR => rst_s,
      D => U_AG_SO_next_addr_current(0),
      Q => U_AG_SO_addr_current(0)
    );
  U_AG_SO_state_0 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => sram_clk,
      CLR => rst_s,
      D => U_AG_SO_next_state,
      Q => U_AG_SO_state(0)
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
  U_AG_SO_addr_out_9_1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => U_AG_SO_state(0),
      I1 => U_AG_SO_addr_current(9),
      O => sram_addr(9)
    );
  U_AG_SO_addr_out_8_1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => U_AG_SO_state(0),
      I1 => U_AG_SO_addr_current(8),
      O => sram_addr(8)
    );
  U_AG_SO_addr_out_7_1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => U_AG_SO_state(0),
      I1 => U_AG_SO_addr_current(7),
      O => sram_addr(7)
    );
  U_AG_SO_addr_out_6_1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => U_AG_SO_state(0),
      I1 => U_AG_SO_addr_current(6),
      O => sram_addr(6)
    );
  U_AG_SO_addr_out_5_1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => U_AG_SO_state(0),
      I1 => U_AG_SO_addr_current(5),
      O => sram_addr(5)
    );
  U_AG_SO_addr_out_4_1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => U_AG_SO_state(0),
      I1 => U_AG_SO_addr_current(4),
      O => sram_addr(4)
    );
  U_AG_SO_addr_out_3_1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => U_AG_SO_state(0),
      I1 => U_AG_SO_addr_current(3),
      O => sram_addr(3)
    );
  U_AG_SO_addr_out_2_1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => U_AG_SO_state(0),
      I1 => U_AG_SO_addr_current(2),
      O => sram_addr(2)
    );
  U_AG_SO_addr_out_20_1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => U_AG_SO_state(0),
      I1 => U_AG_SO_addr_current(20),
      O => sram_addr(20)
    );
  U_AG_SO_addr_out_1_1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => U_AG_SO_state(0),
      I1 => U_AG_SO_addr_current(1),
      O => sram_addr(1)
    );
  U_AG_SO_addr_out_19_1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => U_AG_SO_state(0),
      I1 => U_AG_SO_addr_current(19),
      O => sram_addr(19)
    );
  U_AG_SO_addr_out_18_1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => U_AG_SO_state(0),
      I1 => U_AG_SO_addr_current(18),
      O => sram_addr(18)
    );
  U_AG_SO_addr_out_17_1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => U_AG_SO_state(0),
      I1 => U_AG_SO_addr_current(17),
      O => sram_addr(17)
    );
  U_AG_SO_addr_out_16_1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => U_AG_SO_state(0),
      I1 => U_AG_SO_addr_current(16),
      O => sram_addr(16)
    );
  U_AG_SO_addr_out_15_1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => U_AG_SO_state(0),
      I1 => U_AG_SO_addr_current(15),
      O => sram_addr(15)
    );
  U_AG_SO_addr_out_14_1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => U_AG_SO_state(0),
      I1 => U_AG_SO_addr_current(14),
      O => sram_addr(14)
    );
  U_AG_SO_addr_out_13_1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => U_AG_SO_state(0),
      I1 => U_AG_SO_addr_current(13),
      O => sram_addr(13)
    );
  U_AG_SO_addr_out_12_1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => U_AG_SO_state(0),
      I1 => U_AG_SO_addr_current(12),
      O => sram_addr(12)
    );
  U_AG_SO_addr_out_11_1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => U_AG_SO_state(0),
      I1 => U_AG_SO_addr_current(11),
      O => sram_addr(11)
    );
  U_AG_SO_addr_out_10_1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => U_AG_SO_state(0),
      I1 => U_AG_SO_addr_current(10),
      O => sram_addr(10)
    );
  U_AG_SO_addr_out_0_1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => U_AG_SO_state(0),
      I1 => U_AG_SO_addr_current(0),
      O => sram_addr(0)
    );
  actually_empty_cmp_eq00001 : LUT3
    generic map(
      INIT => X"02"
    )
    port map (
      I0 => empty_count(2),
      I1 => empty_count(1),
      I2 => empty_count(0),
      O => actually_empty_cmp_eq0000
    );
  U_AG_SO_next_addr_current_0_1 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U_AG_SO_state(0),
      I1 => start_addr_s(0),
      I2 => U_AG_SO_addr_current(0),
      O => U_AG_SO_next_addr_current(0)
    );
  U_HANDSHAKE_next_state_0_mux00001 : LUT4
    generic map(
      INIT => X"FF82"
    )
    port map (
      I0 => U_HANDSHAKE_state(0),
      I1 => U_HANDSHAKE_got_it_tg_ff_373,
      I2 => U_HANDSHAKE_U_GOT_IT_SYNC_output(0),
      I3 => handshake_go_551,
      O => U_HANDSHAKE_next_state
    );
  U_HANDSHAKE_start_pl1 : LUT4
    generic map(
      INIT => X"28AA"
    )
    port map (
      I0 => handshake_go_551,
      I1 => U_HANDSHAKE_got_it_tg_ff_373,
      I2 => U_HANDSHAKE_U_GOT_IT_SYNC_output(0),
      I3 => U_HANDSHAKE_state(0),
      O => U_HANDSHAKE_start_pl
    );
  state_FSM_FFd2_In1 : LUT4
    generic map(
      INIT => X"FF82"
    )
    port map (
      I0 => state_FSM_FFd2_760,
      I1 => U_HANDSHAKE_got_it_tg_ff_373,
      I2 => U_HANDSHAKE_U_GOT_IT_SYNC_output(0),
      I3 => handshake_go_mux0001,
      O => state_FSM_FFd2_In
    );
  busy_mux000111 : LUT3
    generic map(
      INIT => X"02"
    )
    port map (
      I0 => go,
      I1 => state_FSM_FFd1_758,
      I2 => state_FSM_FFd2_760,
      O => handshake_go_mux0001
    );
  Mcount_empty_count_xor_1_11 : LUT3
    generic map(
      INIT => X"28"
    )
    port map (
      I0 => width_fifo_empty_internal,
      I1 => empty_count(0),
      I2 => empty_count(1),
      O => Mcount_empty_count3
    );
  Mcount_empty_count_xor_2_11 : LUT4
    generic map(
      INIT => X"2888"
    )
    port map (
      I0 => width_fifo_empty_internal,
      I1 => empty_count(2),
      I2 => empty_count(0),
      I3 => empty_count(1),
      O => Mcount_empty_count6
    );
  U_HANDSHAKE_Mxor_take_it_pl_Result1 : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => U_HANDSHAKE_U_TAKE_IT_SYNC_output(0),
      I1 => U_HANDSHAKE_take_it_tg_ff_379,
      O => handshake_rcv
    );
  ag_stall1 : LUT3
    generic map(
      INIT => X"EF"
    )
    port map (
      I0 => mem_fifo_empty,
      I1 => sram_fifo_full,
      I2 => sram_calibrated,
      O => ag_stall
    );
  mem_fifo_rd1 : LUT3
    generic map(
      INIT => X"02"
    )
    port map (
      I0 => sram_calibrated,
      I1 => mem_fifo_empty,
      I2 => sram_fifo_full,
      O => mem_fifo_rd
    );
  empty_count_not00011 : LUT4
    generic map(
      INIT => X"FFBF"
    )
    port map (
      I0 => empty_count(0),
      I1 => empty_count(2),
      I2 => N75,
      I3 => empty_count(1),
      O => empty_count_not0001
    );
  done1 : LUT4
    generic map(
      INIT => X"0008"
    )
    port map (
      I0 => done_s,
      I1 => actually_empty_521,
      I2 => busy_524,
      I3 => go,
      O => done
    );
  state_FSM_FFd1_In_SW0 : LUT3
    generic map(
      INIT => X"28"
    )
    port map (
      I0 => state_FSM_FFd2_760,
      I1 => U_HANDSHAKE_U_GOT_IT_SYNC_output(0),
      I2 => U_HANDSHAKE_got_it_tg_ff_373,
      O => N2
    );
  state_FSM_FFd1_In : LUT4
    generic map(
      INIT => X"F2FA"
    )
    port map (
      I0 => state_FSM_FFd1_758,
      I1 => actually_empty_521,
      I2 => N2,
      I3 => done_s,
      O => state_FSM_FFd1_In_759
    );
  mem_fifo_wr1 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count(2),
      I1 => mem_fifo_full,
      O => mem_fifo_wr
    );
  U_DONE_COUNT_count_not00011 : LUT4
    generic map(
      INIT => X"CCCE"
    )
    port map (
      I0 => wr_en,
      I1 => clear,
      I2 => width_fifo_full,
      I3 => done_s,
      O => U_DONE_COUNT_count_not0001
    );
  U_AG_SO_Madd_next_addr_current_addsub0000_cy_19_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U_AG_SO_addr_current(19),
      O => U_AG_SO_Madd_next_addr_current_addsub0000_cy_19_rt_45
    );
  U_AG_SO_Madd_next_addr_current_addsub0000_cy_18_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U_AG_SO_addr_current(18),
      O => U_AG_SO_Madd_next_addr_current_addsub0000_cy_18_rt_43
    );
  U_AG_SO_Madd_next_addr_current_addsub0000_cy_17_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U_AG_SO_addr_current(17),
      O => U_AG_SO_Madd_next_addr_current_addsub0000_cy_17_rt_41
    );
  U_AG_SO_Madd_next_addr_current_addsub0000_cy_16_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U_AG_SO_addr_current(16),
      O => U_AG_SO_Madd_next_addr_current_addsub0000_cy_16_rt_39
    );
  U_AG_SO_Madd_next_addr_current_addsub0000_cy_15_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U_AG_SO_addr_current(15),
      O => U_AG_SO_Madd_next_addr_current_addsub0000_cy_15_rt_37
    );
  U_AG_SO_Madd_next_addr_current_addsub0000_cy_14_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U_AG_SO_addr_current(14),
      O => U_AG_SO_Madd_next_addr_current_addsub0000_cy_14_rt_35
    );
  U_AG_SO_Madd_next_addr_current_addsub0000_cy_13_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U_AG_SO_addr_current(13),
      O => U_AG_SO_Madd_next_addr_current_addsub0000_cy_13_rt_33
    );
  U_AG_SO_Madd_next_addr_current_addsub0000_cy_12_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U_AG_SO_addr_current(12),
      O => U_AG_SO_Madd_next_addr_current_addsub0000_cy_12_rt_31
    );
  U_AG_SO_Madd_next_addr_current_addsub0000_cy_11_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U_AG_SO_addr_current(11),
      O => U_AG_SO_Madd_next_addr_current_addsub0000_cy_11_rt_29
    );
  U_AG_SO_Madd_next_addr_current_addsub0000_cy_10_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U_AG_SO_addr_current(10),
      O => U_AG_SO_Madd_next_addr_current_addsub0000_cy_10_rt_27
    );
  U_AG_SO_Madd_next_addr_current_addsub0000_cy_9_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U_AG_SO_addr_current(9),
      O => U_AG_SO_Madd_next_addr_current_addsub0000_cy_9_rt_62
    );
  U_AG_SO_Madd_next_addr_current_addsub0000_cy_8_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U_AG_SO_addr_current(8),
      O => U_AG_SO_Madd_next_addr_current_addsub0000_cy_8_rt_60
    );
  U_AG_SO_Madd_next_addr_current_addsub0000_cy_7_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U_AG_SO_addr_current(7),
      O => U_AG_SO_Madd_next_addr_current_addsub0000_cy_7_rt_58
    );
  U_AG_SO_Madd_next_addr_current_addsub0000_cy_6_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U_AG_SO_addr_current(6),
      O => U_AG_SO_Madd_next_addr_current_addsub0000_cy_6_rt_56
    );
  U_AG_SO_Madd_next_addr_current_addsub0000_cy_5_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U_AG_SO_addr_current(5),
      O => U_AG_SO_Madd_next_addr_current_addsub0000_cy_5_rt_54
    );
  U_AG_SO_Madd_next_addr_current_addsub0000_cy_4_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U_AG_SO_addr_current(4),
      O => U_AG_SO_Madd_next_addr_current_addsub0000_cy_4_rt_52
    );
  U_AG_SO_Madd_next_addr_current_addsub0000_cy_3_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U_AG_SO_addr_current(3),
      O => U_AG_SO_Madd_next_addr_current_addsub0000_cy_3_rt_50
    );
  U_AG_SO_Madd_next_addr_current_addsub0000_cy_2_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U_AG_SO_addr_current(2),
      O => U_AG_SO_Madd_next_addr_current_addsub0000_cy_2_rt_48
    );
  U_AG_SO_Madd_next_addr_current_addsub0000_xor_20_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U_AG_SO_addr_current(20),
      O => U_AG_SO_Madd_next_addr_current_addsub0000_xor_20_rt_64
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_15_rstpot : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_15_470,
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_15_502,
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and000012,
      O => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_15_rstpot_503
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_15 : FDC
    port map (
      C => user_clk,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_15_rstpot_503,
      Q => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_15_502
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_14_rstpot : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_14_468,
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_14_500,
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and000012,
      O => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_14_rstpot_501
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_14 : FDC
    port map (
      C => user_clk,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_14_rstpot_501,
      Q => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_14_500
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_13_rstpot : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_13_466,
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_13_498,
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and000012,
      O => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_13_rstpot_499
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_13 : FDC
    port map (
      C => user_clk,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_13_rstpot_499,
      Q => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_13_498
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_12_rstpot : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_12_464,
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_12_496,
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and000012,
      O => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_12_rstpot_497
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_12 : FDC
    port map (
      C => user_clk,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_12_rstpot_497,
      Q => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_12_496
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_11_rstpot : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_11_462,
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_11_494,
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and000012,
      O => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_11_rstpot_495
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_11 : FDC
    port map (
      C => user_clk,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_11_rstpot_495,
      Q => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_11_494
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_10_rstpot : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_10_460,
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_10_492,
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and000012,
      O => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_10_rstpot_493
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_10 : FDC
    port map (
      C => user_clk,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_10_rstpot_493,
      Q => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_10_492
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_9_rstpot : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_9_487,
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_9_519,
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and000012,
      O => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_9_rstpot_520
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_9 : FDC
    port map (
      C => user_clk,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_9_rstpot_520,
      Q => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_9_519
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_8_rstpot : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_8_485,
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_8_517,
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and000012,
      O => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_8_rstpot_518
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_8 : FDC
    port map (
      C => user_clk,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_8_rstpot_518,
      Q => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_8_517
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_7_rstpot : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_7_483,
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_7_515,
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and000012,
      O => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_7_rstpot_516
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_7 : FDC
    port map (
      C => user_clk,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_7_rstpot_516,
      Q => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_7_515
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_6_rstpot : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_6_481,
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_6_513,
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and000012,
      O => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_6_rstpot_514
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_6 : FDC
    port map (
      C => user_clk,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_6_rstpot_514,
      Q => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_6_513
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_5_rstpot : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_5_479,
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_5_511,
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and000012,
      O => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_5_rstpot_512
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_5 : FDC
    port map (
      C => user_clk,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_5_rstpot_512,
      Q => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_5_511
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_4_rstpot : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_4_477,
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_4_509,
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and000012,
      O => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_4_rstpot_510
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_4 : FDC
    port map (
      C => user_clk,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_4_rstpot_510,
      Q => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_4_509
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_3_rstpot : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_3_475,
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_3_507,
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and000012,
      O => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_3_rstpot_508
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_3 : FDC
    port map (
      C => user_clk,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_3_rstpot_508,
      Q => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_3_507
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_2_rstpot : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_2_473,
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_2_505,
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and000012,
      O => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_2_rstpot_506
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_2 : FDC
    port map (
      C => user_clk,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_2_rstpot_506,
      Q => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_2_505
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_1_rstpot : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_1_459,
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_1_491,
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and000012,
      O => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_1_rstpot_504
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_1 : FDC
    port map (
      C => user_clk,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_1_rstpot_504,
      Q => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_1_491
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_0_rstpot : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_0_457,
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_0_489,
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and000012,
      O => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_0_rstpot_490
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_0 : FDC
    port map (
      C => user_clk,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_0_rstpot_490,
      Q => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_0_489
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_15_rstpot : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_15_438,
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_15_470,
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and000011,
      O => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_15_rstpot_471
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_15 : FDC
    port map (
      C => user_clk,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_15_rstpot_471,
      Q => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_15_470
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_14_rstpot : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_14_436,
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_14_468,
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and000011,
      O => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_14_rstpot_469
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_14 : FDC
    port map (
      C => user_clk,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_14_rstpot_469,
      Q => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_14_468
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_13_rstpot : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_13_434,
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_13_466,
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and000011,
      O => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_13_rstpot_467
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_13 : FDC
    port map (
      C => user_clk,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_13_rstpot_467,
      Q => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_13_466
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_12_rstpot : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_12_432,
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_12_464,
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and000011,
      O => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_12_rstpot_465
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_12 : FDC
    port map (
      C => user_clk,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_12_rstpot_465,
      Q => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_12_464
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_11_rstpot : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_11_430,
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_11_462,
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and000011,
      O => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_11_rstpot_463
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_11 : FDC
    port map (
      C => user_clk,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_11_rstpot_463,
      Q => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_11_462
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_10_rstpot : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_10_428,
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_10_460,
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and000011,
      O => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_10_rstpot_461
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_10 : FDC
    port map (
      C => user_clk,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_10_rstpot_461,
      Q => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_10_460
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_9_rstpot : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_9_455,
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_9_487,
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and000011,
      O => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_9_rstpot_488
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_9 : FDC
    port map (
      C => user_clk,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_9_rstpot_488,
      Q => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_9_487
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_8_rstpot : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_8_453,
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_8_485,
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and000011,
      O => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_8_rstpot_486
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_8 : FDC
    port map (
      C => user_clk,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_8_rstpot_486,
      Q => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_8_485
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_7_rstpot : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_7_451,
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_7_483,
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and000011,
      O => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_7_rstpot_484
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_7 : FDC
    port map (
      C => user_clk,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_7_rstpot_484,
      Q => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_7_483
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_6_rstpot : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_6_449,
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_6_481,
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and000011,
      O => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_6_rstpot_482
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_6 : FDC
    port map (
      C => user_clk,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_6_rstpot_482,
      Q => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_6_481
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_5_rstpot : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_5_447,
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_5_479,
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and000011,
      O => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_5_rstpot_480
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_5 : FDC
    port map (
      C => user_clk,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_5_rstpot_480,
      Q => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_5_479
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_4_rstpot : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_4_445,
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_4_477,
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and000011,
      O => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_4_rstpot_478
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_4 : FDC
    port map (
      C => user_clk,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_4_rstpot_478,
      Q => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_4_477
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_3_rstpot : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_3_443,
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_3_475,
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and000011,
      O => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_3_rstpot_476
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_3 : FDC
    port map (
      C => user_clk,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_3_rstpot_476,
      Q => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_3_475
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_2_rstpot : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_2_441,
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_2_473,
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and000011,
      O => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_2_rstpot_474
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_2 : FDC
    port map (
      C => user_clk,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_2_rstpot_474,
      Q => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_2_473
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_1_rstpot : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_1_427,
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_1_459,
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and000011,
      O => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_1_rstpot_472
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_1 : FDC
    port map (
      C => user_clk,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_1_rstpot_472,
      Q => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_1_459
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_0_rstpot : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_0_425,
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_0_457,
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and000011,
      O => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_0_rstpot_458
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_0 : FDC
    port map (
      C => user_clk,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_0_rstpot_458,
      Q => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_0_457
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_15_rstpot : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_15_402,
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_15_438,
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and00001_422,
      O => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_15_rstpot_439
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_15 : FDC
    port map (
      C => user_clk,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_15_rstpot_439,
      Q => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_15_438
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_14_rstpot : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_14_400,
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_14_436,
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and00001_422,
      O => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_14_rstpot_437
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_14 : FDC
    port map (
      C => user_clk,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_14_rstpot_437,
      Q => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_14_436
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_13_rstpot : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_13_398,
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_13_434,
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and00001_422,
      O => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_13_rstpot_435
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_13 : FDC
    port map (
      C => user_clk,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_13_rstpot_435,
      Q => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_13_434
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_12_rstpot : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_12_396,
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_12_432,
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and00001_422,
      O => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_12_rstpot_433
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_12 : FDC
    port map (
      C => user_clk,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_12_rstpot_433,
      Q => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_12_432
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_11_rstpot : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_11_394,
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_11_430,
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and00001_422,
      O => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_11_rstpot_431
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_11 : FDC
    port map (
      C => user_clk,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_11_rstpot_431,
      Q => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_11_430
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_10_rstpot : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_10_392,
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_10_428,
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and00001_422,
      O => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_10_rstpot_429
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_10 : FDC
    port map (
      C => user_clk,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_10_rstpot_429,
      Q => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_10_428
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_9_rstpot : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_9_419,
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_9_455,
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and00001_422,
      O => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_9_rstpot_456
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_9 : FDC
    port map (
      C => user_clk,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_9_rstpot_456,
      Q => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_9_455
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_8_rstpot : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_8_417,
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_8_453,
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and00001_422,
      O => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_8_rstpot_454
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_8 : FDC
    port map (
      C => user_clk,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_8_rstpot_454,
      Q => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_8_453
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_7_rstpot : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_7_415,
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_7_451,
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and00001_422,
      O => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_7_rstpot_452
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_7 : FDC
    port map (
      C => user_clk,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_7_rstpot_452,
      Q => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_7_451
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_6_rstpot : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_6_413,
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_6_449,
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and00001_422,
      O => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_6_rstpot_450
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_6 : FDC
    port map (
      C => user_clk,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_6_rstpot_450,
      Q => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_6_449
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_5_rstpot : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_5_411,
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_5_447,
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and00001_422,
      O => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_5_rstpot_448
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_5 : FDC
    port map (
      C => user_clk,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_5_rstpot_448,
      Q => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_5_447
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_4_rstpot : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_4_409,
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_4_445,
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and00001_422,
      O => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_4_rstpot_446
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_4 : FDC
    port map (
      C => user_clk,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_4_rstpot_446,
      Q => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_4_445
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_3_rstpot : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_3_407,
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_3_443,
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and00001_422,
      O => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_3_rstpot_444
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_3 : FDC
    port map (
      C => user_clk,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_3_rstpot_444,
      Q => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_3_443
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_2_rstpot : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_2_405,
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_2_441,
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and00001_422,
      O => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_2_rstpot_442
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_2 : FDC
    port map (
      C => user_clk,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_2_rstpot_442,
      Q => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_2_441
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_1_rstpot : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_1_391,
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_1_427,
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and00001_422,
      O => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_1_rstpot_440
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_1 : FDC
    port map (
      C => user_clk,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_1_rstpot_440,
      Q => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_1_427
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_0_rstpot : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_0_389,
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_0_425,
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and00001_422,
      O => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_0_rstpot_426
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_0 : FDC
    port map (
      C => user_clk,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_0_rstpot_426,
      Q => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_0_425
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_15_rstpot : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => data(15),
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_15_402,
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and0000,
      O => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_15_rstpot_403
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_15 : FDC
    port map (
      C => user_clk,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_15_rstpot_403,
      Q => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_15_402
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_14_rstpot : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => data(14),
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_14_400,
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and0000,
      O => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_14_rstpot_401
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_14 : FDC
    port map (
      C => user_clk,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_14_rstpot_401,
      Q => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_14_400
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_13_rstpot : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => data(13),
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_13_398,
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and0000,
      O => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_13_rstpot_399
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_13 : FDC
    port map (
      C => user_clk,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_13_rstpot_399,
      Q => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_13_398
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_12_rstpot : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => data(12),
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_12_396,
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and0000,
      O => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_12_rstpot_397
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_12 : FDC
    port map (
      C => user_clk,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_12_rstpot_397,
      Q => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_12_396
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_11_rstpot : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => data(11),
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_11_394,
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and0000,
      O => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_11_rstpot_395
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_11 : FDC
    port map (
      C => user_clk,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_11_rstpot_395,
      Q => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_11_394
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_10_rstpot : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => data(10),
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_10_392,
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and0000,
      O => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_10_rstpot_393
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_10 : FDC
    port map (
      C => user_clk,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_10_rstpot_393,
      Q => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_10_392
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_9_rstpot : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => data(9),
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_9_419,
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and0000,
      O => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_9_rstpot_420
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_9 : FDC
    port map (
      C => user_clk,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_9_rstpot_420,
      Q => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_9_419
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_8_rstpot : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => data(8),
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_8_417,
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and0000,
      O => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_8_rstpot_418
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_8 : FDC
    port map (
      C => user_clk,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_8_rstpot_418,
      Q => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_8_417
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_7_rstpot : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => data(7),
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_7_415,
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and0000,
      O => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_7_rstpot_416
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_7 : FDC
    port map (
      C => user_clk,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_7_rstpot_416,
      Q => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_7_415
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_6_rstpot : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => data(6),
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_6_413,
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and0000,
      O => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_6_rstpot_414
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_6 : FDC
    port map (
      C => user_clk,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_6_rstpot_414,
      Q => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_6_413
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_5_rstpot : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => data(5),
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_5_411,
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and0000,
      O => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_5_rstpot_412
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_5 : FDC
    port map (
      C => user_clk,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_5_rstpot_412,
      Q => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_5_411
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_4_rstpot : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => data(4),
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_4_409,
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and0000,
      O => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_4_rstpot_410
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_4 : FDC
    port map (
      C => user_clk,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_4_rstpot_410,
      Q => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_4_409
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_3_rstpot : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => data(3),
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_3_407,
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and0000,
      O => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_3_rstpot_408
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_3 : FDC
    port map (
      C => user_clk,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_3_rstpot_408,
      Q => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_3_407
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_2_rstpot : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => data(2),
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_2_405,
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and0000,
      O => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_2_rstpot_406
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_2 : FDC
    port map (
      C => user_clk,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_2_rstpot_406,
      Q => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_2_405
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_1_rstpot : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => data(1),
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_1_391,
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and0000,
      O => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_1_rstpot_404
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_1 : FDC
    port map (
      C => user_clk,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_1_rstpot_404,
      Q => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_1_391
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_0_rstpot : LUT3
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => data(0),
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_0_389,
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and0000,
      O => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_0_rstpot_390
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_0 : FDC
    port map (
      C => user_clk,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_0_rstpot_390,
      Q => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_0_389
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count_2 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => user_clk,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count_2_rstpot_387,
      Q => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count(2)
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count_1 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => user_clk,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count_1_rstpot_385,
      Q => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count(1)
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count_0 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => user_clk,
      CLR => rst_s,
      D => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count_0_rstpot_383,
      Q => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count(0)
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count_mux0000_2_1_SW0 : LUT2
    generic map(
      INIT => X"7"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count(1),
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count(0),
      O => N11
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count_0_rstpot : LUT4
    generic map(
      INIT => X"1A0A"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count(0),
      I1 => N13,
      I2 => N74,
      I3 => width_fifo_wr_765,
      O => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count_0_rstpot_383
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count_mux0000_1_1_SW0 : LUT3
    generic map(
      INIT => X"F9"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count(1),
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count(0),
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count(2),
      O => N15
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count_1_rstpot : LUT4
    generic map(
      INIT => X"3A0A"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count(1),
      I1 => N15,
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count_not0001,
      I3 => N73,
      O => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count_1_rstpot_385
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_full_and00001 : LUT4
    generic map(
      INIT => X"0008"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count(2),
      I1 => mem_fifo_full,
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count(1),
      I3 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count(0),
      O => width_fifo_full
    );
  U_DONE_COUNT_count_0_rstpot : LUT3
    generic map(
      INIT => X"CA"
    )
    port map (
      I0 => U_DONE_COUNT_count(0),
      I1 => U_DONE_COUNT_Mcount_count,
      I2 => N76,
      O => U_DONE_COUNT_count_0_rstpot_308
    );
  U_DONE_COUNT_count_0 : FDC
    port map (
      C => user_clk,
      CLR => rst,
      D => U_DONE_COUNT_count_0_rstpot_308,
      Q => U_DONE_COUNT_count(0)
    );
  U_DONE_COUNT_count_1_rstpot : LUT3
    generic map(
      INIT => X"CA"
    )
    port map (
      I0 => U_DONE_COUNT_count(1),
      I1 => U_DONE_COUNT_Mcount_count1,
      I2 => U_DONE_COUNT_count_not00011_365,
      O => U_DONE_COUNT_count_1_rstpot_330
    );
  U_DONE_COUNT_count_1 : FDC
    port map (
      C => user_clk,
      CLR => rst,
      D => U_DONE_COUNT_count_1_rstpot_330,
      Q => U_DONE_COUNT_count(1)
    );
  U_DONE_COUNT_count_2_rstpot : LUT3
    generic map(
      INIT => X"CA"
    )
    port map (
      I0 => U_DONE_COUNT_count(2),
      I1 => U_DONE_COUNT_Mcount_count2,
      I2 => U_DONE_COUNT_count_not00011_365,
      O => U_DONE_COUNT_count_2_rstpot_347
    );
  U_DONE_COUNT_count_2 : FDC
    port map (
      C => user_clk,
      CLR => rst,
      D => U_DONE_COUNT_count_2_rstpot_347,
      Q => U_DONE_COUNT_count(2)
    );
  U_DONE_COUNT_count_3_rstpot : LUT3
    generic map(
      INIT => X"CA"
    )
    port map (
      I0 => U_DONE_COUNT_count(3),
      I1 => U_DONE_COUNT_Mcount_count3,
      I2 => U_DONE_COUNT_count_not00011_365,
      O => U_DONE_COUNT_count_3_rstpot_351
    );
  U_DONE_COUNT_count_3 : FDC
    port map (
      C => user_clk,
      CLR => rst,
      D => U_DONE_COUNT_count_3_rstpot_351,
      Q => U_DONE_COUNT_count(3)
    );
  U_DONE_COUNT_count_4_rstpot : LUT3
    generic map(
      INIT => X"CA"
    )
    port map (
      I0 => U_DONE_COUNT_count(4),
      I1 => U_DONE_COUNT_Mcount_count4,
      I2 => U_DONE_COUNT_count_not00011_365,
      O => U_DONE_COUNT_count_4_rstpot_353
    );
  U_DONE_COUNT_count_4 : FDC
    port map (
      C => user_clk,
      CLR => rst,
      D => U_DONE_COUNT_count_4_rstpot_353,
      Q => U_DONE_COUNT_count(4)
    );
  U_DONE_COUNT_count_5_rstpot : LUT3
    generic map(
      INIT => X"CA"
    )
    port map (
      I0 => U_DONE_COUNT_count(5),
      I1 => U_DONE_COUNT_Mcount_count5,
      I2 => U_DONE_COUNT_count_not00011_365,
      O => U_DONE_COUNT_count_5_rstpot_355
    );
  U_DONE_COUNT_count_5 : FDC
    port map (
      C => user_clk,
      CLR => rst,
      D => U_DONE_COUNT_count_5_rstpot_355,
      Q => U_DONE_COUNT_count(5)
    );
  U_DONE_COUNT_count_6_rstpot : LUT3
    generic map(
      INIT => X"CA"
    )
    port map (
      I0 => U_DONE_COUNT_count(6),
      I1 => U_DONE_COUNT_Mcount_count6,
      I2 => U_DONE_COUNT_count_not00011_365,
      O => U_DONE_COUNT_count_6_rstpot_357
    );
  U_DONE_COUNT_count_6 : FDC
    port map (
      C => user_clk,
      CLR => rst,
      D => U_DONE_COUNT_count_6_rstpot_357,
      Q => U_DONE_COUNT_count(6)
    );
  U_DONE_COUNT_count_7_rstpot : LUT3
    generic map(
      INIT => X"CA"
    )
    port map (
      I0 => U_DONE_COUNT_count(7),
      I1 => U_DONE_COUNT_Mcount_count7,
      I2 => U_DONE_COUNT_count_not00011_365,
      O => U_DONE_COUNT_count_7_rstpot_359
    );
  U_DONE_COUNT_count_7 : FDC
    port map (
      C => user_clk,
      CLR => rst,
      D => U_DONE_COUNT_count_7_rstpot_359,
      Q => U_DONE_COUNT_count(7)
    );
  U_DONE_COUNT_count_8_rstpot : LUT3
    generic map(
      INIT => X"CA"
    )
    port map (
      I0 => U_DONE_COUNT_count(8),
      I1 => U_DONE_COUNT_Mcount_count8,
      I2 => U_DONE_COUNT_count_not00011_365,
      O => U_DONE_COUNT_count_8_rstpot_361
    );
  U_DONE_COUNT_count_8 : FDC
    port map (
      C => user_clk,
      CLR => rst,
      D => U_DONE_COUNT_count_8_rstpot_361,
      Q => U_DONE_COUNT_count(8)
    );
  U_DONE_COUNT_count_9_rstpot : LUT3
    generic map(
      INIT => X"CA"
    )
    port map (
      I0 => U_DONE_COUNT_count(9),
      I1 => U_DONE_COUNT_Mcount_count9,
      I2 => U_DONE_COUNT_count_not00011_365,
      O => U_DONE_COUNT_count_9_rstpot_363
    );
  U_DONE_COUNT_count_9 : FDC
    port map (
      C => user_clk,
      CLR => rst,
      D => U_DONE_COUNT_count_9_rstpot_363,
      Q => U_DONE_COUNT_count(9)
    );
  U_DONE_COUNT_count_10_rstpot : LUT3
    generic map(
      INIT => X"CA"
    )
    port map (
      I0 => U_DONE_COUNT_count(10),
      I1 => U_DONE_COUNT_Mcount_count10,
      I2 => U_DONE_COUNT_count_not00011_365,
      O => U_DONE_COUNT_count_10_rstpot_311
    );
  U_DONE_COUNT_count_10 : FDC
    port map (
      C => user_clk,
      CLR => rst,
      D => U_DONE_COUNT_count_10_rstpot_311,
      Q => U_DONE_COUNT_count(10)
    );
  U_DONE_COUNT_count_11_rstpot : LUT3
    generic map(
      INIT => X"CA"
    )
    port map (
      I0 => U_DONE_COUNT_count(11),
      I1 => U_DONE_COUNT_Mcount_count11,
      I2 => U_DONE_COUNT_count_not00011_365,
      O => U_DONE_COUNT_count_11_rstpot_313
    );
  U_DONE_COUNT_count_11 : FDC
    port map (
      C => user_clk,
      CLR => rst,
      D => U_DONE_COUNT_count_11_rstpot_313,
      Q => U_DONE_COUNT_count(11)
    );
  U_DONE_COUNT_count_12_rstpot : LUT3
    generic map(
      INIT => X"CA"
    )
    port map (
      I0 => U_DONE_COUNT_count(12),
      I1 => U_DONE_COUNT_Mcount_count12,
      I2 => U_DONE_COUNT_count_not00011_365,
      O => U_DONE_COUNT_count_12_rstpot_315
    );
  U_DONE_COUNT_count_12 : FDC
    port map (
      C => user_clk,
      CLR => rst,
      D => U_DONE_COUNT_count_12_rstpot_315,
      Q => U_DONE_COUNT_count(12)
    );
  U_DONE_COUNT_count_13_rstpot : LUT3
    generic map(
      INIT => X"CA"
    )
    port map (
      I0 => U_DONE_COUNT_count(13),
      I1 => U_DONE_COUNT_Mcount_count13,
      I2 => U_DONE_COUNT_count_not00011_365,
      O => U_DONE_COUNT_count_13_rstpot_317
    );
  U_DONE_COUNT_count_13 : FDC
    port map (
      C => user_clk,
      CLR => rst,
      D => U_DONE_COUNT_count_13_rstpot_317,
      Q => U_DONE_COUNT_count(13)
    );
  U_DONE_COUNT_count_14_rstpot : LUT3
    generic map(
      INIT => X"CA"
    )
    port map (
      I0 => U_DONE_COUNT_count(14),
      I1 => U_DONE_COUNT_Mcount_count14,
      I2 => U_DONE_COUNT_count_not00011_365,
      O => U_DONE_COUNT_count_14_rstpot_319
    );
  U_DONE_COUNT_count_14 : FDC
    port map (
      C => user_clk,
      CLR => rst,
      D => U_DONE_COUNT_count_14_rstpot_319,
      Q => U_DONE_COUNT_count(14)
    );
  U_DONE_COUNT_count_15_rstpot : LUT3
    generic map(
      INIT => X"CA"
    )
    port map (
      I0 => U_DONE_COUNT_count(15),
      I1 => U_DONE_COUNT_Mcount_count15,
      I2 => U_DONE_COUNT_count_not00011_365,
      O => U_DONE_COUNT_count_15_rstpot_321
    );
  U_DONE_COUNT_count_15 : FDC
    port map (
      C => user_clk,
      CLR => rst,
      D => U_DONE_COUNT_count_15_rstpot_321,
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
      O => U_DONE_COUNT_count_16_rstpot_323
    );
  U_DONE_COUNT_count_16 : FDC
    port map (
      C => user_clk,
      CLR => rst,
      D => U_DONE_COUNT_count_16_rstpot_323,
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
      O => U_DONE_COUNT_count_17_rstpot_325
    );
  U_DONE_COUNT_count_17 : FDC
    port map (
      C => user_clk,
      CLR => rst,
      D => U_DONE_COUNT_count_17_rstpot_325,
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
      O => U_DONE_COUNT_count_18_rstpot_327
    );
  U_DONE_COUNT_count_18 : FDC
    port map (
      C => user_clk,
      CLR => rst,
      D => U_DONE_COUNT_count_18_rstpot_327,
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
      O => U_DONE_COUNT_count_19_rstpot_329
    );
  U_DONE_COUNT_count_19 : FDC
    port map (
      C => user_clk,
      CLR => rst,
      D => U_DONE_COUNT_count_19_rstpot_329,
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
      O => U_DONE_COUNT_count_20_rstpot_333
    );
  U_DONE_COUNT_count_20 : FDC
    port map (
      C => user_clk,
      CLR => rst,
      D => U_DONE_COUNT_count_20_rstpot_333,
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
      O => U_DONE_COUNT_count_21_rstpot_335
    );
  U_DONE_COUNT_count_21 : FDC
    port map (
      C => user_clk,
      CLR => rst,
      D => U_DONE_COUNT_count_21_rstpot_335,
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
      O => U_DONE_COUNT_count_22_rstpot_337
    );
  U_DONE_COUNT_count_22 : FDC
    port map (
      C => user_clk,
      CLR => rst,
      D => U_DONE_COUNT_count_22_rstpot_337,
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
      O => U_DONE_COUNT_count_23_rstpot_339
    );
  U_DONE_COUNT_count_23 : FDC
    port map (
      C => user_clk,
      CLR => rst,
      D => U_DONE_COUNT_count_23_rstpot_339,
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
      O => U_DONE_COUNT_count_24_rstpot_341
    );
  U_DONE_COUNT_count_24 : FDC
    port map (
      C => user_clk,
      CLR => rst,
      D => U_DONE_COUNT_count_24_rstpot_341,
      Q => U_DONE_COUNT_count(24)
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
  width_fifo_wr_SW3 : LUT4
    generic map(
      INIT => X"3236"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count(1),
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count(2),
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count(0),
      I3 => mem_fifo_full,
      O => N9
    );
  U_AG_SO_next_state_0_mux00001 : LUT3
    generic map(
      INIT => X"96"
    )
    port map (
      I0 => U_AG_SO_state(0),
      I1 => U_HANDSHAKE_U_TAKE_IT_SYNC_output(0),
      I2 => U_HANDSHAKE_take_it_tg_ff_379,
      O => U_AG_SO_next_state
    );
  width_fifo_wr_SW0 : LUT4
    generic map(
      INIT => X"0203"
    )
    port map (
      I0 => mem_fifo_full,
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count(1),
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count(0),
      I3 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count(2),
      O => N4
    );
  busy_mux00012 : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => busy_524,
      I1 => state_FSM_FFd1_758,
      I2 => state_FSM_FFd2_760,
      I3 => go,
      O => busy_mux0001
    );
  Mcount_empty_count_xor_0_11 : LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count(1),
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count(0),
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count(2),
      I3 => empty_count(0),
      O => Mcount_empty_count
    );
  width_fifo_wr_SW2 : LUT4
    generic map(
      INIT => X"4E44"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count(2),
      I1 => wr_en,
      I2 => mem_fifo_full,
      I3 => N72,
      O => N8
    );
  ready1 : LUT4
    generic map(
      INIT => X"FFBF"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count(1),
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count(2),
      I2 => mem_fifo_full,
      I3 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count(0),
      O => ready
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count_mux0000_0_SW1 : LUT3
    generic map(
      INIT => X"A8"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count(2),
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count(1),
      I2 => mem_fifo_full,
      O => N13
    );
  U_AG_SO_sram_rw_n1 : LUT4
    generic map(
      INIT => X"FF6F"
    )
    port map (
      I0 => U_HANDSHAKE_U_TAKE_IT_SYNC_output(0),
      I1 => U_HANDSHAKE_take_it_tg_ff_379,
      I2 => U_AG_SO_state(0),
      I3 => ag_stall,
      O => NlwRenamedSignal_sram_rw_n
    );
  U_AG_SO_sram_request1 : LUT4
    generic map(
      INIT => X"2002"
    )
    port map (
      I0 => U_AG_SO_state(0),
      I1 => ag_stall,
      I2 => U_HANDSHAKE_U_TAKE_IT_SYNC_output(0),
      I3 => U_HANDSHAKE_take_it_tg_ff_379,
      O => sram_request
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and00001 : MUXF5
    port map (
      I0 => N62,
      I1 => N63,
      S => done_s,
      O => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and0000
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and00001_F : LUT4
    generic map(
      INIT => X"22A2"
    )
    port map (
      I0 => wr_en,
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count(2),
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_N5,
      I3 => mem_fifo_full,
      O => N62
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and00001_G : LUT3
    generic map(
      INIT => X"32"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count(0),
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count(2),
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count(1),
      O => N63
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count_2_rstpot : MUXF5
    port map (
      I0 => N64,
      I1 => N65,
      S => done_s,
      O => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count_2_rstpot_387
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count_2_rstpot_F : LUT4
    generic map(
      INIT => X"4464"
    )
    port map (
      I0 => N8,
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count(2),
      I2 => wr_en,
      I3 => N11,
      O => N64
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count_2_rstpot_G : LUT4
    generic map(
      INIT => X"ECE8"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count(0),
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count(2),
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count(1),
      I3 => mem_fifo_full,
      O => N65
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and00001_1 : MUXF5
    port map (
      I0 => N66,
      I1 => N67,
      S => done_s,
      O => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and00001_422
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and00001_1_F : LUT4
    generic map(
      INIT => X"22A2"
    )
    port map (
      I0 => wr_en,
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count(2),
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_N5,
      I3 => mem_fifo_full,
      O => N66
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and00001_1_G : LUT3
    generic map(
      INIT => X"32"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count(0),
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count(2),
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count(1),
      O => N67
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and00001_2 : MUXF5
    port map (
      I0 => N68,
      I1 => N69,
      S => done_s,
      O => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and000011
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and00001_2_F : LUT4
    generic map(
      INIT => X"22A2"
    )
    port map (
      I0 => wr_en,
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count(2),
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_N5,
      I3 => mem_fifo_full,
      O => N68
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and00001_2_G : LUT3
    generic map(
      INIT => X"32"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count(0),
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count(2),
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count(1),
      O => N69
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and00001_3 : MUXF5
    port map (
      I0 => N70,
      I1 => N71,
      S => done_s,
      O => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and000012
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and00001_3_F : LUT4
    generic map(
      INIT => X"22A2"
    )
    port map (
      I0 => wr_en,
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count(2),
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_N5,
      I3 => mem_fifo_full,
      O => N70
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and00001_3_G : LUT3
    generic map(
      INIT => X"32"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count(0),
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count(2),
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count(1),
      O => N71
    );
  U_AG_SO_Madd_next_addr_current_addsub0000_lut_1_INV_0 : INV
    port map (
      I => U_AG_SO_addr_current(1),
      O => U_AG_SO_Madd_next_addr_current_addsub0000_lut(1)
    );
  U_HANDSHAKE_take_it_tg_not00011_INV_0 : INV
    port map (
      I => U_HANDSHAKE_take_it_tg_378,
      O => U_HANDSHAKE_take_it_tg_not0001
    );
  U_HANDSHAKE_got_it_tg_not00011_INV_0 : INV
    port map (
      I => U_HANDSHAKE_got_it_tg_372,
      O => U_HANDSHAKE_got_it_tg_not0001
    );
  clear_inv1_INV_0 : INV
    port map (
      I => clear,
      O => clear_inv
    );
  U_AG_SO_next_addr_current_20_2711 : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => U_AG_SO_addr_current(20),
      I1 => handshake_rcv,
      I2 => ag_stall,
      I3 => U_AG_SO_next_addr_current_addsub0000(20),
      O => U_AG_SO_next_addr_current_20_271
    );
  U_AG_SO_next_addr_current_20_271_f5 : MUXF5
    port map (
      I0 => start_addr_s(20),
      I1 => U_AG_SO_next_addr_current_20_271,
      S => U_AG_SO_state(0),
      O => U_AG_SO_next_addr_current(20)
    );
  U_AG_SO_next_addr_current_19_2711 : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => U_AG_SO_addr_current(19),
      I1 => handshake_rcv,
      I2 => ag_stall,
      I3 => U_AG_SO_next_addr_current_addsub0000(19),
      O => U_AG_SO_next_addr_current_19_271
    );
  U_AG_SO_next_addr_current_19_271_f5 : MUXF5
    port map (
      I0 => start_addr_s(19),
      I1 => U_AG_SO_next_addr_current_19_271,
      S => U_AG_SO_state(0),
      O => U_AG_SO_next_addr_current(19)
    );
  U_AG_SO_next_addr_current_18_2711 : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => U_AG_SO_addr_current(18),
      I1 => handshake_rcv,
      I2 => ag_stall,
      I3 => U_AG_SO_next_addr_current_addsub0000(18),
      O => U_AG_SO_next_addr_current_18_271
    );
  U_AG_SO_next_addr_current_18_271_f5 : MUXF5
    port map (
      I0 => start_addr_s(18),
      I1 => U_AG_SO_next_addr_current_18_271,
      S => U_AG_SO_state(0),
      O => U_AG_SO_next_addr_current(18)
    );
  U_AG_SO_next_addr_current_17_2711 : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => U_AG_SO_addr_current(17),
      I1 => handshake_rcv,
      I2 => ag_stall,
      I3 => U_AG_SO_next_addr_current_addsub0000(17),
      O => U_AG_SO_next_addr_current_17_271
    );
  U_AG_SO_next_addr_current_17_271_f5 : MUXF5
    port map (
      I0 => start_addr_s(17),
      I1 => U_AG_SO_next_addr_current_17_271,
      S => U_AG_SO_state(0),
      O => U_AG_SO_next_addr_current(17)
    );
  U_AG_SO_next_addr_current_16_2711 : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => U_AG_SO_addr_current(16),
      I1 => handshake_rcv,
      I2 => ag_stall,
      I3 => U_AG_SO_next_addr_current_addsub0000(16),
      O => U_AG_SO_next_addr_current_16_271
    );
  U_AG_SO_next_addr_current_16_271_f5 : MUXF5
    port map (
      I0 => start_addr_s(16),
      I1 => U_AG_SO_next_addr_current_16_271,
      S => U_AG_SO_state(0),
      O => U_AG_SO_next_addr_current(16)
    );
  U_AG_SO_next_addr_current_15_2711 : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => U_AG_SO_addr_current(15),
      I1 => handshake_rcv,
      I2 => ag_stall,
      I3 => U_AG_SO_next_addr_current_addsub0000(15),
      O => U_AG_SO_next_addr_current_15_271
    );
  U_AG_SO_next_addr_current_15_271_f5 : MUXF5
    port map (
      I0 => start_addr_s(15),
      I1 => U_AG_SO_next_addr_current_15_271,
      S => U_AG_SO_state(0),
      O => U_AG_SO_next_addr_current(15)
    );
  U_AG_SO_next_addr_current_14_2711 : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => U_AG_SO_addr_current(14),
      I1 => handshake_rcv,
      I2 => ag_stall,
      I3 => U_AG_SO_next_addr_current_addsub0000(14),
      O => U_AG_SO_next_addr_current_14_271
    );
  U_AG_SO_next_addr_current_14_271_f5 : MUXF5
    port map (
      I0 => start_addr_s(14),
      I1 => U_AG_SO_next_addr_current_14_271,
      S => U_AG_SO_state(0),
      O => U_AG_SO_next_addr_current(14)
    );
  U_AG_SO_next_addr_current_13_2711 : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => U_AG_SO_addr_current(13),
      I1 => handshake_rcv,
      I2 => ag_stall,
      I3 => U_AG_SO_next_addr_current_addsub0000(13),
      O => U_AG_SO_next_addr_current_13_271
    );
  U_AG_SO_next_addr_current_13_271_f5 : MUXF5
    port map (
      I0 => start_addr_s(13),
      I1 => U_AG_SO_next_addr_current_13_271,
      S => U_AG_SO_state(0),
      O => U_AG_SO_next_addr_current(13)
    );
  U_AG_SO_next_addr_current_12_2711 : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => U_AG_SO_addr_current(12),
      I1 => handshake_rcv,
      I2 => ag_stall,
      I3 => U_AG_SO_next_addr_current_addsub0000(12),
      O => U_AG_SO_next_addr_current_12_271
    );
  U_AG_SO_next_addr_current_12_271_f5 : MUXF5
    port map (
      I0 => start_addr_s(12),
      I1 => U_AG_SO_next_addr_current_12_271,
      S => U_AG_SO_state(0),
      O => U_AG_SO_next_addr_current(12)
    );
  U_AG_SO_next_addr_current_11_2711 : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => U_AG_SO_addr_current(11),
      I1 => handshake_rcv,
      I2 => ag_stall,
      I3 => U_AG_SO_next_addr_current_addsub0000(11),
      O => U_AG_SO_next_addr_current_11_271
    );
  U_AG_SO_next_addr_current_11_271_f5 : MUXF5
    port map (
      I0 => start_addr_s(11),
      I1 => U_AG_SO_next_addr_current_11_271,
      S => U_AG_SO_state(0),
      O => U_AG_SO_next_addr_current(11)
    );
  U_AG_SO_next_addr_current_10_2711 : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => U_AG_SO_addr_current(10),
      I1 => handshake_rcv,
      I2 => ag_stall,
      I3 => U_AG_SO_next_addr_current_addsub0000(10),
      O => U_AG_SO_next_addr_current_10_271
    );
  U_AG_SO_next_addr_current_10_271_f5 : MUXF5
    port map (
      I0 => start_addr_s(10),
      I1 => U_AG_SO_next_addr_current_10_271,
      S => U_AG_SO_state(0),
      O => U_AG_SO_next_addr_current(10)
    );
  U_AG_SO_next_addr_current_9_2711 : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => U_AG_SO_addr_current(9),
      I1 => handshake_rcv,
      I2 => ag_stall,
      I3 => U_AG_SO_next_addr_current_addsub0000(9),
      O => U_AG_SO_next_addr_current_9_271
    );
  U_AG_SO_next_addr_current_9_271_f5 : MUXF5
    port map (
      I0 => start_addr_s(9),
      I1 => U_AG_SO_next_addr_current_9_271,
      S => U_AG_SO_state(0),
      O => U_AG_SO_next_addr_current(9)
    );
  U_AG_SO_next_addr_current_8_2711 : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => U_AG_SO_addr_current(8),
      I1 => handshake_rcv,
      I2 => ag_stall,
      I3 => U_AG_SO_next_addr_current_addsub0000(8),
      O => U_AG_SO_next_addr_current_8_271
    );
  U_AG_SO_next_addr_current_8_271_f5 : MUXF5
    port map (
      I0 => start_addr_s(8),
      I1 => U_AG_SO_next_addr_current_8_271,
      S => U_AG_SO_state(0),
      O => U_AG_SO_next_addr_current(8)
    );
  U_AG_SO_next_addr_current_7_2711 : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => U_AG_SO_addr_current(7),
      I1 => handshake_rcv,
      I2 => ag_stall,
      I3 => U_AG_SO_next_addr_current_addsub0000(7),
      O => U_AG_SO_next_addr_current_7_271
    );
  U_AG_SO_next_addr_current_7_271_f5 : MUXF5
    port map (
      I0 => start_addr_s(7),
      I1 => U_AG_SO_next_addr_current_7_271,
      S => U_AG_SO_state(0),
      O => U_AG_SO_next_addr_current(7)
    );
  U_AG_SO_next_addr_current_6_2711 : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => U_AG_SO_addr_current(6),
      I1 => handshake_rcv,
      I2 => ag_stall,
      I3 => U_AG_SO_next_addr_current_addsub0000(6),
      O => U_AG_SO_next_addr_current_6_271
    );
  U_AG_SO_next_addr_current_6_271_f5 : MUXF5
    port map (
      I0 => start_addr_s(6),
      I1 => U_AG_SO_next_addr_current_6_271,
      S => U_AG_SO_state(0),
      O => U_AG_SO_next_addr_current(6)
    );
  U_AG_SO_next_addr_current_5_2711 : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => U_AG_SO_addr_current(5),
      I1 => handshake_rcv,
      I2 => ag_stall,
      I3 => U_AG_SO_next_addr_current_addsub0000(5),
      O => U_AG_SO_next_addr_current_5_271
    );
  U_AG_SO_next_addr_current_5_271_f5 : MUXF5
    port map (
      I0 => start_addr_s(5),
      I1 => U_AG_SO_next_addr_current_5_271,
      S => U_AG_SO_state(0),
      O => U_AG_SO_next_addr_current(5)
    );
  U_AG_SO_next_addr_current_4_2711 : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => U_AG_SO_addr_current(4),
      I1 => handshake_rcv,
      I2 => ag_stall,
      I3 => U_AG_SO_next_addr_current_addsub0000(4),
      O => U_AG_SO_next_addr_current_4_271
    );
  U_AG_SO_next_addr_current_4_271_f5 : MUXF5
    port map (
      I0 => start_addr_s(4),
      I1 => U_AG_SO_next_addr_current_4_271,
      S => U_AG_SO_state(0),
      O => U_AG_SO_next_addr_current(4)
    );
  U_AG_SO_next_addr_current_3_2711 : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => U_AG_SO_addr_current(3),
      I1 => handshake_rcv,
      I2 => ag_stall,
      I3 => U_AG_SO_next_addr_current_addsub0000(3),
      O => U_AG_SO_next_addr_current_3_271
    );
  U_AG_SO_next_addr_current_3_271_f5 : MUXF5
    port map (
      I0 => start_addr_s(3),
      I1 => U_AG_SO_next_addr_current_3_271,
      S => U_AG_SO_state(0),
      O => U_AG_SO_next_addr_current(3)
    );
  U_AG_SO_next_addr_current_2_2711 : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => U_AG_SO_addr_current(2),
      I1 => handshake_rcv,
      I2 => ag_stall,
      I3 => U_AG_SO_next_addr_current_addsub0000(2),
      O => U_AG_SO_next_addr_current_2_271
    );
  U_AG_SO_next_addr_current_2_271_f5 : MUXF5
    port map (
      I0 => start_addr_s(2),
      I1 => U_AG_SO_next_addr_current_2_271,
      S => U_AG_SO_state(0),
      O => U_AG_SO_next_addr_current(2)
    );
  U_AG_SO_next_addr_current_1_2711 : LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => U_AG_SO_addr_current(1),
      I1 => handshake_rcv,
      I2 => ag_stall,
      I3 => U_AG_SO_next_addr_current_addsub0000(1),
      O => U_AG_SO_next_addr_current_1_271
    );
  U_AG_SO_next_addr_current_1_271_f5 : MUXF5
    port map (
      I0 => start_addr_s(1),
      I1 => U_AG_SO_next_addr_current_1_271,
      S => U_AG_SO_state(0),
      O => U_AG_SO_next_addr_current(1)
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_and0000111 : LUT2_D
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count(1),
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count(0),
      LO => N72,
      O => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_N5
    );
  width_fifo_wr : LUT4_D
    generic map(
      INIT => X"03AA"
    )
    port map (
      I0 => wr_en,
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count(2),
      I2 => N4,
      I3 => done_s,
      LO => N73,
      O => width_fifo_wr_765
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count_not00011 : LUT3_D
    generic map(
      INIT => X"AC"
    )
    port map (
      I0 => N9,
      I1 => N8,
      I2 => done_s,
      LO => N74,
      O => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count_not0001
    );
  U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_empty_internal1 : LUT3_D
    generic map(
      INIT => X"01"
    )
    port map (
      I0 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count(1),
      I1 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count(0),
      I2 => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_count(2),
      LO => N75,
      O => width_fifo_empty_internal
    );
  U_DONE_COUNT_count_not00011_1 : LUT4_D
    generic map(
      INIT => X"CCCE"
    )
    port map (
      I0 => wr_en,
      I1 => clear,
      I2 => width_fifo_full,
      I3 => done_s,
      LO => N76,
      O => U_DONE_COUNT_count_not00011_365
    );
  U_FIFO : fifo_64
    port map (
      rd_en => mem_fifo_rd,
      wr_en => mem_fifo_wr,
      full => mem_fifo_full,
      empty => mem_fifo_empty,
      wr_clk => user_clk,
      rst => rst_s,
      rd_clk => sram_clk,
      dout(63) => sram_wdata(63),
      dout(62) => sram_wdata(62),
      dout(61) => sram_wdata(61),
      dout(60) => sram_wdata(60),
      dout(59) => sram_wdata(59),
      dout(58) => sram_wdata(58),
      dout(57) => sram_wdata(57),
      dout(56) => sram_wdata(56),
      dout(55) => sram_wdata(55),
      dout(54) => sram_wdata(54),
      dout(53) => sram_wdata(53),
      dout(52) => sram_wdata(52),
      dout(51) => sram_wdata(51),
      dout(50) => sram_wdata(50),
      dout(49) => sram_wdata(49),
      dout(48) => sram_wdata(48),
      dout(47) => sram_wdata(47),
      dout(46) => sram_wdata(46),
      dout(45) => sram_wdata(45),
      dout(44) => sram_wdata(44),
      dout(43) => sram_wdata(43),
      dout(42) => sram_wdata(42),
      dout(41) => sram_wdata(41),
      dout(40) => sram_wdata(40),
      dout(39) => sram_wdata(39),
      dout(38) => sram_wdata(38),
      dout(37) => sram_wdata(37),
      dout(36) => sram_wdata(36),
      dout(35) => sram_wdata(35),
      dout(34) => sram_wdata(34),
      dout(33) => sram_wdata(33),
      dout(32) => sram_wdata(32),
      dout(31) => sram_wdata(31),
      dout(30) => sram_wdata(30),
      dout(29) => sram_wdata(29),
      dout(28) => sram_wdata(28),
      dout(27) => sram_wdata(27),
      dout(26) => sram_wdata(26),
      dout(25) => sram_wdata(25),
      dout(24) => sram_wdata(24),
      dout(23) => sram_wdata(23),
      dout(22) => sram_wdata(22),
      dout(21) => sram_wdata(21),
      dout(20) => sram_wdata(20),
      dout(19) => sram_wdata(19),
      dout(18) => sram_wdata(18),
      dout(17) => sram_wdata(17),
      dout(16) => sram_wdata(16),
      dout(15) => sram_wdata(15),
      dout(14) => sram_wdata(14),
      dout(13) => sram_wdata(13),
      dout(12) => sram_wdata(12),
      dout(11) => sram_wdata(11),
      dout(10) => sram_wdata(10),
      dout(9) => sram_wdata(9),
      dout(8) => sram_wdata(8),
      dout(7) => sram_wdata(7),
      dout(6) => sram_wdata(6),
      dout(5) => sram_wdata(5),
      dout(4) => sram_wdata(4),
      dout(3) => sram_wdata(3),
      dout(2) => sram_wdata(2),
      dout(1) => sram_wdata(1),
      dout(0) => sram_wdata(0),
      din(63) => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_15_402,
      din(62) => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_14_400,
      din(61) => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_13_398,
      din(60) => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_12_396,
      din(59) => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_11_394,
      din(58) => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_10_392,
      din(57) => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_9_419,
      din(56) => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_8_417,
      din(55) => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_7_415,
      din(54) => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_6_413,
      din(53) => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_5_411,
      din(52) => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_4_409,
      din(51) => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_3_407,
      din(50) => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_2_405,
      din(49) => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_1_391,
      din(48) => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_0_0_389,
      din(47) => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_15_438,
      din(46) => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_14_436,
      din(45) => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_13_434,
      din(44) => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_12_432,
      din(43) => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_11_430,
      din(42) => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_10_428,
      din(41) => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_9_455,
      din(40) => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_8_453,
      din(39) => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_7_451,
      din(38) => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_6_449,
      din(37) => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_5_447,
      din(36) => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_4_445,
      din(35) => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_3_443,
      din(34) => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_2_441,
      din(33) => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_1_427,
      din(32) => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_1_0_425,
      din(31) => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_15_470,
      din(30) => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_14_468,
      din(29) => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_13_466,
      din(28) => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_12_464,
      din(27) => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_11_462,
      din(26) => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_10_460,
      din(25) => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_9_487,
      din(24) => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_8_485,
      din(23) => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_7_483,
      din(22) => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_6_481,
      din(21) => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_5_479,
      din(20) => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_4_477,
      din(19) => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_3_475,
      din(18) => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_2_473,
      din(17) => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_1_459,
      din(16) => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_2_0_457,
      din(15) => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_15_502,
      din(14) => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_14_500,
      din(13) => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_13_498,
      din(12) => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_12_496,
      din(11) => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_11_494,
      din(10) => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_10_492,
      din(9) => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_9_519,
      din(8) => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_8_517,
      din(7) => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_7_515,
      din(6) => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_6_513,
      din(5) => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_5_511,
      din(4) => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_4_509,
      din(3) => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_3_507,
      din(2) => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_2_505,
      din(1) => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_1_491,
      din(0) => U_WIDTH_FIFO_U_EXPAND_U_EXPAND_FIFO_data_3_0_489
    );

end Structure;

-- synthesis translate_on
