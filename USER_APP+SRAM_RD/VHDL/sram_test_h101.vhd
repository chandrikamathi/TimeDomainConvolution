-- Greg Stitt
-- University of Florida
--
--
-- Description: This entity is the top level of an FPGA accelerator, which
-- combines the user app with an input memory heirarchy,
-- an output memory heirarchy

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use work.mem_pkg.all;
use work.user_pkg.all;

entity sram_test_h101 is
  port(
    clk : in std_logic;
    rst : in std_logic;

    -- Memory clocks
    sram0_clk : in std_logic;
    sram1_clk : in std_logic;

    -- memory map connections
    mmap_addr     : in  std_logic_vector(31 downto 0);
    mmap_en       : in  std_logic;
    mmap_wen      : in  std_logic;
    mmap_data_in  : in  std_logic_vector(31 downto 0);
    mmap_data_out : out std_logic_vector(31 downto 0);

    -- SRAM0
    sram0_request    : out std_logic;
    sram0_addr       : out std_logic_vector(C_SRAM_ADDR_WIDTH-1 downto 0);
    sram0_ld_n       : out std_logic;
    sram0_rw_n       : out std_logic;
    sram0_bw_n       : out std_logic_vector(C_SRAM_BW_WIDTH-1 downto 0);
    sram0_wdata      : out std_logic_vector(C_SRAM_DATA_WIDTH-1 downto 0);
    sram0_rdata      : in  std_logic_vector(C_SRAM_DATA_WIDTH-1 downto 0);
    sram0_valid      : in  std_logic;
    sram0_fifo_full  : in  std_logic;
    sram0_fifo_empty : in  std_logic;
    sram0_calibrated : in  std_logic;

    -- SRAM1
    sram1_request    : out std_logic;
    sram1_addr       : out std_logic_vector(C_SRAM_ADDR_WIDTH-1 downto 0);
    sram1_ld_n       : out std_logic;
    sram1_rw_n       : out std_logic;
    sram1_bw_n       : out std_logic_vector(C_SRAM_BW_WIDTH-1 downto 0);
    sram1_wdata      : out std_logic_vector(C_SRAM_DATA_WIDTH-1 downto 0);
    sram1_rdata      : in  std_logic_vector(C_SRAM_DATA_WIDTH-1 downto 0);
    sram1_valid      : in  std_logic;
    sram1_fifo_full  : in  std_logic;
    sram1_fifo_empty : in  std_logic;
    sram1_calibrated : in  std_logic
    );

  attribute dtinfo                  : string;
  attribute dtinfo of clk           : signal           is "clk1";
  attribute dtinfo of rst           : signal           is "reset";
  attribute dtinfo of sram0_clk     : signal     is "usergroup, SRAM0_CLK";
  attribute dtinfo of sram1_clk     : signal     is "usergroup, SRAM1_CLK";
  attribute dtinfo of mmap_addr     : signal     is "usergroup, MMAP";
  attribute dtinfo of sram0_request : signal is "usergroup, SRAM0";
  attribute dtinfo of sram1_request : signal is "usergroup, SRAM1";

end sram_test_h101;

