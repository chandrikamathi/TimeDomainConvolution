-- Greg Stitt
-- University of Florida

-- Entity: datapath

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.user_pkg.all;

entity datapath is
  generic (
    DATA_WIDTH : positive
    );
  port (
    clk       : in  std_logic;
    rst       : in  std_logic;
    en        : in  std_logic;
    clear     : in  std_logic;
    valid_in  : in  std_logic;
    valid_out : out std_logic;
    data_in   : in  std_logic_vector(DATA_WIDTH-1 downto 0);
    data_out  : out std_logic_vector(DATA_WIDTH-1 downto 0)
    );
end datapath;

architecture STR of datapath is

  signal rst_s : std_logic;
  
begin  -- STR

  rst_s <= rst or clear;

  -- signifies valid outputs
  U_DELAY1 : entity work.delay
    generic map (
      cycles => 1,
      width  => 1)
    port map (
      clk       => clk,
      rst       => rst_s,
      en        => en,
      input(0)  => valid_in,
      output(0) => valid_out);

  U_REG : entity work.reg
    generic map (
      width => DATA_WIDTH)
    port map (
      clk    => clk,
      rst    => rst_s,
      en     => en,
      input  => data_in,
      output => data_out);

end STR;
