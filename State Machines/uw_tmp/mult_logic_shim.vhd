----------------------------------------------------------------------
-- begin uw-generated entity for logic shim 
----------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

use work.util.all;
use work.mult_pkg.all;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;
entity mult is
  port (
      clk  : in STD_LOGIC
    ; reset  : in STD_LOGIC
    ; i_valid  : in STD_LOGIC
    ; i_a  : in UNSIGNED (7 downto 0)
    ; i_b  : in UNSIGNED (7 downto 0)
    ; o_valid  : out STD_LOGIC
    ; o_z  : out UNSIGNED (7 downto 0)
    ; current_state  : out STD_LOGIC_VECTOR (1 downto 0)
  );
end entity;

----------------------------------------------------------------------
-- begin uw-generated architecture for logic shim
----------------------------------------------------------------------

architecture logic_shim of mult is
  signal VDD, VSS : std_logic; 
begin
  logic : entity work.mult_logic
    port map (
        clk => clk
      , reset => reset
      , i_valid => i_valid
      , i_a(7) => i_a(7)
      , i_a(6) => i_a(6)
      , i_a(5) => i_a(5)
      , i_a(4) => i_a(4)
      , i_a(3) => i_a(3)
      , i_a(2) => i_a(2)
      , i_a(1) => i_a(1)
      , i_a(0) => i_a(0)
      , i_b(7) => i_b(7)
      , i_b(6) => i_b(6)
      , i_b(5) => i_b(5)
      , i_b(4) => i_b(4)
      , i_b(3) => i_b(3)
      , i_b(2) => i_b(2)
      , i_b(1) => i_b(1)
      , i_b(0) => i_b(0)
      , o_valid => o_valid
      , o_z(7) => o_z(7)
      , o_z(6) => o_z(6)
      , o_z(5) => o_z(5)
      , o_z(4) => o_z(4)
      , o_z(3) => o_z(3)
      , o_z(2) => o_z(2)
      , o_z(1) => o_z(1)
      , o_z(0) => o_z(0)
      , current_state(1) => current_state(1)
      , current_state(0) => current_state(0)
    );
end architecture;

