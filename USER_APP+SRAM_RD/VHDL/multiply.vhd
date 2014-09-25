----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:07:46 11/01/2013 
-- Design Name: 
-- Module Name:    multiply - Behavioral 
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
--use work.user_pkg_1.all;
---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity multiply is
	port(	clk	: in std_logic;
			rst	: in std_logic;
			en: in std_logic;
			input1	:	in std_logic_vector(15 downto 0);
			input2	:	in std_logic_vector(15 downto 0);
			output	:	out std_logic_vector(31 downto 0)
			);
end multiply;

architecture Behavioral of multiply is
begin
		process(clk,rst)
		begin
		if(rst='1') then
			output<=(others=>'0');
		elsif(clk'event and clk='1') then	
			if(en='1') then
				output<=std_logic_vector(unsigned(input1)*unsigned(input2));
			end if;
		end if;
		end process;
		

end Behavioral;

