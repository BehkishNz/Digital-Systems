------------------------------------------------------------------------
-- heating system testbench
------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.heat_pkg.all;

entity heatingsys_tb is
end entity;

architecture main of heatingsys_tb is

	signal i_cur_tempN     : signed(7 downto 0); -- current temp
    signal i_des_tempN       : signed(7 downto 0); -- desired temp
    signal i_resetN          : std_logic;          -- reset
    signal i_clockN          : std_logic;          -- clock
    signal o_heatmodeN       : std_logic_vector(1 downto 0)  ;          -- mode 

begin

	stateMachine : entity work.heatingsys(main)
	port map(
		i_cur_temp => i_cur_tempN,
		i_des_temp => i_des_tempN,
		i_reset => i_resetN,
		i_clock => i_clockN,
		o_heatmode => o_heatmodeN
	);
	
	test_clock : process
	begin
		wait for 1 ns;
		i_clockN <= '0';
		wait for 1 ns;
		i_clockN <= '1';
	end process;
	
	test_B : process
	begin
	i_resetN <= '0';
	
	-- test transition from OFF state to LOW state
	i_cur_tempN <= "00000000"; -- 0
	i_des_tempN <= "00000011"; --3
	-- we should go to low
	wait for 10 ns;
	
	-- test transition from low state to high state
	i_cur_tempN <= "00000011"; --3
	i_des_tempN <= "00001011"; --11
	-- we should go to high
	wait for 10 ns;
	
	-- test reset --> from high state to off state
	i_resetN <= '1';
	-- we should go to off
	wait for 10 ns;
	
	i_resetN <= '0';
	
	-- test transition from off state to high state
	i_cur_tempN <= "00000000"; --0
	i_des_tempN <= "00000110"; --6
	-- we should go to high
	wait for 10 ns;
	
	-- test transition from high state to low state
	i_cur_tempN <= "00000110"; --6
	i_des_tempN <= "00000010"; --2
	-- we should go to low
	wait for 10 ns;
	
	-- test transition from low state to off state
	i_cur_tempN <= "00000011"; --3
	i_des_tempN <= "00000000"; --0
	-- we should go to off
	wait for 10 ns;
	
	-- test reset --> from off state to off state
	i_resetN <= '1';
	-- we should stay at off
	wait for 10 ns;
	
	i_resetN <= '0';
	
	-- test transition from OFF state to LOW state
	i_cur_tempN <= "00000001"; -- 1
	i_des_tempN <= "00000101"; --5
	-- we should go to low
	wait for 10 ns;
	
	-- test reset --> from low state to off state
	i_resetN <= '1';
	-- we should go to off
	wait for 10 ns;
	
	i_resetN <= '0';
	
	
	end process;
	
end architecture;
