library ieee;
use ieee.std_logic_1164.all;

entity sum is
       port ( i_a, i_b, i_cin : in std_logic;
              o_sum :       out std_logic
       );
end sum;

architecture main of sum is

signal sum : std_logic;
begin
  sum <= i_a xor i_b xor i_cin;
  o_sum <=sum;
end architecture;


-- question 1
  -- insert answer here
  -- we see 3 input pins 2 xor gates and an output pin
  -- input a and c being xored and the result being xored with b 
  -- and the final result is reflected in the out put port
