-- Greg Stitt
-- University of Florida

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

package user_pkg is

  constant C_0 : std_logic := '0';
  constant C_1 : std_logic := '1';

  constant C_DATA_WIDTH : positive := 16;
  subtype DATA_RANGE is natural range C_DATA_WIDTH-1 downto 0;
  type data_array is array (integer range<>) of std_logic_vector(DATA_RANGE);

  constant C_DATAPATH_LATENCY : natural := 1;

  constant C_SIZE_WIDTH : positive := 32;
  subtype SIZE_RANGE is natural range C_SIZE_WIDTH-1 downto 0;

  -- internal register addresses (we keep them at 2MB)
  constant RA_GO             : std_logic_vector(31 downto 0) := X"00020000";
  constant RA_SIZE           : std_logic_vector(31 downto 0) := X"00020001";
  constant RA_IN_START_ADDR  : std_logic_vector(31 downto 0) := X"00020005";
  constant RA_OUT_START_ADDR : std_logic_vector(31 downto 0) := X"00020003";
  constant RA_DONE           : std_logic_vector(31 downto 0) := X"00020004";

  -- Computes ceil(log2(input)), with the exception that clog2(1) = 1 instead of 0
  -- (useful for getting minimum bits needed to index "input" number of distinct values, such as for addresses)
  function clog2(input : positive) return positive;
end package;

package body user_pkg is

  function clog2(input : positive) return positive is
    variable temp      : natural;
    variable logVal    : natural;
  begin
    -- handle special 1 case
    if (input = 1) then
      return 1;
    end if;

    temp     := input - 1;
    logVal   := 0;
    while (temp /= 0) loop
      temp   := temp / 2;
      logVal := logVal + 1;
    end loop;

    return logVal;
  end function;

end package body;
