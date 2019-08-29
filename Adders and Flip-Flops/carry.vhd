library ieee;
use ieee.std_logic_1164.all;

entity carry is
       port ( i_x, i_y, i_cin : in std_logic;
              o_cout :       out std_logic
       );
end carry;

architecture main of carry is
-- insert your code here 
signal result : std_logic;
begin
  result <= (i_x and i_y) or (i_x and i_cin) or (i_y and i_cin);
  o_cout <=result;
end architecture;


