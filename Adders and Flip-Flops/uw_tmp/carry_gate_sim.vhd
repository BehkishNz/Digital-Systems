
-- 
-- Definition of  carry
-- 
--      Tue May 16 13:00:39 2017
--      
--      Precision RTL Synthesis, 64-bit 2015.2.16
-- 

--
-- Please compile Mgc_home/pkgs/psr/modgen/modgen_sim.vhd file into
-- "modgen_sim" library, during the simulation run for this netlist
--
library IEEE;library altera_mf;library lpm;library altera; 
 use IEEE.STD_LOGIC_1164.ALL;
 use altera_mf.altera_mf_components.all, lpm.lpm_components.all, altera.altera_primitives_components.all;

entity carry_gate is 
   port (
      i_x : IN std_logic ;
      i_y : IN std_logic ;
      i_cin : IN std_logic ;
      o_cout : OUT std_logic) ;
end carry_gate ;

architecture main of carry_gate is 
   signal result_0n0s3, result_0n0s4, result_0n0s2, result_0n0s5: std_logic
    ;

begin
   o_cout <= result_0n0s2 OR result_0n0s5 ;
   result_0n0s2 <= result_0n0s3 OR result_0n0s4 ;
   result_0n0s3 <= i_x AND i_y ;
   result_0n0s4 <= i_x AND i_cin ;
   result_0n0s5 <= i_y AND i_cin ;
end main ;

