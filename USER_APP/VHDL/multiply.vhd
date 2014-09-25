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
	port(	
			input1	:	in std_logic_vector(15 downto 0);
			input2	:	in std_logic_vector(15 downto 0);
			output	:	out std_logic_vector(15 downto 0)
			);
end multiply;

architecture Behavioral of multiply is
	
begin
		process(input1,input2)
		variable temp : std_logic_vector(31 downto 0);
		begin
		temp:= std_logic_vector( unsigned(input1)*unsigned(input2));
		--output<=std_logic_vector(unsigned(input1)*unsigned(input2));
		if(temp>"1111111111111111")then
			output <= "1111111111111111";
		else
			output<= std_logic_vector(temp(15 downto 0));
		end if;
		end process;

end Behavioral;

