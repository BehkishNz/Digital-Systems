----------------------------------------------------------------------
-- begin uw-generated entity for gate shim 
----------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

use ieee.std_logic_1164.all;
entity carry is
  port (
      i_x  : in STD_LOGIC
    ; i_y  : in STD_LOGIC
    ; i_cin  : in STD_LOGIC
    ; o_cout  : out STD_LOGIC
  );
end entity;

----------------------------------------------------------------------
-- begin uw-generated architecture for gate shim
----------------------------------------------------------------------

architecture gate_shim of carry is
  signal VDD, VSS : std_logic; 
begin
  gate : entity work.carry_gate
    port map (
        i_x => i_x
      , i_y => i_y
      , i_cin => i_cin
      , o_cout => o_cout
    );
end architecture;

