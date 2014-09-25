-- Greg Stitt
-- University of Florida

-- Entity: datapath

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.user_pkg.all;

entity datapath is
  generic( DATA_WIDTH : natural :=16);
  port (
    clk       : in  std_logic;
    rst       : in  std_logic;
    en        : in  std_logic;
    clear     : in  std_logic;
    valid_in  : in  std_logic;
    valid_out : out std_logic;
	 signal_inputs	:	in data_array(0 to 95);
	 kernel_inputs	:	in data_array(0 to 95);
    data_out  : out std_logic_vector(DATA_WIDTH-1 downto 0)
    );
end datapath;

architecture STR of datapath is
	
	signal mult_out: data_array(0 to 95);
	signal regs_mult:data_array(0 to 95);
	
	signal add_out1:data_array(0 to 47);
	signal regs_add1:data_array(0 to 47);
	--signal reg1: reg1_array;
	

	signal add_out2:data_array(0 to 23);
	signal regs_add2:data_array(0 to 23); 
	--signal reg2: reg1_array;
	

	signal add_out3:data_array(0 to 11);
	signal regs_add3:data_array(0 to 11);
	--signal reg3: reg1_array;
	
	

	signal add_out4:data_array(0 to 5);
	signal regs_add4:data_array(0 to 5);
	--signal reg4: reg1_array;
	

	signal add_out5:data_array(0 to 2);
	signal regs_add5:data_array(0 to 2);
	--signal reg5: reg1_array;
	
	signal add_out6: std_logic_vector(15 downto 0);
	signal add_out7: std_logic_vector(15 downto 0);
	
	signal regs_add6,regs_missed: std_logic_vector(15 downto 0);
	--signal regs_add7: std_logic_vector(15 downto 0);
	
	--signal reg6,reg7,reg8 : std_logic;
	signal reg_valid1,reg_valid2,reg_valid3,reg_valid4,reg_valid5,reg_valid6,reg_valid7: std_logic_vector(0 downto 0);

  signal rst_s : std_logic;
  
begin  -- STR

  rst_s <= rst or clear;

  -- signifies valid outputs
  U_DELAY1 : entity work.delay
    generic map (
      cycles => 8,
      width  => 1)
    port map (
      clk       => clk,
      rst       => rst_s,
      en        => en,
      input(0)  => valid_in,
      output(0) => valid_out);
--first level of multiplication	

U_level1:	for i in 0 to 95 generate
	U_mult:	entity work.multiply
				port map(
							input1=>signal_inputs(i),
							input2=>kernel_inputs(i),
							output=>mult_out(i)
							);
	U_Reg1:	entity work.reg
				generic map (width  => 16)
				port map(
							clk=>clk,
							rst=>rst_s,
							en=>en,
							input=>mult_out(i),
							output=>regs_mult(i)
							--valid_out=>reg1(i)
							);
end generate U_level1;
	
 --first level of addition

U_level2: for i in 0 to 47 generate
	U_add1:	entity work.add
				port map(
							input1=>regs_mult(i*2),
							input2=>regs_mult(i*2+1),
							output=>add_out1(i)
							);
	U_reg2: entity work.reg
				generic map(width=> 16)
				port map(
							clk=>clk,
							rst=>rst_s,
							en=> en,
							input=>add_out1(i),
							output=>regs_add1(i)
							--valid_out=>reg2
							);
							
end generate U_level2;

--second level of addition

U_level3: for i in 0 to 23 generate
	U_add2:	entity work.add
				port map(
							input1=>regs_add1(i*2),
							input2=>regs_add1(i*2+1),
							output=>add_out2(i)
							);
	U_reg3: entity work.reg
				generic map(width=> 16)
				port map(
							clk=>clk,
							rst=>rst_s,
							en=>en,
							input=>add_out2(i),
							output=>regs_add2(i)
							--valid_out=>reg3(i)
							);
							
end generate U_level3;



--third level of addition

U_level4: for i in 0 to 11 generate
	U_add3:	entity work.add
				port map(
							input1=>regs_add2(i*2),
							input2=>regs_add2(i*2+1),
							output=>add_out3(i)
							);
	U_reg4: entity work.reg
				generic map(width=> 16)
				port map(
							clk=>clk,
							rst=>rst_s,
							en=>en,
							input=>add_out3(i),
							output=>regs_add3(i)
							--valid_out=>reg4(i)
							);
							
end generate U_level4;


--fourth level

U_level5: for i in 0 to 5 generate
	U_add4:	entity work.add
				port map(
							input1=>regs_add3(i*2),
							input2=>regs_add3(i*2+1),
							output=>add_out4(i)
							);
	U_reg5: entity work.reg
				generic map(width=> 16)
				port map(
							clk=>clk,
							rst=>rst_s,
							en=>en,
							input=>add_out4(i),
							output=>regs_add4(i)
							--valid_out=>reg5(i)
							);
							
end generate U_level5;


--sixth level

U_level6: for i in 0 to 2 generate
	U_add5:	entity work.add
				port map(
							input1=>regs_add4(i*2),
							input2=>regs_add4(i*2+1),
							output=>add_out5(i)
							);
	U_reg6: entity work.reg
				generic map(width=> 16)
				port map(
							clk=>clk,
							rst=>rst_s,
							en=>en,
							input=>add_out5(i),
							output=>regs_add5(i)
							--valid_out=>reg6(i)
							);
							
end generate U_level6;


----seventh level


	U_add6:	entity work.add
				port map(
							input1=> regs_add5(0),
							input2=>regs_add5(1),
							output=>add_out6
							);
	U_reg7: entity work.reg
				generic map(width=> 16)
				port map(
							clk=>clk,
							rst=>rst_s,
							en=>en,
							input=>add_out6,
							output=>regs_add6
							--valid_out=>reg7
							);
	
	
	U_reg_missed: entity work.reg
					generic map(width=> 16)
					port map(
								clk=>clk,
								rst=>rst_s,
								en=>en,
								input=>regs_add5(2),
								output=>regs_missed
								);
	U_add7:	entity work.add
				port map(
							input1=> regs_add6,
							input2=>regs_missed,
							output=>add_out7
							);
	U_reg8: entity work.reg
				generic map(width=> 16)
				port map(
							clk=>clk,
							rst=>rst_s,
							en=>en,
							input=>add_out7,
							output=>data_out
							--valid_out=>reg8
							);


end STR;

