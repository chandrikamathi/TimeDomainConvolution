-- File: user_app.vhd
-- Entity: user_app
--
-- Description: User application...

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.user_pkg.all;
use work.mem_pkg.all;

entity user_app is
  port(
    clk : in std_logic;
    rst : in std_logic;

    -- INTERNAL MEMORY PORT
    mmap_addr     : in  std_logic_vector(31 downto 0);
    mmap_en       : in  std_logic;
    mmap_wen      : in  std_logic;
    mmap_data_in  : in  std_logic_vector(31 downto 0);
    mmap_data_out : out std_logic_vector(31 downto 0);

    mem_in_read  : out std_logic;
    mem_in_clear : out std_logic;
    mem_in_go    : out std_logic;
    mem_in_valid : in  std_logic;
    mem_in_data  : in  std_logic_vector(DATA_RANGE);
    mem_in_addr  : out std_logic_vector(SRAM_ADDR_RANGE);
    mem_in_size  : out std_logic_vector(SIZE_RANGE);
    mem_in_done  : in  std_logic;

    mem_out_ready : in  std_logic;
    mem_out_clear : out std_logic;
    mem_out_go    : out std_logic;
    mem_out_valid : out std_logic;
    mem_out_data  : out std_logic_vector(DATA_RANGE);
    mem_out_addr  : out std_logic_vector(SRAM_ADDR_RANGE);
    mem_out_size  : out std_logic_vector(SIZE_RANGE);
    mem_out_done  : in  std_logic
    );
end entity;

architecture default of user_app is

  signal mmap_go             : std_logic;
  signal mmap_size           : std_logic_vector(SIZE_RANGE);
  signal mmap_in_start_addr  : std_logic_vector(SRAM_ADDR_RANGE);
  signal mmap_out_start_addr : std_logic_vector(SRAM_ADDR_RANGE);
  signal done                : std_logic;

  signal mem_out_valid_s : std_logic;
  signal stall, en       : std_logic;

  signal dp_clear : std_logic;
  
  signal k_Data : std_logic_vector(DATA_RANGE); 
  signal kb_dout,sb_dout : data_array (0 to 95);
  signal sb_full, sb_empty, sb_wr, sb_rd, kernelLoad ,valid_dp,mem_in_valid_delay: std_logic;
	
begin
	U_DELAY1 : entity work.delay
    generic map (
      cycles => 1,
      width  => 1)
    port map (
      clk       => clk,
      rst       => rst,
      en        => en,
      input(0)  => mem_in_valid,
      output(0) => mem_in_valid_delay);

  U_MMAP : entity work.mmap
    port map (
      clk => clk,
      rst => rst,

      addr     => mmap_addr,
      en       => mmap_en,
      wen      => mmap_wen,
      data_in  => mmap_data_in,
      data_out => mmap_data_out,

      go           => mmap_go,
      size         => mmap_size,
      inStartAddr  => mmap_in_start_addr,
      outStartAddr => mmap_out_start_addr,
		kernelData	 => k_Data,
		kernelLoad	 => kernelLoad,
      done         => done);

  -- stall whenever the datapath can't store results because the output memory
  -- isn't ready
  stall <= not mem_out_ready;

  -- enable the datapath when not stalled
  en <= not stall;

  U_CTRL : entity work.ctrl
    port map (clk            => clk,
              rst            => rst,
              go             => mmap_go,
              done           => done,
              dp_clear       => dp_clear,
              mem_in_done    => mem_in_done,
              mem_out_done   => mem_out_done,
              in_start_addr  => mmap_in_start_addr,
              out_start_addr => mmap_out_start_addr,

              mem_in_clear  => mem_in_clear,
              mem_in_go     => mem_in_go,
              mem_in_addr   => mem_in_addr,              
              mem_out_clear => mem_out_clear,
              mem_out_go    => mem_out_go,
              mem_out_addr  => mem_out_addr
              );

-- mem_in_addr <= mmap_in_start_addr;
-- mem_out_addr <= mmap_out_start_addr;
  mem_in_size  <=std_logic_vector(unsigned(mmap_size) + 190);
  mem_out_size <=std_logic_vector(unsigned(mmap_size) + 95);
  mem_in_read  <= mem_in_valid_delay and not sb_full;
	valid_dp<= mem_in_valid_delay and not stall and not sb_empty;
  U_DP : entity work.datapath
    generic map (
      DATA_WIDTH => C_DATA_WIDTH)
    port map (
      clk        => clk,
      rst        => rst,
      en         => en,
      clear      => dp_clear,
      valid_in   => valid_dp,
      valid_out  => mem_out_valid_s,
      signal_inputs  => sb_dout,
		kernel_inputs	=> kb_dout,
      data_out   => mem_out_data
      );
	


  mem_out_valid <= mem_out_valid_s and not stall;
  
  U_SGB : entity work.signal_buffer
	port map(
		clk => clk,
		rst => rst,
		--en => en,
		wr => sb_wr,
		clear => dp_clear,
		rd => sb_rd,
		full => sb_full,
		empty => sb_empty,
		validity=> mem_out_valid_s,
		data_input => mem_in_data,
		data_output => sb_dout);
		
--anytime sb not empty and datapath not stalled
sb_rd <= mem_in_valid_delay and not sb_empty and not stall;
sb_wr <= mem_in_valid_delay and not sb_full and not stall;
		
	U_KRB : entity work.kernel_buffer
	port map(
		clk => clk,
		rst => rst,
		--en => en,
		wr => kernelLoad,
		clear => dp_clear,
		rd => en,
		full => open,
		empty => open,
		data_input => k_Data,
		data_output => kb_dout);		

end architecture;