architecture STR of sram_test_h101 is

  signal mem_in_read       : std_logic;
  signal mem_in_clear      : std_logic;
  signal mem_in_go         : std_logic;
  signal mem_in_valid      : std_logic;
  signal mem_in_data       : std_logic_vector(DATA_RANGE);
  signal mem_in_start_addr : std_logic_vector(SRAM_ADDR_RANGE);
  signal mem_in_size       : std_logic_vector(SIZE_RANGE);
  signal mem_in_done       : std_logic;

  signal mem_out_ready      : std_logic;
  signal mem_out_clear      : std_logic;
  signal mem_out_go         : std_logic;
  signal mem_out_valid      : std_logic;
  signal mem_out_data       : std_logic_vector(DATA_RANGE);
  signal mem_out_start_addr : std_logic_vector(SRAM_ADDR_RANGE);
  signal mem_out_size       : std_logic_vector(SIZE_RANGE);
  signal mem_out_done       : std_logic;

  -- DO NOT CHANGE if you are using the ngc files. If you are using your own
  -- sram_rd entity, then this isn't needed. Although you can try to make your
  -- implementation generic, I'll warn you that it is not trivial, so I'd
  -- recommend simply hardcoding the widths initially. There is a lot of extra
  -- code required to support any output width.
  
  component sram_rd
    generic (
      output_width  :     positive := 16;
      size_width    :     positive := 32;
      addr_width    :     positive := C_SRAM_ADDR_WIDTH);
    port(sram_clk   : in  std_logic;
         user_clk   : in  std_logic;
         rst        : in  std_logic;
         clear      : in  std_logic;
         go         : in  std_logic;
         rd_en      : in  std_logic;
         stall      : in  std_logic;
         start_addr : in  std_logic_vector(addr_width-1 downto 0);
         size       : in  std_logic_vector(size_width-1 downto 0);
         valid      : out std_logic;
         data       : out std_logic_vector(output_width-1 downto 0);
         done       : out std_logic;

         sram_request    : out std_logic;
         sram_addr       : out std_logic_vector(SRAM_ADDR_RANGE);
         sram_ld_n       : out std_logic;
         sram_rw_n       : out std_logic;
         sram_bw_n       : out std_logic_vector(SRAM_BW_RANGE);
         sram_wdata      : out std_logic_vector(SRAM_DATA_RANGE);
         sram_rdata      : in  std_logic_vector(SRAM_DATA_RANGE);
         sram_valid      : in  std_logic;
         sram_fifo_empty : in  std_logic;
         sram_calibrated : in  std_logic
         );
  end component;

  -- DO NOT CHANGE if you are using the ngc files. If you are using your own
  -- sram_wr entity, then this isn't needed. Although you can try to make your
  -- implementation generic, I'll warn you that it is not trivial, so I'd
  -- recommend simply hardcoding the widths initially. There is a lot of extra
  -- code required to support any input width.
  
  component sram_wr
    generic (
      input_width   :     positive := 16;
      size_width    :     positive := 32;
      addr_width    :     positive := C_SRAM_ADDR_WIDTH);
    port(sram_clk   : in  std_logic;
         user_clk   : in  std_logic;
         rst        : in  std_logic;
         clear      : in  std_logic;
         go         : in  std_logic;
         wr_en      : in  std_logic;
         start_addr : in  std_logic_vector(addr_width-1 downto 0);
         size       : in  std_logic_vector(size_width-1 downto 0);
         data       : in  std_logic_vector(input_width-1 downto 0);
         done       : out std_logic;
         ready      : out std_logic;

         sram_request    : out std_logic;
         sram_addr       : out std_logic_vector(SRAM_ADDR_RANGE);
         sram_ld_n       : out std_logic;
         sram_rw_n       : out std_logic;
         sram_bw_n       : out std_logic_vector(SRAM_BW_RANGE);
         sram_wdata      : out std_logic_vector(SRAM_DATA_RANGE);
         sram_fifo_full  : in  std_logic;
         sram_fifo_empty : in  std_logic;
         sram_calibrated : in  std_logic
         );
  end component;

begin

  U_USER_APP : entity work.user_app
    port map (
      clk => clk,
      rst => rst,

      mmap_addr     => mmap_addr,
      mmap_en       => mmap_en,
      mmap_wen      => mmap_wen,
      mmap_data_in  => mmap_data_in,
      mmap_data_out => mmap_data_out,

      mem_in_read  => mem_in_read,
      mem_in_clear => mem_in_clear,
      mem_in_go    => mem_in_go,
      mem_in_valid => mem_in_valid,
      mem_in_data  => mem_in_data,
      mem_in_addr  => mem_in_start_addr,
      mem_in_size  => mem_in_size,
      mem_in_done  => mem_in_done,

      mem_out_ready => mem_out_ready,
      mem_out_clear => mem_out_clear,
      mem_out_go    => mem_out_go,
      mem_out_valid => mem_out_valid,
      mem_out_data  => mem_out_data,
      mem_out_addr  => mem_out_start_addr,
      mem_out_size  => mem_out_size,
      mem_out_done  => mem_out_done
      );

  -- if you using the ngc files, do not change this.
  U_SRAM_RD : sram_rd
    port map (
      sram_clk     => sram0_clk,
      user_clk     => clk,
      rst          => rst,
      clear        => mem_in_clear,
      go           => mem_in_go,
      rd_en        => mem_in_read,
      stall        => C_0,
      start_addr   => mem_in_start_addr,
      size         => mem_in_size,
      valid        => mem_in_valid,
      data         => mem_in_data,
      done         => mem_in_done,

      sram_request    => sram0_request,
      sram_addr       => sram0_addr,
      sram_ld_n       => sram0_ld_n,
      sram_rw_n       => sram0_rw_n,
      sram_bw_n       => sram0_bw_n,
      sram_wdata      => sram0_wdata,
      sram_rdata      => sram0_rdata,
      sram_valid      => sram0_valid,
      sram_fifo_empty => sram0_fifo_empty,
      sram_calibrated => sram0_calibrated);
  
  -- if you using the ngc files, do not change this.
  U_SRAM_WR : sram_wr
    port map (
      sram_clk    => sram1_clk,
      user_clk    => clk,
      rst         => rst,
      clear       => mem_out_clear,
      go          => mem_out_go,
      wr_en       => mem_out_valid,
      start_addr  => mem_out_start_addr,
      size        => mem_out_size,
      data        => mem_out_data,
      done        => mem_out_done,
      ready       => mem_out_ready,

      sram_request    => sram1_request,
      sram_addr       => sram1_addr,
      sram_ld_n       => sram1_ld_n,
      sram_rw_n       => sram1_rw_n,
      sram_bw_n       => sram1_bw_n,
      sram_wdata      => sram1_wdata,
      sram_fifo_full  => sram1_fifo_full,
      sram_fifo_empty => sram1_fifo_empty,
      sram_calibrated => sram1_calibrated);

end STR;
