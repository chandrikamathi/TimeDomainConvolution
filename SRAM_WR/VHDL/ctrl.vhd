-- Greg Stitt
-- University of Florida

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;
use work.mem_pkg.all;

entity ctrl is
  port(clk            : in  std_logic;
       rst            : in  std_logic;
       go             : in  std_logic;
       done           : out std_logic;
       dp_clear       : out std_logic;
       mem_in_done    : in  std_logic;
       mem_out_done   : in  std_logic;
       in_start_addr  : in  std_logic_vector(SRAM_ADDR_RANGE);
       out_start_addr : in  std_logic_vector(SRAM_ADDR_RANGE);

       mem_in_clear  : out std_logic;
       mem_in_go     : out std_logic;
       mem_in_addr   : out std_logic_vector(SRAM_ADDR_RANGE);
       mem_out_clear : out std_logic;
       mem_out_go    : out std_logic;
       mem_out_addr  : out std_logic_vector(SRAM_ADDR_RANGE)
       );
end ctrl;

architecture bhv of ctrl is

  type state_type is (S_START, S_WAIT_1, S_WAIT_FOR_DP_DONE, S_DONE);
  signal state : state_type;

begin

  process(clk, rst)
  begin

    if (rst = '1') then

      done          <= '0';
      mem_in_clear  <= '0';
      mem_in_go     <= '0';
      mem_in_addr   <= (others => '0');
      mem_out_clear <= '0';
      mem_out_go    <= '0';
      mem_out_addr  <= (others => '0');
      dp_clear      <= '1';
      state         <= S_START;

    elsif (clk = '1' and clk'event) then

      mem_in_clear  <= '0';
      mem_in_go     <= '0';
      mem_out_clear <= '0';
      mem_out_go    <= '0';
      dp_clear      <= '0';

      case state is
        when S_START =>

          done          <= '0';
          mem_in_clear  <= '1';
          mem_out_clear <= '1';
          dp_clear      <= '1';

          if (go = '0') then
            state <= S_WAIT_1;
          end if;

        when S_WAIT_1 =>

          if (go = '1') then
            mem_in_go    <= '1';
            mem_in_addr  <= in_start_addr;
            mem_out_go   <= '1';
            mem_out_addr <= out_start_addr;
            state        <= S_WAIT_FOR_DP_DONE;
          end if;

        when S_WAIT_FOR_DP_DONE =>

          done <= '0';

          -- don't need to check mem_in_done, but this gets rid of annoying
          -- warnings 
          if (mem_in_done = '1' and mem_out_done = '1') then
            state <= S_DONE;
          end if;

        when S_DONE =>

          done          <= '1';
          mem_in_clear  <= '1';
          mem_out_clear <= '1';

          -- clear the datapath in case any valid data is left over
          -- This doesn't need to occur for this example, but is necessary
          -- when using buffers inside the datapath.
          dp_clear <= '1';

          if (go = '0') then
            state <= S_WAIT_1;
          end if;

        when others => null;
      end case;
    end if;
  end process;
end bhv;
