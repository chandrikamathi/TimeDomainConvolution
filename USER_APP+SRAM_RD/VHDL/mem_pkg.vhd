-- Greg Stitt
-- University of Florida

library ieee;
use ieee.std_logic_1164.all;

package mem_pkg is

  -- needed for memory write transfers. This is the max cycles between the last
  -- element in the transfer being read from the width fifo and written to
  -- memory.
  -- NOTE: If you are losing the last elements of a transfer, increase this.
  -- This could potentially happen at high clock frequencies.
  constant C_MAX_FIFO_DELAY : integer := 5;
    
  constant C_SRAM_ADDR_WIDTH : natural := 21;
  constant C_SRAM_DATA_WIDTH : natural := 64;
  constant C_SRAM_SIZE_WIDTH : natural := 22;
  constant C_SRAM_BW_WIDTH   : natural := 8;
-- constant C_SRAM_IN_SIZE_WIDTH : natural := C_SRAM_ADDR_WIDTH;
  -- constant C_SRAM_OUT_SIZE_WIDTH     : natural := C_SRAM_ADDR_WIDTH;

  constant C_SDRAM_ADDR_WIDTH  : natural := 36;
  constant C_SDRAM_DATA_WIDTH  : natural := 128;
  constant C_SDRAM_MASK_WIDTH  : natural := 16;
  constant C_SDRAM_COUNT_WIDTH : natural := 9;

  subtype SRAM_ADDR_RANGE is natural range C_SRAM_ADDR_WIDTH-1 downto 0;
  subtype SRAM_DATA_RANGE is natural range C_SRAM_DATA_WIDTH-1 downto 0;
  subtype SRAM_SIZE_RANGE is natural range C_SRAM_SIZE_WIDTH-1 downto 0;
  subtype SRAM_BW_RANGE is natural range C_SRAM_BW_WIDTH-1 downto 0;
  subtype SRAM_UPPER_WORD_RANGE is natural range C_SRAM_DATA_WIDTH-1 downto C_SRAM_DATA_WIDTH/2;
  subtype SRAM_LOWER_WORD_RANGE is natural range C_SRAM_DATA_WIDTH/2-1 downto 0;

  subtype SDRAM_ADDR_RANGE is natural range C_SDRAM_ADDR_WIDTH-1 downto 0;
  subtype SDRAM_DATA_RANGE is natural range C_SDRAM_DATA_WIDTH-1 downto 0;
  subtype SDRAM_MASK_RANGE is natural range C_SDRAM_MASK_WIDTH-1 downto 0;
  subtype SDRAM_COUNT_RANGE is natural range C_SDRAM_COUNT_WIDTH-1 downto 0;
  
  constant C_READ  : std_logic := '0';
  constant C_WRITE : std_logic := '1';

  function getSumSize(width1, width2 : positive)
    return positive;

end mem_pkg;

package body mem_pkg is

  function getSumSize(width1, width2 : positive)
    return positive is
    variable return_val              : positive;
  begin

    if (width1 > width2) then
      return_val := width1;
    elsif (width1 < width2) then
      return_val := width2;
    else
      return_val := width1;
    end if;

    return return_val;

  end getSumSize;

end mem_pkg;
