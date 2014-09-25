-- Greg Stitt
-- University of Florida
--
-- File: sram_test.vhd
-- Entity: SRAM_TEST
--
-- Description: This entity functions like a SRAM for behavioral simulations.

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

-------------------------------------------------------------------------------


entity SRAM_TEST is

  generic(storage_size : integer := 10000;
          addr_width   : natural := 20;
          data_width   : natural := 64;
          is_input     : boolean := true);

  port(clk        : in  std_logic;
       rst        : in  std_logic;
       request    : in  std_logic;
       addr       : in  std_logic_vector (addr_width-1 downto 0);
       ld_n       : in  std_logic;
       rw_n       : in  std_logic;
       bw_n       : in  std_logic_vector(7 downto 0);
       wdata      : in  std_logic_vector (data_width-1 downto 0);
       rdata      : out std_logic_vector (data_width-1 downto 0);
       valid      : out std_logic;
       fifo_full  : out std_logic;
       fifo_empty : out std_logic;
       calibrated : out std_logic);
end SRAM_TEST;

-------------------------------------------------------------------------------

architecture BHV of SRAM_TEST is

  type RAM_TYPE is array (0 to storage_size-1) of
    std_logic_vector (data_width-1 downto 0);

  component DELAY
    generic(cycles :     natural;
            width  :     natural;
            init   :     std_logic);
    port( clk      : in  std_logic;
          rst      : in  std_logic;
          en       : in  std_logic;
          input    : in  std_logic_vector(width-1 downto 0);
          output   : out std_logic_vector(width-1 downto 0));
  end component;

  signal ram         : RAM_TYPE;
  signal valid_delay : std_logic_vector(0 downto 0);
  signal rdata_delay : std_logic_vector(data_width-1 downto 0);
  signal tmp_slv1    : std_logic_vector(0 downto 0);

   constant C_0 : std_logic := '0';
  constant C_1 : std_logic := '1';
  
begin

  process(clk, rst)
    variable count : integer := 0;
  begin

    if( rst = '1' ) then

      count := 0;

      for i in 0 to storage_size-1 loop

        if (is_input) then
          ram(i) <= conv_std_logic_vector(count, data_width/4) &
                    conv_std_logic_vector(count+1, data_width/4) &
                    conv_std_logic_vector(count+2, data_width/4) &
                    conv_std_logic_vector(count+3, data_width/4);

--          ram(i) <= conv_std_logic_vector(1, data_width/4) &
--                    conv_std_logic_vector(1, data_width/4) &
--                    conv_std_logic_vector(1, data_width/4) &
--                    conv_std_logic_vector(1, data_width/4);
        else
          ram(i) <= (others => '0');
        end if;


-- ram(i) <= conv_std_logic_vector(0, data_width);
        count := count + 4;
      end loop;

-- rdata <= (others => '0');
-- valid <= '0';
      fifo_full  <= '0';
      fifo_empty <= '1';
      calibrated <= '1';

      rdata_delay    <= (others => '0');
      valid_delay(0) <= '0';


    elsif( clk'event and clk = '1' ) then

-- rdata_delay <= (others => '0');
      valid_delay(0) <= '0';

      -- read
      if( ld_n = '0' and rw_n = '1' and request = '1' and
          conv_integer(addr) < storage_size ) then

        rdata_delay    <= ram( conv_integer( "0"&addr(addr_width-1 downto 1)) );
        valid_delay(0) <= '1';

        -- write (not accurate)
      elsif( ld_n = '0' and rw_n = '0' and request = '1' and
             conv_integer(addr) < storage_size ) then

        ram(conv_integer( "0"&addr(addr_width-1 downto 1))) <= wdata;
      end if;
    end if;
  end process;

-- process
-- begin

-- calibrated <= '0';
-- wait for 30 ns;
-- calibrated <= '1';
-- wait for 30 ns;

-- end process;

  U_IN_DATA_DELAY : delay
    generic map (
      cycles => 6,
      width  => data_width,
      init   => '0')
    port map (
      clk    => clk,
      rst    => rst,
      en     => C_1,
      input  => rdata_delay,
      output => rdata);

  U_IN_DATA_VALID : delay
    generic map (
      cycles => 6,
      width  => 1,
      init   => '0')
    port map (
      clk    => clk,
      rst    => rst,
      en     => C_1,
      input  => valid_delay,
      output => tmp_slv1);

  valid <= tmp_slv1(0);

end BHV;
