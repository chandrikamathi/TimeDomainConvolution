-- Greg Stitt
-- University of Florida
--
-- File: accelerator_tb.vhd
-- Entity: ACCELERATOR_TB
--
-- Description: This is a simple testbench for the main entity
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;
use WORK.mem_pkg.all;
use work.user_pkg.all;

entity sram_test_tb is
end sram_test_tb;

architecture BHV of sram_test_tb is

  signal clk : std_logic := '0';
  signal rst : std_logic := '1';
  signal rst_mem : std_logic := '1';
  
  -- Memory clocks
  signal sram0_clk : std_logic := '0';
  signal sram1_clk : std_logic := '0';

  -- memory map connections
  signal mmap_addr     : std_logic_vector(31 downto 0);
  signal mmap_en       : std_logic;
  signal mmap_wen      : std_logic;
  signal mmap_data_in  : std_logic_vector(31 downto 0);
  signal mmap_data_out : std_logic_vector(31 downto 0);

  -- SRAM0
  signal sram0_request    : std_logic;
  signal sram0_addr       : std_logic_vector(SRAM_ADDR_RANGE);
  signal sram0_ld_n       : std_logic;
  signal sram0_rw_n       : std_logic;
  signal sram0_bw_n       : std_logic_vector(SRAM_BW_RANGE);
  signal sram0_wdata      : std_logic_vector(SRAM_DATA_RANGE);
  signal sram0_rdata      : std_logic_vector(SRAM_DATA_RANGE);
  signal sram0_valid      : std_logic;
  signal sram0_fifo_full  : std_logic;
  signal sram0_fifo_empty : std_logic;
  signal sram0_calibrated : std_logic;

  -- SRAM1
  signal sram1_request    : std_logic;
  signal sram1_addr       : std_logic_vector(SRAM_ADDR_RANGE);
  signal sram1_ld_n       : std_logic;
  signal sram1_rw_n       : std_logic;
  signal sram1_bw_n       : std_logic_vector(SRAM_BW_RANGE);
  signal sram1_wdata      : std_logic_vector(SRAM_DATA_RANGE);
  signal sram1_rdata      : std_logic_vector(SRAM_DATA_RANGE);
  signal sram1_valid      : std_logic;
  signal sram1_fifo_full  : std_logic;
  signal sram1_fifo_empty : std_logic;
  signal sram1_calibrated : std_logic;

begin

  uut : entity work.sram_test_h101
    port map (

      clk => clk,
      rst => rst,

      -- Memory clocks
      sram0_clk => sram0_clk,
      sram1_clk => sram1_clk,

      -- memory map connections
      mmap_addr     => mmap_addr,
      mmap_en       => mmap_en,
      mmap_wen      => mmap_wen,
      mmap_data_in  => mmap_data_in,
      mmap_data_out => mmap_data_out,

      -- SRAM0
      sram0_request    => sram0_request,
      sram0_addr       => sram0_addr,
      sram0_ld_n       => sram0_ld_n,
      sram0_rw_n       => sram0_rw_n,
      sram0_bw_n       => sram0_bw_n,
      sram0_wdata      => sram0_wdata,
      sram0_rdata      => sram0_rdata,
      sram0_valid      => sram0_valid,
      sram0_fifo_full  => sram0_fifo_full,
      sram0_fifo_empty => sram0_fifo_empty,
      sram0_calibrated => sram0_calibrated,

      -- SRAM1
      sram1_request    => sram1_request,
      sram1_addr       => sram1_addr,
      sram1_ld_n       => sram1_ld_n,
      sram1_rw_n       => sram1_rw_n,
      sram1_bw_n       => sram1_bw_n,
      sram1_wdata      => sram1_wdata,
      sram1_rdata      => sram1_rdata,
      sram1_valid      => sram1_valid,
      sram1_fifo_full  => sram1_fifo_full,
      sram1_fifo_empty => sram1_fifo_empty,
      sram1_calibrated => sram1_calibrated);

  U_SRAMIN : entity work.sram_test
    generic map (
      storage_size => 50,
      addr_width   => C_SRAM_ADDR_WIDTH,
      data_width   => C_SRAM_DATA_WIDTH,
      is_input     => true)
    port map (
      clk        => sram0_clk,
      rst        => rst_mem,
      request    => sram0_request,
      addr       => sram0_addr,
      ld_n       => sram0_ld_n,
      rw_n       => sram0_rw_n,
      bw_n       => sram0_bw_n,
      wdata      => sram0_wdata,
      rdata      => sram0_rdata,
      valid      => sram0_valid,
      fifo_full  => sram0_fifo_full,
      fifo_empty => sram0_fifo_empty,
      calibrated => sram0_calibrated);

  U_SRAMOUT : entity work.sram_test
    generic map (
      storage_size => 50,
      addr_width   => C_SRAM_ADDR_WIDTH,
      data_width   => C_SRAM_DATA_WIDTH,
      is_input     => false)
    port map (
      clk        => sram1_clk,
      rst        => rst_mem,
      request    => sram1_request,
      addr       => sram1_addr,
      ld_n       => sram1_ld_n,
      rw_n       => sram1_rw_n,
      bw_n       => sram1_bw_n,
      wdata      => sram1_wdata,
      rdata      => sram1_rdata,
      valid      => sram1_valid,
      fifo_full  => sram1_fifo_full,
      fifo_empty => sram1_fifo_empty,
      calibrated => sram1_calibrated);

  clk       <= not clk       after 5 ns;
  sram0_clk <= not sram0_clk after 2.5 ns;
  sram1_clk <= not sram1_clk after 2.5 ns;

  -- process to test different inputs
  process
  begin

    mmap_en      <= '0';
    mmap_wen     <= '0';
    mmap_addr    <= (others => '0');
    mmap_data_in <= (others => '0');

    -- reset circuit

    rst     <= '1';
    rst_mem <= '1';
    wait for 100 ns;
    wait until clk'event and clk = '1';

    rst_mem <= '0';
    rst     <= '0';
    wait until clk'event and clk = '1';

    -- write the size to the memory map
    mmap_addr    <= RA_SIZE;
    mmap_en      <= '1';
    mmap_wen     <= '1';
    mmap_data_in <= std_logic_vector(to_unsigned(6, 32));
    wait until clk'event and clk = '1';

    -- write the size to the memory map
    mmap_addr    <= RA_IN_START_ADDR;
    mmap_en      <= '1';
    mmap_wen     <= '1';
    mmap_data_in <= std_logic_vector(to_unsigned(0, 32));
    wait until clk'event and clk = '1';

    -- write the in start addr to the memory map
    mmap_addr    <= RA_IN_START_ADDR;
    mmap_en      <= '1';
    mmap_wen     <= '1';
    mmap_data_in <= std_logic_vector(to_unsigned(0, 32));   
    wait until clk'event and clk = '1';

    -- write the in start addr to the memory map
    mmap_addr    <= RA_OUT_START_ADDR;
    mmap_en      <= '1';
    mmap_wen     <= '1';
    mmap_data_in <= std_logic_vector(to_unsigned(0, 32));   
    wait until clk'event and clk = '1';

    mmap_en  <= '0';
    mmap_wen <= '0';
    wait until clk'event and clk = '1';

    -- assert go with the memory map
    mmap_addr    <= RA_GO;
    mmap_en      <= '1';
    mmap_wen     <= '1';
    mmap_data_in <= std_logic_vector(to_unsigned(1, 32));
    wait until clk'event and clk = '1';

    mmap_en  <= '0';
    mmap_wen <= '0';
    wait until clk'event and clk = '1';

    wait;
  end process;


end BHV;
