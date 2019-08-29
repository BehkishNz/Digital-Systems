library ieee;
use ieee.std_logic_1164.all;

package mult_pkg is
  subtype mult_ty is std_logic_vector(1 downto 0);
  constant waiting  : mult_ty := "00";
  constant computing  : mult_ty := "01";
  constant done : mult_ty := "11";
end mult_pkg;


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.mult_pkg.all;

use work.util.all;

entity mult is
  port ( clk, reset, i_valid : in std_logic; -- i valid acts like start 
         i_a, i_b : in unsigned( 7 downto 0 );
         o_valid : out std_logic; -- o-valid acts like done
         o_z : out unsigned( 7 downto 0 ) ;
		 current_state       : out mult_ty :=waiting           -- mode
		 
       );
end entity;

architecture main of mult is
  -- for full implementation, change the array bounds
  signal v    : std_logic_vector( 0 to 0 );
  signal a, b, z : unsigned( 7 downto 0 ) := "00000000";
  signal next_state : mult_ty := waiting;

begin
--direct wire connections, happening all the time
  v(0) <= i_valid;
  o_z <= z;
  process
  begin
  wait until rising_edge(clk);
  if(reset = '1') then 
	next_state <= waiting; 
	current_state <= next_state;
  else
	current_state <= next_state;
	if(current_state = waiting) then
		if v(0) = '1' then
			a <= i_a;
			b <= i_b;
			o_valid <= '0';
			z <= to_unsigned(0,8);
			next_state <= computing;
		else
			next_state <= waiting;
		end if;
	elsif(current_state = computing)then
		if(a > to_unsigned(0, 8))then
			if(a(0) = '1')then
				z <= z + unsigned(b);
			end if;
			a <= a srl 1;
			b <= b sll 1;
			next_state <=computing;
		else
			next_state <= done;
		end if;
	elsif(current_state = done)	then
		o_valid <= '1';
		next_state <= waiting;
	else
	next_state <= waiting;
	
	end if;
  end if;
  end process;
end architecture;

