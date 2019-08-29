
-- 
-- Definition of  mult
-- 
--      Thu Jun  1 19:50:39 2017
--      
--      Precision RTL Synthesis, 64-bit 2015.2.16
-- 

library IEEE;library altera_mf;library lpm;library altera;
 use IEEE.STD_LOGIC_1164.ALL;
 use altera_mf.altera_mf_components.all, lpm.lpm_components.all, altera.altera_primitives_components.all;
-- Library use clause for technology cells
library fiftyfivenm ;
use fiftyfivenm.fiftyfivenm_components.all;

entity mult_logic is 
   port (
      clk : IN std_logic ;
      reset : IN std_logic ;
      i_valid : IN std_logic ;
      i_a : IN std_logic_vector (7 DOWNTO 0) ;
      i_b : IN std_logic_vector (7 DOWNTO 0) ;
      o_valid : OUT std_logic ;
      o_z : OUT std_logic_vector (7 DOWNTO 0) ;
      current_state : OUT std_logic_vector (1 DOWNTO 0)) ;
end mult_logic ;

architecture main of mult_logic is 
   signal o_valid_EXMPLR34: std_logic ;
   
   signal o_z_EXMPLR48: std_logic_vector (7 DOWNTO 0) ;
   
   signal current_state_EXMPLR49: std_logic_vector (1 DOWNTO 0) ;
   
   signal a: std_logic_vector (7 DOWNTO 0) ;
   
   signal b: std_logic_vector (7 DOWNTO 0) ;
   
   signal next_state: std_logic_vector (1 DOWNTO 0) ;
   
   signal z_0n2s1: std_logic_vector (7 DOWNTO 0) ;
   
   signal nx21211z1, nx13177z1, nx17971z1, nx1640z1, nx32748z1, nx16457z1, 
      nx32031z1, PWR, GND_EXMPLR45: std_logic ;
   
   signal a_0n4ss1: std_logic_vector (6 DOWNTO 0) ;
   
   signal b_0n4ss1: std_logic_vector (7 DOWNTO 1) ;
   
   signal nx61882z2, nx47018z1, NOT_current_state_0, nx61882z1, nx19052z1, 
      nx55043z1, nx54046z1, nx60567z1, nx61882z5, nx60567z2, nx61882z4, 
      nx54046z2, nx61882z3, nx54046z3: std_logic ;

