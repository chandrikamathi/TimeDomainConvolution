----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:52:35 12/04/2013 
-- Design Name: 
-- Module Name:    clip_mul - Behavioral 
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

entity clip_mul is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           en : in  STD_LOGIC;
           input : in  STD_LOGIC_VECTOR (31 downto 0);
           output : out  STD_LOGIC_VECTOR (15 downto 0));
end clip_mul;

architecture Behavioral of clip_mul is

begin
process(clk,rst) 
variable temp:std_logic_Vector(31 downto 0);
begin
if(rst='1') then
	output<=(others=>'0');
elsif(clk'event and clk='1') then
		if(en='1') then
			temp:=input;
			if(temp(16)='1' or 
			temp(17)='1' or 
			temp(18)='1' or 
			temp(19)='1' or 
			temp(20)='1' or 
			temp(21)='1' or 
			temp(22)='1' or 
			temp(23)='1' or 
			temp(24)='1' or 
			temp(25)='1' or 
			temp(26)='1' or 
			temp(27)='1' or 
			temp(28)='1' or 
			temp(29)='1' or 
			temp(30)='1' or 
			temp(31)='1'  )then
						
				output <= "1111111111111111";
			else
				output<= std_logic_vector(temp(15 downto 0));
			end if;
		end if;
end if;
end process;

end Behavioral;

