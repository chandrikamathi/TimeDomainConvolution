----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:16:55 11/07/2012 
-- Design Name: 
-- Module Name:    count - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity count is
    Port ( size : in  std_logic_vector(31 downto 0);
           wr_en : in  STD_LOGIC;
		   done : out  STD_LOGIC;
           clk : in  STD_LOGIC;
		   send : out std_logic;
		   go : in std_logic;
		   start_addr: in std_logic_vector(20 downto 0);
           out_addr : out std_logic_vector(20 downto 0);
		   rcv : in std_logic;
           rst : in  std_logic);
end count;

architecture behavioral of count is
signal count: std_logic_vector(31 downto 0):=(others =>'0');
signal sig_int : std_logic := '0';
begin
	process(clk,rst)
	begin
		if (rst = '1') then
			done<='0';
			send <= '0'; 
			count <= (others => '0');
		elsif (clk'event and clk='1') then 
			send <= '0';
			if (go = '1') then 
				send <= '1'; 
				out_addr <= start_addr;
				sig_int <= '1';
				count<= count + '1';
			elsif (sig_int = '1') then 
				if wr_en ='1' then
					count<= count + '1';
					if count >= (size) then
						done <= '1';
					end if;
				elsif count >=(size) then
						done <= '1';
				end if;
			end if;	
		end if;
	end process;
end behavioral;