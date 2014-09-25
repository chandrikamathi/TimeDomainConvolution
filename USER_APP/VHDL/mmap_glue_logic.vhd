-- Greg Stitt
-- University of Florida

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.user_pkg.all;
use work.mem_pkg.all;


entity mmap is
  port (
    clk      : in  std_logic;
    rst      : in  std_logic;
    addr     : in  std_logic_vector(31 downto 0);
    en       : in  std_logic;
    wen      : in  std_logic;
    data_in  : in  std_logic_vector(31 downto 0);
    data_out : out std_logic_vector(31 downto 0);

    -- circuit-specific signals
    go           : out std_logic;
    size         : out std_logic_vector(SIZE_RANGE);
    inStartAddr  : out std_logic_vector(SRAM_ADDR_RANGE);
    outStartAddr : out std_logic_vector(SRAM_ADDR_RANGE);
    kernelData   : out std_logic_vector(DATA_RANGE);
    kernelLoad   : out std_logic;
    done         : in  std_logic
    );
end mmap;

architecture BHV of mmap is
  signal regGo           : std_logic;
  signal regSize         : std_logic_vector(SIZE_RANGE);
  signal regInStartAddr  : std_logic_vector(SRAM_ADDR_RANGE);
  signal regOutStartAddr : std_logic_vector(SRAM_ADDR_RANGE);
  signal regKernelData   : std_logic_vector(DATA_RANGE);

begin

  process (clk, rst)
  begin
    if (rst = '1') then
      regGo           <= '0';
      regSize         <= (others => '0');
      regInStartAddr  <= (others => '0');
      regOutStartAddr <= (others => '0');
      regKernelData   <= (others => '0');
      kernelLoad      <= '0';
      data_out        <= (others => '0');
    elsif (clk'event and clk = '1') then

      regGo      <= '0';
      kernelLoad <= '0';

      -- writes
      if (en = '1' and wen = '1') then

        if (addr >= RA_KERNEL ) then
            regKernelData   <= data_in(regKernelData'range);
            kernelLoad      <= '1';
        end if;
        
        case addr is
          when RA_GO             =>
            regGo           <= data_in(0);
          when RA_SIZE           =>
            regSize         <= data_in(regSize'range);
          when RA_IN_START_ADDR  =>
            regInStartAddr  <= data_in(regInStartAddr'range);
          when RA_OUT_START_ADDR =>
            regOutStartAddr <= data_in(regOutStartAddr'range);
          when others            => null;
        end case;
      end if;

      -- reads
      if (en = '1' and wen = '0') then

        if (addr >= RA_KERNEL ) then
            data_out                        <= (others => '0');
            data_out(regKernelData'range)   <= regKernelData;
        end if;
        
        case addr is
          -- inputs
          when RA_GO                                   =>
            data_out                        <= (others => '0');
            data_out(0)                     <= regGo;
          when RA_SIZE                                 =>
            data_out                        <= (others => '0');
            data_out(regSize'range)         <= regSize;
          when RA_IN_START_ADDR                        =>
            data_out                        <= (others => '0');
            data_out(regInStartAddr'range)  <= regInStartAddr;
          when RA_OUT_START_ADDR                       =>
            data_out                        <= (others => '0');
            data_out(regOutStartAddr'range) <= regOutStartAddr;

            -- outputs            
          when RA_DONE             =>
            data_out    <= (others => '0');
            data_out(0) <= done;
          when others              => null;
        end case;
      end if;
    end if;
  end process;

  go           <= regGo;
  size         <= regSize;
  inStartAddr  <= regInStartAddr;
  outStartAddr <= regOutStartAddr;
  kernelData   <= regKernelData;

end BHV;
