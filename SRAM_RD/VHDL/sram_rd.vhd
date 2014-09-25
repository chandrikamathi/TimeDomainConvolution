----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:57:02 11/20/2013 
-- Design Name: 
-- Module Name:    sram_rd - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.mem_pkg.all;
use work.user_pkg.all;


---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sram_rd is
    Port ( sram_clk : in  STD_LOGIC;
           user_clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           clear : in  STD_LOGIC;
           go : in  STD_LOGIC;
           rd_en : in  STD_LOGIC;
           stall : in  STD_LOGIC;
			  start_addr : in std_logic_vector (SRAM_ADDR_RANGE);
           size : in  STD_LOGIC_vector(SIZE_RANGE);
           valid : out  STD_LOGIC;
           data : out  STD_LOGIC_vector (DATA_RANGE);
           done : out  STD_LOGIC;
		
			  
			sram_request    : out std_logic;
         sram_addr       : out std_logic_vector(SRAM_ADDR_RANGE);
         sram_ld_n       : out std_logic;
         sram_rw_n       : out std_logic;
         sram_bw_n       : out std_logic_vector(SRAM_BW_RANGE);
         sram_wdata      : out std_logic_vector(SRAM_DATA_RANGE);
         sram_rdata      : in  std_logic_vector(SRAM_DATA_RANGE);
         sram_valid      : in  std_logic;
         sram_fifo_empty : in  std_logic:='X';
         sram_calibrated : in  std_logic:='X');
			
end sram_rd;

architecture Behavioral of sram_rd is

signal p_full, ag_received, empty, mem_in_valid, count_send, count_received, fifo_wr, fifo_full : std_logic;
signal count_done, ag_done, ff1_out, ff2_out,dual_go, rstclear,rd_en_inter,ack_s, send: std_logic;
signal sram_fifo_rdata:std_logic_vector(63 downto 0);
--signal sram_addr_s:std_logic_vector(SRAM_ADDR_RANGE);
signal start_addr_inter:std_logic_vector(SRAM_ADDR_RANGE);
begin

rstclear <= rst or clear;
sram_wdata<=(others=>'0');
sram_bw_n<=(others=>'0');
	U_AG: entity work.add_gen
		port map (
			  clk => sram_clk,
           rst => rstclear,
           stall_fifo => p_full,
           start_addr => start_addr_inter,
			  --go => dual_go,
           stall => stall,
			  done => ff2_out,
			  sram_request => sram_request, 
			  sram_ld_n => sram_ld_n,
			  sram_rw_n => sram_rw_n,
			  ag_valid => ag_received,
           sram_addr => sram_addr
			  --addr_gen_running=>run
			  );
	
	U_HS: entity work.handshake
		port map (
			  clk_src => user_clk, 
			  clk_dest => sram_clk,
			  rst => rstclear,     
			  go => send,     
			  delay_ack => C_0,
			  rcv => ag_received,   
			  ack => ack_s
			  );
	
	
	U_FIFO: entity work.fifo_pg_full
		port map(
			  wr_clk => sram_clk,
			  rd_clk => user_clk,
			  rst => rstclear,
			  rd_en => rd_en_inter,
			  wr_en => fifo_wr,
			  prog_full => p_full,
			  full => fifo_full,
			  empty => empty,
			  din => sram_fifo_rdata,
			  dout => data
			  );
sram_fifo_rdata <= sram_rdata(15 downto 0) & sram_rdata(31 downto 16) & sram_rdata(47 downto 32) & sram_rdata(63 downto 48);
fifo_wr <=  sram_valid ;
rd_en_inter<=rd_en and not count_done;			  
mem_in_valid <= not empty;
valid <= mem_in_valid;

	U_count : entity work.counter
		port map (
			clk=> user_clk,
			rst=>rstclear,
			size => size,
			rd_en=> rd_en,
			valid => send, 
			rcv => ack_s,
			count_start => go,
			start_addr => start_addr,
			out_addr => start_addr_inter,
			count_done => count_done
		);
--ag_done <= count_done;
done <= count_done;
--
--U_start_user : entity work.reg
--	generic map (
--				width => 21)
--			port map ( clk => user_clk,
--						rst => rstclear,
--						en => C_1,
--						input => start_addr,
--						output => start_addr_inter);
--
--U_start_sram : entity work.reg
--	generic map (
--				width => 21)
--			port map ( clk => sram_clk,
--						rst => rstclear,
--						en => ag_received,
--						input => start_addr_inter,
--						output => start_addr_s);

	U_FF1 : entity work.reg
	generic map (
				width => 1)
			port map ( clk => user_clk,
						rst => rstclear,
						en =>C_1,
						input(0) => count_done,
						output(0) => ff1_out);

	U_FF2 : entity work.reg
	generic map(
				width => 1)
			port map ( clk => sram_clk,
						rst => rstclear,
						en => C_1,
						input(0) => ff1_out,
						output(0) => ff2_out);
						
  
  	U_FF3 : entity work.reg
	generic map (
				width => 1)
			port map ( clk => sram_clk,
						rst => rstclear,
						en => C_1,
						input(0) => ff2_out,
						output(0) => ag_done);
end Behavioral;


