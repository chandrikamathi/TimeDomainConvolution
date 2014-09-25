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

entity counter is
    Port ( clk : in  STD_LOGIC;
			  rst : in  STD_LOGIC; 
			  size : in  std_logic_vector(31 downto 0);
           rd_en : in  STD_LOGIC;
			  count_done : out  STD_LOGIC;           
			  valid : out std_logic;
			  count_start : in std_logic;
			  start_addr: in std_logic_vector(20 downto 0);
           out_addr : out std_logic_vector(20 downto 0);
			  rcv : in std_logic
           );
end counter;

architecture behavioral of counter is
signal count: std_logic_vector(31 downto 0):= (others =>'0');
signal sig_int : std_logic := '0';
begin
	process(clk,rst)
	begin
		if (rst = '1') then
			count_done<='0';
			valid <='0'; 
			out_addr <=(others =>'0' );
			count <=(others =>'0');
		elsif (clk'event and clk='1') then 
			valid <='0';
			if( count_start = '1') then 
				valid <='1'; 
				out_addr<=start_addr;
				sig_int<='1';
				count<= count + '1';
			elsif (sig_int = '1') then 
				if (rd_en ='1') then
					count<= count + '1';
					if (count >= size) then
						count_done <= '1';
					end if;
				elsif (count >= size) then
						count_done <= '1';
				end if;
			end if;	
		end if;
	end process;
end behavioral;