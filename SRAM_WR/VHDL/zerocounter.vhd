----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:01:22 11/25/2013 
-- Design Name: 
-- Module Name:    zerocounter - Behavioral 
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
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.mem_pkg.all;
use work.user_pkg.all;

entity zerocounter is
generic (
    width  :     positive := 32);

    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
		   count_start:in std_logic;
			  --valid : in std_logic;
		   size : in  STD_LOGIC_VECTOR (width-1 downto 0);
			  --start_addr : in std_logic_vector(20 downto 0);
			  --out_addr : out std_logic_vector(20 downto 0);
           sel : out  STD_LOGIC;
			  wrc: out std_logic;
		   done : out STD_LOGIC);
end zerocounter;

architecture Behavioral of zerocounter is
signal count : unsigned(width-1 downto 0);
signal sel_s,sig_int,done_s: std_logic;
signal temp : integer;

begin

	temp <= to_integer(4-(unsigned(size)) mod 4);
	process(clk,rst)	
	--variable temp : integer := conv_integer(size) mod 4;
	begin
		if (rst ='1') then
		sel <= '0';
		done <= '0';
		count <= (others => '0');
		wrc<='1';
		elsif (clk'event and clk = '1') then
					
				if(count_start='1') then
					
					if (to_integer(count) < temp) then
						sel <= '1';
						wrc<='0';
						count <= count + 1;
					else
						--sel <= '0';
						done<= '1';
						wrc<='1';
					end if;
				end if;
		end if;
	end process;
	--sel<=sel_s;
	--done<=done_s;
end Behavioral;