begin
   o_valid <= o_valid_EXMPLR34 ;
   o_z(7) <= o_z_EXMPLR48(7) ;
   o_z(6) <= o_z_EXMPLR48(6) ;
   o_z(5) <= o_z_EXMPLR48(5) ;
   o_z(4) <= o_z_EXMPLR48(4) ;
   o_z(3) <= o_z_EXMPLR48(3) ;
   o_z(2) <= o_z_EXMPLR48(2) ;
   o_z(1) <= o_z_EXMPLR48(1) ;
   o_z(0) <= o_z_EXMPLR48(0) ;
   current_state(1) <= current_state_EXMPLR49(1) ;
   current_state(0) <= current_state_EXMPLR49(0) ;
   PWR <= '1';
   GND_EXMPLR45 <= '0';
   NOT_current_state_0 <= NOT current_state_EXMPLR49(0);
   z_add8_0i1_ix36_fadd : fiftyfivenm_lcell_comb
      generic map (lut_mask => X"6688") 
       port map ( combout=>z_0n2s1(0), cout=>nx21211z1, dataa=>
      o_z_EXMPLR48(0), datab=>b(0), datad=>PWR);
   z_add8_0i1_ix40_fadd : fiftyfivenm_lcell_comb
      generic map (lut_mask => X"96e8",
         sum_lutc_input => "cin") 
       port map ( combout=>z_0n2s1(1), cout=>nx13177z1, dataa=>
      o_z_EXMPLR48(1), datab=>b(1), datad=>PWR, cin=>nx21211z1);
   z_add8_0i1_ix44_fadd : fiftyfivenm_lcell_comb
      generic map (lut_mask => X"96e8",
         sum_lutc_input => "cin") 
       port map ( combout=>z_0n2s1(2), cout=>nx17971z1, dataa=>
      o_z_EXMPLR48(2), datab=>b(2), datad=>PWR, cin=>nx13177z1);
   z_add8_0i1_ix48_fadd : fiftyfivenm_lcell_comb
      generic map (lut_mask => X"96e8",
         sum_lutc_input => "cin") 
       port map ( combout=>z_0n2s1(3), cout=>nx1640z1, dataa=>
      o_z_EXMPLR48(3), datab=>b(3), datad=>PWR, cin=>nx17971z1);
   z_add8_0i1_ix52_fadd : fiftyfivenm_lcell_comb
      generic map (lut_mask => X"96e8",
         sum_lutc_input => "cin") 
       port map ( combout=>z_0n2s1(4), cout=>nx32748z1, dataa=>
      o_z_EXMPLR48(4), datab=>b(4), datad=>PWR, cin=>nx1640z1);
   z_add8_0i1_ix56_fadd : fiftyfivenm_lcell_comb
      generic map (lut_mask => X"96e8",
         sum_lutc_input => "cin") 
       port map ( combout=>z_0n2s1(5), cout=>nx16457z1, dataa=>
      o_z_EXMPLR48(5), datab=>b(5), datad=>PWR, cin=>nx32748z1);
   z_add8_0i1_ix60_fadd : fiftyfivenm_lcell_comb
      generic map (lut_mask => X"96e8",
         sum_lutc_input => "cin") 
       port map ( combout=>z_0n2s1(6), cout=>nx32031z1, dataa=>
      o_z_EXMPLR48(6), datab=>b(6), datad=>PWR, cin=>nx16457z1);
   z_add8_0i1_ix62_fadd : fiftyfivenm_lcell_comb
      generic map (lut_mask => X"9696",
         sum_lutc_input => "cin") 
       port map ( combout=>z_0n2s1(7), dataa=>o_z_EXMPLR48(7), datab=>b(7), 
      datad=>PWR, cin=>nx32031z1);
   reg_z_7 : dffeas port map ( q=>o_z_EXMPLR48(7), d=>z_0n2s1(7), clk=>clk, 
      ena=>nx47018z1, clrn=>PWR, prn=>PWR, asdata=>GND_EXMPLR45, sclr=>
      NOT_current_state_0, sload=>GND_EXMPLR45);
   reg_z_6 : dffeas port map ( q=>o_z_EXMPLR48(6), d=>z_0n2s1(6), clk=>clk, 
      ena=>nx47018z1, clrn=>PWR, prn=>PWR, asdata=>GND_EXMPLR45, sclr=>
      NOT_current_state_0, sload=>GND_EXMPLR45);
   reg_z_5 : dffeas port map ( q=>o_z_EXMPLR48(5), d=>z_0n2s1(5), clk=>clk, 
      ena=>nx47018z1, clrn=>PWR, prn=>PWR, asdata=>GND_EXMPLR45, sclr=>
      NOT_current_state_0, sload=>GND_EXMPLR45);
   reg_z_4 : dffeas port map ( q=>o_z_EXMPLR48(4), d=>z_0n2s1(4), clk=>clk, 
      ena=>nx47018z1, clrn=>PWR, prn=>PWR, asdata=>GND_EXMPLR45, sclr=>
      NOT_current_state_0, sload=>GND_EXMPLR45);
   reg_z_3 : dffeas port map ( q=>o_z_EXMPLR48(3), d=>z_0n2s1(3), clk=>clk, 
      ena=>nx47018z1, clrn=>PWR, prn=>PWR, asdata=>GND_EXMPLR45, sclr=>
      NOT_current_state_0, sload=>GND_EXMPLR45);
   reg_z_2 : dffeas port map ( q=>o_z_EXMPLR48(2), d=>z_0n2s1(2), clk=>clk, 
      ena=>nx47018z1, clrn=>PWR, prn=>PWR, asdata=>GND_EXMPLR45, sclr=>
      NOT_current_state_0, sload=>GND_EXMPLR45);
   reg_z_1 : dffeas port map ( q=>o_z_EXMPLR48(1), d=>z_0n2s1(1), clk=>clk, 
      ena=>nx47018z1, clrn=>PWR, prn=>PWR, asdata=>GND_EXMPLR45, sclr=>
      NOT_current_state_0, sload=>GND_EXMPLR45);
   reg_z_0 : dffeas port map ( q=>o_z_EXMPLR48(0), d=>z_0n2s1(0), clk=>clk, 
      ena=>nx47018z1, clrn=>PWR, prn=>PWR, asdata=>GND_EXMPLR45, sclr=>
      NOT_current_state_0, sload=>GND_EXMPLR45);
   reg_o_valid : dffeas port map ( q=>o_valid_EXMPLR34, d=>nx60567z1, clk=>
      clk, ena=>PWR, clrn=>PWR, prn=>PWR, asdata=>GND_EXMPLR45);
   reg_next_state_1 : dffeas
      generic map (power_up => "low") 
       port map ( q=>next_state(1), d=>nx54046z1, clk=>clk, ena=>PWR, clrn=>
      nx54046z3, prn=>nx54046z3, aload=>GND_EXMPLR45, asdata=>GND_EXMPLR45, 
      sclr=>GND_EXMPLR45, sload=>GND_EXMPLR45);
   nx54046z3 <= NOT GND_EXMPLR45;
   reg_next_state_0 : dffeas
      generic map (power_up => "low") 
       port map ( q=>next_state(0), d=>nx55043z1, clk=>clk, ena=>PWR, clrn=>
      nx54046z3, prn=>nx54046z3, aload=>GND_EXMPLR45, asdata=>GND_EXMPLR45, 
      sclr=>GND_EXMPLR45, sload=>GND_EXMPLR45);
   reg_b_0 : dffeas port map ( q=>b(0), d=>nx19052z1, clk=>clk, ena=>
      nx61882z2, clrn=>PWR, prn=>PWR, asdata=>GND_EXMPLR45);
   reg_a_7 : dffeas port map ( q=>a(7), d=>nx61882z1, clk=>clk, ena=>
      nx61882z2, clrn=>PWR, prn=>PWR, asdata=>GND_EXMPLR45);
   ix60885z7095 : fiftyfivenm_lcell_comb
      generic map (lut_mask => X"cfc0") 
       port map ( combout=>a_0n4ss1(6), datab=>a(7), datac=>
      current_state_EXMPLR49(0), datad=>i_a(6));
   ix59888z7095 : fiftyfivenm_lcell_comb
      generic map (lut_mask => X"cfc0") 
       port map ( combout=>a_0n4ss1(5), datab=>a(6), datac=>
      current_state_EXMPLR49(0), datad=>i_a(5));
   ix58891z7095 : fiftyfivenm_lcell_comb
      generic map (lut_mask => X"cfc0") 
       port map ( combout=>a_0n4ss1(4), datab=>a(5), datac=>
      current_state_EXMPLR49(0), datad=>i_a(4));
   ix57894z7095 : fiftyfivenm_lcell_comb
      generic map (lut_mask => X"cfc0") 
       port map ( combout=>a_0n4ss1(3), datab=>a(4), datac=>
      current_state_EXMPLR49(0), datad=>i_a(3));
   ix56897z7095 : fiftyfivenm_lcell_comb
      generic map (lut_mask => X"cfc0") 
       port map ( combout=>a_0n4ss1(2), datab=>a(3), datac=>
      current_state_EXMPLR49(0), datad=>i_a(2));
   ix55900z7095 : fiftyfivenm_lcell_comb
      generic map (lut_mask => X"cfc0") 
       port map ( combout=>a_0n4ss1(1), datab=>a(2), datac=>
      current_state_EXMPLR49(0), datad=>i_a(1));
   ix54903z7095 : fiftyfivenm_lcell_comb
      generic map (lut_mask => X"cfc0") 
       port map ( combout=>a_0n4ss1(0), datab=>a(1), datac=>
      current_state_EXMPLR49(0), datad=>i_a(0));
   ix12073z7095 : fiftyfivenm_lcell_comb
      generic map (lut_mask => X"cfc0") 
       port map ( combout=>b_0n4ss1(7), datab=>b(6), datac=>
      current_state_EXMPLR49(0), datad=>i_b(7));
   ix13070z7095 : fiftyfivenm_lcell_comb
      generic map (lut_mask => X"cfc0") 
       port map ( combout=>b_0n4ss1(6), datab=>b(5), datac=>
      current_state_EXMPLR49(0), datad=>i_b(6));
   ix14067z7095 : fiftyfivenm_lcell_comb
      generic map (lut_mask => X"cfc0") 
       port map ( combout=>b_0n4ss1(5), datab=>b(4), datac=>
      current_state_EXMPLR49(0), datad=>i_b(5));
   ix15064z7095 : fiftyfivenm_lcell_comb
      generic map (lut_mask => X"cfc0") 
       port map ( combout=>b_0n4ss1(4), datab=>b(3), datac=>
      current_state_EXMPLR49(0), datad=>i_b(4));
   ix16061z7095 : fiftyfivenm_lcell_comb
      generic map (lut_mask => X"cfc0") 
       port map ( combout=>b_0n4ss1(3), datab=>b(2), datac=>
      current_state_EXMPLR49(0), datad=>i_b(3));
   ix17058z7095 : fiftyfivenm_lcell_comb
      generic map (lut_mask => X"cfc0") 
       port map ( combout=>b_0n4ss1(2), datab=>b(1), datac=>
      current_state_EXMPLR49(0), datad=>i_b(2));
   ix18055z7095 : fiftyfivenm_lcell_comb
      generic map (lut_mask => X"cfc0") 
       port map ( combout=>b_0n4ss1(1), datab=>b(0), datac=>
      current_state_EXMPLR49(0), datad=>i_b(1));
   ix61882z7096 : fiftyfivenm_lcell_comb
      generic map (lut_mask => X"8c88") 
       port map ( combout=>nx61882z2, dataa=>nx61882z3, datab=>nx61882z5, 
      datac=>current_state_EXMPLR49(0), datad=>i_valid);
   ix47018z7095 : fiftyfivenm_lcell_comb
      generic map (lut_mask => X"8a80") 
       port map ( combout=>nx47018z1, dataa=>nx61882z5, datab=>a(0), datac=>
      current_state_EXMPLR49(0), datad=>i_valid);
   ix61882z7095 : fiftyfivenm_lcell_comb
      generic map (lut_mask => X"0f00") 
       port map ( combout=>nx61882z1, datac=>current_state_EXMPLR49(0), 
      datad=>i_a(7));
   ix19052z7095 : fiftyfivenm_lcell_comb
      generic map (lut_mask => X"0f00") 
       port map ( combout=>nx19052z1, datac=>current_state_EXMPLR49(0), 
      datad=>i_b(0));
   ix55043z7095 : fiftyfivenm_lcell_comb
      generic map (lut_mask => X"0032") 
       port map ( combout=>nx55043z1, dataa=>current_state_EXMPLR49(0), 
      datab=>current_state_EXMPLR49(1), datac=>i_valid, datad=>reset);
   ix54046z7095 : fiftyfivenm_lcell_comb
      generic map (lut_mask => X"8000") 
       port map ( combout=>nx54046z1, dataa=>nx54046z2, datab=>nx61882z4, 
      datac=>nx61882z5, datad=>current_state_EXMPLR49(0));
   ix60567z7095 : fiftyfivenm_lcell_comb
      generic map (lut_mask => X"e4f4") 
       port map ( combout=>nx60567z1, dataa=>nx60567z2, datab=>
      current_state_EXMPLR49(0), datac=>o_valid_EXMPLR34, datad=>i_valid);
   ix61882z7099 : fiftyfivenm_lcell_comb
      generic map (lut_mask => X"000f") 
       port map ( combout=>nx61882z5, datac=>current_state_EXMPLR49(1), 
      datad=>reset);
   ix60567z7096 : fiftyfivenm_lcell_comb
      generic map (lut_mask => X"ff0c") 
       port map ( combout=>nx60567z2, datab=>current_state_EXMPLR49(0), 
      datac=>current_state_EXMPLR49(1), datad=>reset);
   ix61882z7098 : fiftyfivenm_lcell_comb
      generic map (lut_mask => X"0001") 
       port map ( combout=>nx61882z4, dataa=>a(4), datab=>a(5), datac=>a(6), 
      datad=>a(7));
   ix54046z7096 : fiftyfivenm_lcell_comb
      generic map (lut_mask => X"0001") 
       port map ( combout=>nx54046z2, dataa=>a(0), datab=>a(1), datac=>a(2), 
      datad=>a(3));
   ix61882z7097 : fiftyfivenm_lcell_comb
      generic map (lut_mask => X"3f00") 
       port map ( combout=>nx61882z3, datab=>nx54046z2, datac=>nx61882z4, 
      datad=>current_state_EXMPLR49(0));
   reg_current_state_1 : dffeas
      generic map (power_up => "low") 
       port map ( q=>current_state_EXMPLR49(1), d=>next_state(1), clk=>clk, 
      clrn=>nx54046z3, prn=>nx54046z3);
   reg_current_state_0 : dffeas
      generic map (power_up => "low") 
       port map ( q=>current_state_EXMPLR49(0), d=>next_state(0), clk=>clk, 
      clrn=>nx54046z3, prn=>nx54046z3);
   reg_b_7 : dffeas port map ( q=>b(7), d=>b_0n4ss1(7), clk=>clk, ena=>
      nx61882z2, clrn=>PWR, prn=>PWR);
   reg_b_6 : dffeas port map ( q=>b(6), d=>b_0n4ss1(6), clk=>clk, ena=>
      nx61882z2, clrn=>PWR, prn=>PWR);
   reg_b_5 : dffeas port map ( q=>b(5), d=>b_0n4ss1(5), clk=>clk, ena=>
      nx61882z2, clrn=>PWR, prn=>PWR);
   reg_b_4 : dffeas port map ( q=>b(4), d=>b_0n4ss1(4), clk=>clk, ena=>
      nx61882z2, clrn=>PWR, prn=>PWR);
   reg_b_3 : dffeas port map ( q=>b(3), d=>b_0n4ss1(3), clk=>clk, ena=>
      nx61882z2, clrn=>PWR, prn=>PWR);
   reg_b_2 : dffeas port map ( q=>b(2), d=>b_0n4ss1(2), clk=>clk, ena=>
      nx61882z2, clrn=>PWR, prn=>PWR);
   reg_b_1 : dffeas port map ( q=>b(1), d=>b_0n4ss1(1), clk=>clk, ena=>
      nx61882z2, clrn=>PWR, prn=>PWR);
   reg_a_6 : dffeas port map ( q=>a(6), d=>a_0n4ss1(6), clk=>clk, ena=>
      nx61882z2, clrn=>PWR, prn=>PWR);
   reg_a_5 : dffeas port map ( q=>a(5), d=>a_0n4ss1(5), clk=>clk, ena=>
      nx61882z2, clrn=>PWR, prn=>PWR);
   reg_a_4 : dffeas port map ( q=>a(4), d=>a_0n4ss1(4), clk=>clk, ena=>
      nx61882z2, clrn=>PWR, prn=>PWR);
   reg_a_3 : dffeas port map ( q=>a(3), d=>a_0n4ss1(3), clk=>clk, ena=>
      nx61882z2, clrn=>PWR, prn=>PWR);
   reg_a_2 : dffeas port map ( q=>a(2), d=>a_0n4ss1(2), clk=>clk, ena=>
      nx61882z2, clrn=>PWR, prn=>PWR);
   reg_a_1 : dffeas port map ( q=>a(1), d=>a_0n4ss1(1), clk=>clk, ena=>
      nx61882z2, clrn=>PWR, prn=>PWR);
   reg_a_0 : dffeas port map ( q=>a(0), d=>a_0n4ss1(0), clk=>clk, ena=>
      nx61882z2, clrn=>PWR, prn=>PWR);
end main ;

