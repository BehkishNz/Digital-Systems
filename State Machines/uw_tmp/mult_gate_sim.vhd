
-- 
-- Definition of  mult
-- 
--      Thu Jun  1 19:50:37 2017
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
library modgen_sim; 
use  modgen_sim.all; 

entity select_3_3 is 
   port (
      a : IN std_logic_vector (2 DOWNTO 0) ;
      b : IN std_logic_vector (2 DOWNTO 0) ;
      d : OUT std_logic) ;
end select_3_3 ;

architecture BEHAVIORAL of select_3_3 is 
   component sim_select
      generic (size : integer := 3) ;
      
      port (
         a : IN std_logic_vector (2 DOWNTO 0) ;
         b : IN std_logic_vector (2 DOWNTO 0) ;
         d : OUT std_logic) ;
   end component ;
begin
   ix10 : sim_select
      generic map (size => 3) 
       port map ( a=>a, b=>b, d=>d);
end BEHAVIORAL ;

library IEEE;library altera_mf;library lpm;library altera;
 use IEEE.STD_LOGIC_1164.ALL;
 use altera_mf.altera_mf_components.all, lpm.lpm_components.all, altera.altera_primitives_components.all;
library modgen_sim; 
use  modgen_sim.all; 

entity add_8u_8u_8u_0_0 is 
   port (
      cin : IN std_logic ;
      a : IN std_logic_vector (7 DOWNTO 0) ;
      b : IN std_logic_vector (7 DOWNTO 0) ;
      d : OUT std_logic_vector (7 DOWNTO 0) ;
      cout : OUT std_logic) ;
end add_8u_8u_8u_0_0 ;

architecture BEHAVIORAL of add_8u_8u_8u_0_0 is 
   component sim_add
      generic (size : integer := 8) ;
      
      port (
         cin : IN std_logic ;
         a : IN std_logic_vector (7 DOWNTO 0) ;
         b : IN std_logic_vector (7 DOWNTO 0) ;
         d : OUT std_logic_vector (7 DOWNTO 0) ;
         cout : OUT std_logic) ;
   end component ;
begin
   ix29 : sim_add
      generic map (size => 8) 
       port map ( cin=>cin, a=>a, b=>b, d=>d, cout=>cout);
end BEHAVIORAL ;

library IEEE;library altera_mf;library lpm;library altera;
 use IEEE.STD_LOGIC_1164.ALL;
 use altera_mf.altera_mf_components.all, lpm.lpm_components.all, altera.altera_primitives_components.all;
library modgen_sim; 
use  modgen_sim.all; 

entity and_8u_8u is 
   port (
      a : IN std_logic_vector (7 DOWNTO 0) ;
      d : OUT std_logic) ;
end and_8u_8u ;

architecture BEHAVIORAL of and_8u_8u is 
   component sim_and
      generic (size : integer := 8) ;
      
      port (
         a : IN std_logic_vector (7 DOWNTO 0) ;
         d : OUT std_logic) ;
   end component ;
begin
   ix13 : sim_and
      generic map (size => 8) 
       port map ( a=>a, d=>d);
end BEHAVIORAL ;

library IEEE;library altera_mf;library lpm;library altera;
 use IEEE.STD_LOGIC_1164.ALL;
 use altera_mf.altera_mf_components.all, lpm.lpm_components.all, altera.altera_primitives_components.all;

entity mult_gate is 
   port (
      clk : IN std_logic ;
      reset : IN std_logic ;
      i_valid : IN std_logic ;
      i_a : IN std_logic_vector (7 DOWNTO 0) ;
      i_b : IN std_logic_vector (7 DOWNTO 0) ;
      o_valid : OUT std_logic ;
      o_z : OUT std_logic_vector (7 DOWNTO 0) ;
      current_state : OUT std_logic_vector (1 DOWNTO 0)) ;
end mult_gate ;

