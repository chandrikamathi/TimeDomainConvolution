----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:55:09 11/20/2013 
-- Design Name: 
-- Module Name:    add_gen - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
use work.mem_pkg.all;
use work.user_pkg.all;


---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity add_gen is
generic (addr_width    :     positive := C_SRAM_ADDR_WIDTH);

    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           stall_fifo : in  STD_LOGIC;
           start_addr : in  STD_LOGIC_VECTOR (addr_width-1 downto 0);
           --go : in  STD_LOGIC;
           stall : in  STD_LOGIC;
			  sram_request : out std_logic;
			  sram_ld_n : out std_logic;
			  sram_rw_n : out std_logic;
			  ag_valid : in std_logic;
			  done : in std_logic;
           sram_addr : out  STD_LOGIC_VECTOR (SRAM_ADDR_RANGE));
			  --addr_gen_running:out std_logic);
end add_gen;

architecture Behavioral of add_gen is


signal sram_ld_n_s,sram_request_s,sram_rw_n_s:std_logic;
signal x: std_logic;

signal start_addr_s: std_logic_vector(addr_width-1 downto 0);
signal temp : std_logic_vector (addr_width-1 downto 0);
begin

	process(clk,rst)	
	variable start:std_logic;
	begin
	
		if(rst = '1')then
			sram_request_s <= '0';
			sram_ld_n_s <= '1';
			sram_rw_n_s <= '1';
			start:='0';
			start_addr_s<=(others=>'0');
			x<='0';
			temp<=(others=>'0');
			
		elsif(clk'event and clk ='1')then			
				if(ag_valid='1') then					
					
					start:='1';
					--start_addr_s<=start_addr;
					
				else 
					start:='0';
				end if;
				if(start='1') then
					sram_request_s <= '1';
					sram_ld_n_s <= '0';
					sram_rw_n_s <= '1';
					temp<=start_addr;
					x<='1';
				end if;
				if(x='1') then
				if( stall_fifo = '0') then						
						if(done='0') then						
							temp <= std_logic_vector(unsigned(temp)+2);							
							sram_request_s <= '1';
							sram_ld_n_s <= '0';
							sram_rw_n_s <= '1';
						
						else							
							sram_request_s <= '0';
							sram_ld_n_s <= '1';
							sram_rw_n_s <= '1';
							temp<=(others=>'0');
						end if;
				else
							sram_request_s <= '0';
							sram_ld_n_s <= '1';
							sram_rw_n_s <= '1';
							temp<=temp;
					--sram_addr<=temp;
				end if;	
				end if;
			
		end if;
		
end process;
sram_addr<=temp;
sram_ld_n<=sram_ld_n_s;
sram_rw_n<=sram_rw_n_s;
sram_request<=sram_request_s;

end Behavioral;

