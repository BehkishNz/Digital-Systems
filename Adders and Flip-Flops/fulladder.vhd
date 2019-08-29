  library ieee;
use ieee.std_logic_1164.all;

entity fulladder is
  port ( i_a, i_b, i_cin     : in  std_logic;
         o_sum, o_cout : out std_logic
  );
end fulladder;

architecture main of fulladder  is
begin
  -- sum instantiation
  u_sum : entity work.sum(main)
    port map (
      i_a   => i_a,
      i_b   => i_b,
      i_cin => i_cin,
      o_sum => o_sum
    );
         
  u_carry : entity work.carry(main)
  port map (
  --this is porting the signals in the carry module
  -- to the signals defined here
  --rhs is signals defined in THIS file
  --lhs is signals in the module we are importing
	i_x => i_a,
	i_y => i_b,
	i_cin => i_cin,
	o_cout => o_cout
  );

end architecture;