architecture main of mult_gate is 
   component select_3_3
      port (
         a : IN std_logic_vector (2 DOWNTO 0) ;
         b : IN std_logic_vector (2 DOWNTO 0) ;
         d : OUT std_logic) ;
   end component ;
   component add_8u_8u_8u_0_0
      port (
         cin : IN std_logic ;
         a : IN std_logic_vector (7 DOWNTO 0) ;
         b : IN std_logic_vector (7 DOWNTO 0) ;
         d : OUT std_logic_vector (7 DOWNTO 0) ;
         cout : OUT std_logic) ;
   end component ;
   component and_8u_8u
      port (
         a : IN std_logic_vector (7 DOWNTO 0) ;
         d : OUT std_logic) ;
   end component ;
   procedure DFFRSE (
      constant data   : in std_logic;
      constant set    : in std_logic;
      constant reset  : in std_logic;
      constant enable : in std_logic;
      signal clk      : in std_logic;
      signal q        : out std_logic)
   is begin
       if (clk'event and clk'last_value = '0' and clk = '1') then
           if (reset = '1') then
               q <= '0' ;
           elsif (set = '1') then
               q <= '1' ;
           elsif (enable = '1') then
               q <= data and data ;    -- takes care of q<='X' if data='Z'
           end if ;
       end if ;
       if ((set/='1' or reset/='1') and clk/='0' and clk/='1') then
           q <= 'X' ;
       end if ;
   end DFFRSE ;
   procedure DFFPC (
      constant data   : in std_logic;
      constant preset : in std_logic;
      constant clear  : in std_logic;
      signal clk      : in std_logic;
      signal q        : out std_logic)
   is begin
       if (preset = '1') then
           q <= '1' ;
       elsif (clear = '1') then
           q <= '0' ;
       elsif (clk'event and clk'last_value = '0' and clk = '1') then
           q <= data and data ;    -- takes care of q<='X' if data='Z'
       end if ;
       if ((clear/='1' or preset/='1') and clk/='0' and clk/='1') then
           q <= 'X' ;
       end if ;
   end DFFPC ;
   procedure DFFPCE (
      constant data   : in std_logic;
      constant preset : in std_logic;
      constant clear  : in std_logic;
      constant enable : in std_logic;
      signal clk      : in std_logic;
      signal q        : out std_logic)
   is begin
       if (preset = '1') then
           q <= '1' ;
       elsif (clear = '1') then
           q <= '0' ;
       elsif (clk'event and clk'last_value = '0' and clk = '1') then
           if (enable = '1') then
               q <= data and data ;    -- takes care of q<='X' if data='Z'
           end if ;
       end if ;
       if ((clear/='1' or preset/='1') and clk/='0' and clk/='1') then
           q <= 'X' ;
       end if ;
   end DFFPCE ;
   signal o_z_EXMPLR32: std_logic_vector (7 DOWNTO 0) ;
   
   signal current_state_EXMPLR33: std_logic_vector (1 DOWNTO 0) ;
   
   signal a: std_logic_vector (7 DOWNTO 0) ;
   
   signal b: std_logic_vector (7 DOWNTO 0) ;
   
   signal next_state: std_logic_vector (1 DOWNTO 0) ;
   
   signal PWR, GND: std_logic ;
   
   signal a_0n4ss1: std_logic_vector (6 DOWNTO 0) ;
   
   signal b_0n4ss1: std_logic_vector (7 DOWNTO 1) ;
   
   signal not_current_state_0, not_i_valid: std_logic ;
   
   signal z_0n2s1: std_logic_vector (7 DOWNTO 0) ;
   
   signal not_a_0, rtlc0n187, rtlc0n189, not_rtlcn50, rtlc0n221, not_rtlcn51, 
      rtlcn16, rtlcn21, rtlcn28, not_current_state_1, rtlcn30, rtlcn39, 
      not_reset, not_rtlcs0, rtlcs0, rtlcs1, rtlcn50, rtlcn51, not_a_7, 
      not_a_6, not_a_5, not_a_4, not_a_3, not_a_2, not_a_1, 
      rtlc_138_and_3_nx0: std_logic ;
   type DANGLING_type is array (0 downto 0,511 downto 0) of std_logic ;
   signal DANGLING : DANGLING_type ;

