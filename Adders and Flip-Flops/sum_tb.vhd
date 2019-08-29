library ieee;
use ieee.std_logic_1164.all;

entity sum_tb is
end sum_tb;

architecture main of sum_tb is
  signal a, b, cin, the_sum  : std_logic;
begin
  
  uut : entity work.sum(main)
  port map (
    i_a   => a,
    i_b   => b,
    i_cin => cin,
    o_sum => the_sum
  );

  process
  begin
    -- --------------------
    a <= '0'; b <= '0'; cin <= '0';
    wait for 10 ns;
    -- --------------------
    a <= '1'; b <= '0'; cin <= '0';
    wait for 10 ns;
    -- --------------------
    a <= '0'; b <= '0'; cin <= '1';
    wait for 10 ns;
    -- --------------------
  end process;
  
end architecture;

-- question 2
-- for 30 ns
-- signal   | waveform description
-- a 		0 1 0 
-- b 		0 0 0 
-- cin 		0 0 1 
-- the_sum 	0 1 1 


-- question 3
-- for 100 ns
  --insert answer here
  -- from the simulation it seems 30 ns is like a period and it gets repeated after
  -- for instance the second 30 ns is the same as the first 30ns 
