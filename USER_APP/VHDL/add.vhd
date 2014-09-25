----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:02:34 11/05/2013 
-- Design Name: 
-- Module Name:    add - Behavioral 
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
---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity add is
	port (
			input1 : in std_logic_vector(15 downto 0);
			input2 :	in std_logic_vector(15 downto 0);
			output :	out std_logic_vector(15 downto 0)
			);
end add;

architecture Behavioral of add is

begin
	process(input1,input2)
		variable temp : std_logic_vector(16 downto 0);
		begin
		temp:= std_logic_vector( resize(unsigned(input1),17)+ resize(unsigned(input2),17));
		
		if(temp(16)='1')then
			output <= "1111111111111111";
		else
			output<= std_logic_vector(temp(15 downto 0));
		end if;
		end process;

end Behavioral;