begin
   o_z(7) <= o_z_EXMPLR32(7) ;
   o_z(6) <= o_z_EXMPLR32(6) ;
   o_z(5) <= o_z_EXMPLR32(5) ;
   o_z(4) <= o_z_EXMPLR32(4) ;
   o_z(3) <= o_z_EXMPLR32(3) ;
   o_z(2) <= o_z_EXMPLR32(2) ;
   o_z(1) <= o_z_EXMPLR32(1) ;
   o_z(0) <= o_z_EXMPLR32(0) ;
   current_state(1) <= current_state_EXMPLR33(1) ;
   current_state(0) <= current_state_EXMPLR33(0) ;
   PWR <= '1' ;
   GND <= '0' ;
   rtlc0_73_select_0 : select_3_3 port map ( a(2)=>current_state_EXMPLR33(1), 
      a(1)=>not_current_state_0, a(0)=>rtlcs0, b(2)=>PWR, b(1)=>not_i_valid, 
      b(0)=>rtlcs1, d=>rtlc0n187);
   rtlc0_77_select_1 : select_3_3 port map ( a(2)=>current_state_EXMPLR33(1), 
      a(1)=>not_current_state_0, a(0)=>rtlcs0, b(2)=>PWR, b(1)=>not_i_valid, 
      b(0)=>not_a_0, d=>rtlc0n189);
   not_a_0 <= NOT a(0) ;
   z_add8_0i1 : add_8u_8u_8u_0_0 port map ( cin=>GND, a(7)=>o_z_EXMPLR32(7), 
      a(6)=>o_z_EXMPLR32(6), a(5)=>o_z_EXMPLR32(5), a(4)=>o_z_EXMPLR32(4), 
      a(3)=>o_z_EXMPLR32(3), a(2)=>o_z_EXMPLR32(2), a(1)=>o_z_EXMPLR32(1), 
      a(0)=>o_z_EXMPLR32(0), b(7)=>b(7), b(6)=>b(6), b(5)=>b(5), b(4)=>b(4), 
      b(3)=>b(3), b(2)=>b(2), b(1)=>b(1), b(0)=>b(0), d(7)=>z_0n2s1(7), d(6)
      =>z_0n2s1(6), d(5)=>z_0n2s1(5), d(4)=>z_0n2s1(4), d(3)=>z_0n2s1(3), 
      d(2)=>z_0n2s1(2), d(1)=>z_0n2s1(1), d(0)=>z_0n2s1(0), cout=>
      DANGLING(0,0));
   rtlcn16 <= rtlcs0 AND rtlcs1 ;
   rtlcn28 <= i_valid OR current_state_EXMPLR33(0) ;
   not_current_state_1 <= NOT current_state_EXMPLR33(1) ;
   rtlcn21 <= not_current_state_1 AND rtlcn28 ;
   rtlcn30 <= not_current_state_0 AND not_rtlcn51 ;
   rtlcn39 <= current_state_EXMPLR33(0) AND not_rtlcn50 ;
   a_0n4ss1(0) <= a(1) when current_state_EXMPLR33(0) = '1' else i_a(0) ;
   a_0n4ss1(1) <= a(2) when current_state_EXMPLR33(0) = '1' else i_a(1) ;
   a_0n4ss1(2) <= a(3) when current_state_EXMPLR33(0) = '1' else i_a(2) ;
   a_0n4ss1(3) <= a(4) when current_state_EXMPLR33(0) = '1' else i_a(3) ;
   a_0n4ss1(4) <= a(5) when current_state_EXMPLR33(0) = '1' else i_a(4) ;
   a_0n4ss1(5) <= a(6) when current_state_EXMPLR33(0) = '1' else i_a(5) ;
   a_0n4ss1(6) <= a(7) when current_state_EXMPLR33(0) = '1' else i_a(6) ;
   b_0n4ss1(1) <= b(0) when current_state_EXMPLR33(0) = '1' else i_b(1) ;
   b_0n4ss1(2) <= b(1) when current_state_EXMPLR33(0) = '1' else i_b(2) ;
   b_0n4ss1(3) <= b(2) when current_state_EXMPLR33(0) = '1' else i_b(3) ;
   b_0n4ss1(4) <= b(3) when current_state_EXMPLR33(0) = '1' else i_b(4) ;
   b_0n4ss1(5) <= b(4) when current_state_EXMPLR33(0) = '1' else i_b(5) ;
   b_0n4ss1(6) <= b(5) when current_state_EXMPLR33(0) = '1' else i_b(6) ;
   b_0n4ss1(7) <= b(6) when current_state_EXMPLR33(0) = '1' else i_b(7) ;
   not_reset <= NOT reset ;
   not_rtlcs0 <= NOT rtlcs0 ;
   not_i_valid <= NOT i_valid ;
   not_current_state_0 <= NOT current_state_EXMPLR33(0) ;
   rtlcs0 <= not_current_state_1 AND current_state_EXMPLR33(0) ;
   not_rtlcn50 <= NOT rtlcn50 ;
   not_rtlcn51 <= NOT rtlcn51 ;
   not_a_7 <= NOT a(7) ;
   not_a_6 <= NOT a(6) ;
   not_a_5 <= NOT a(5) ;
   not_a_4 <= NOT a(4) ;
   not_a_3 <= NOT a(3) ;
   not_a_2 <= NOT a(2) ;
   not_a_1 <= NOT a(1) ;
   rtlc_160_and_4 : and_8u_8u port map ( a(7)=>not_a_7, a(6)=>not_a_6, a(5)
      =>not_a_5, a(4)=>not_a_4, a(3)=>not_a_3, a(2)=>not_a_2, a(1)=>not_a_1, 
      a(0)=>not_a_0, d=>rtlcs1);
   rtlcn50 <= reset OR rtlc0n187 ;
   rtlcn51 <= reset OR rtlc0n189 ;
   DFFRSE (rtlcn16,GND,reset,PWR,clk,next_state(1)) ;
   DFFRSE (rtlcn21,GND,reset,PWR,clk,next_state(0)) ;
   DFFPC (next_state(1),GND,GND,clk,current_state_EXMPLR33(1)) ;
   DFFPC (next_state(0),GND,GND,clk,current_state_EXMPLR33(0)) ;
   DFFPCE (current_state_EXMPLR33(0),GND,GND,rtlc0n221,clk,o_valid) ;
   DFFPCE (b_0n4ss1(7),GND,GND,not_rtlcn50,clk,b(7)) ;
   DFFPCE (b_0n4ss1(6),GND,GND,not_rtlcn50,clk,b(6)) ;
   DFFPCE (b_0n4ss1(5),GND,GND,not_rtlcn50,clk,b(5)) ;
   DFFPCE (b_0n4ss1(4),GND,GND,not_rtlcn50,clk,b(4)) ;
   DFFPCE (b_0n4ss1(3),GND,GND,not_rtlcn50,clk,b(3)) ;
   DFFPCE (b_0n4ss1(2),GND,GND,not_rtlcn50,clk,b(2)) ;
   DFFPCE (b_0n4ss1(1),GND,GND,not_rtlcn50,clk,b(1)) ;
   DFFPCE (a_0n4ss1(6),GND,GND,not_rtlcn50,clk,a(6)) ;
   DFFPCE (a_0n4ss1(5),GND,GND,not_rtlcn50,clk,a(5)) ;
   DFFPCE (a_0n4ss1(4),GND,GND,not_rtlcn50,clk,a(4)) ;
   DFFPCE (a_0n4ss1(3),GND,GND,not_rtlcn50,clk,a(3)) ;
   DFFPCE (a_0n4ss1(2),GND,GND,not_rtlcn50,clk,a(2)) ;
   DFFPCE (a_0n4ss1(1),GND,GND,not_rtlcn50,clk,a(1)) ;
   DFFPCE (a_0n4ss1(0),GND,GND,not_rtlcn50,clk,a(0)) ;
   DFFRSE (z_0n2s1(7),GND,rtlcn30,not_rtlcn51,clk,o_z_EXMPLR32(7)) ;
   DFFRSE (z_0n2s1(6),GND,rtlcn30,not_rtlcn51,clk,o_z_EXMPLR32(6)) ;
   DFFRSE (z_0n2s1(5),GND,rtlcn30,not_rtlcn51,clk,o_z_EXMPLR32(5)) ;
   DFFRSE (z_0n2s1(4),GND,rtlcn30,not_rtlcn51,clk,o_z_EXMPLR32(4)) ;
   DFFRSE (z_0n2s1(3),GND,rtlcn30,not_rtlcn51,clk,o_z_EXMPLR32(3)) ;
   DFFRSE (z_0n2s1(2),GND,rtlcn30,not_rtlcn51,clk,o_z_EXMPLR32(2)) ;
   DFFRSE (z_0n2s1(1),GND,rtlcn30,not_rtlcn51,clk,o_z_EXMPLR32(1)) ;
   DFFRSE (z_0n2s1(0),GND,rtlcn30,not_rtlcn51,clk,o_z_EXMPLR32(0)) ;
   DFFRSE (i_b(0),GND,rtlcn39,not_rtlcn50,clk,b(0)) ;
   DFFRSE (i_a(7),GND,rtlcn39,not_rtlcn50,clk,a(7)) ;
   rtlc_138_and_3_nx0 <= not_reset AND not_rtlcs0 ;
   rtlc0n221 <= rtlc_138_and_3_nx0 AND rtlcn28 ;
end main ;

