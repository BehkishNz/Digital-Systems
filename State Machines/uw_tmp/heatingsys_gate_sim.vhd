
-- 
-- Definition of  heatingsys
-- 
--      Thu May 25 15:39:35 2017
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

entity sub_8u_8u_8u_0 is 
   port (
      cin : IN std_logic ;
      a : IN std_logic_vector (7 DOWNTO 0) ;
      b : IN std_logic_vector (7 DOWNTO 0) ;
      d : OUT std_logic_vector (7 DOWNTO 0) ;
      cout : OUT std_logic) ;
end sub_8u_8u_8u_0 ;

architecture BEHAVIORAL of sub_8u_8u_8u_0 is 
   component sim_sub
      generic (size : integer := 8) ;
      
      port (
         cin : IN std_logic ;
         a : IN std_logic_vector (7 DOWNTO 0) ;
         b : IN std_logic_vector (7 DOWNTO 0) ;
         d : OUT std_logic_vector (7 DOWNTO 0) ;
         cout : OUT std_logic) ;
   end component ;
begin
   ix29 : sim_sub
      generic map (size => 8) 
       port map ( cin=>cin, a=>a, b=>b, d=>d, cout=>cout);
end BEHAVIORAL ;

library IEEE;library altera_mf;library lpm;library altera; 
 use IEEE.STD_LOGIC_1164.ALL;
 use altera_mf.altera_mf_components.all, lpm.lpm_components.all, altera.altera_primitives_components.all;
library modgen_sim; 
use  modgen_sim.all; 

entity or_6u_6u is 
   port (
      a : IN std_logic_vector (5 DOWNTO 0) ;
      d : OUT std_logic) ;
end or_6u_6u ;

architecture BEHAVIORAL of or_6u_6u is 
   component sim_or
      generic (size : integer := 6) ;
      
      port (
         a : IN std_logic_vector (5 DOWNTO 0) ;
         d : OUT std_logic) ;
   end component ;
begin
   ix11 : sim_or
      generic map (size => 6) 
       port map ( a=>a, d=>d);
end BEHAVIORAL ;

library IEEE;library altera_mf;library lpm;library altera; 
 use IEEE.STD_LOGIC_1164.ALL;
 use altera_mf.altera_mf_components.all, lpm.lpm_components.all, altera.altera_primitives_components.all;
library modgen_sim; 
use  modgen_sim.all; 

entity or_5u_5u is 
   port (
      a : IN std_logic_vector (4 DOWNTO 0) ;
      d : OUT std_logic) ;
end or_5u_5u ;

architecture BEHAVIORAL of or_5u_5u is 
   component sim_or
      generic (size : integer := 5) ;
      
      port (
         a : IN std_logic_vector (4 DOWNTO 0) ;
         d : OUT std_logic) ;
   end component ;
begin
   ix10 : sim_or
      generic map (size => 5) 
       port map ( a=>a, d=>d);
end BEHAVIORAL ;

library IEEE;library altera_mf;library lpm;library altera; 
 use IEEE.STD_LOGIC_1164.ALL;
 use altera_mf.altera_mf_components.all, lpm.lpm_components.all, altera.altera_primitives_components.all;
library modgen_sim; 
use  modgen_sim.all; 

entity or_7u_7u is 
   port (
      a : IN std_logic_vector (6 DOWNTO 0) ;
      d : OUT std_logic) ;
end or_7u_7u ;

architecture BEHAVIORAL of or_7u_7u is 
   component sim_or
      generic (size : integer := 7) ;
      
      port (
         a : IN std_logic_vector (6 DOWNTO 0) ;
         d : OUT std_logic) ;
   end component ;
begin
   ix12 : sim_or
      generic map (size => 7) 
       port map ( a=>a, d=>d);
end BEHAVIORAL ;

library IEEE;library altera_mf;library lpm;library altera; 
 use IEEE.STD_LOGIC_1164.ALL;
 use altera_mf.altera_mf_components.all, lpm.lpm_components.all, altera.altera_primitives_components.all;

entity heatingsys_gate is 
   port (
      i_cur_temp : IN std_logic_vector (7 DOWNTO 0) ;
      i_des_temp : IN std_logic_vector (7 DOWNTO 0) ;
      i_reset : IN std_logic ;
      i_clock : IN std_logic ;
      o_heatmode : OUT std_logic_vector (1 DOWNTO 0)) ;
end heatingsys_gate ;

architecture main of heatingsys_gate is 
   component sub_8u_8u_8u_0
      port (
         cin : IN std_logic ;
         a : IN std_logic_vector (7 DOWNTO 0) ;
         b : IN std_logic_vector (7 DOWNTO 0) ;
         d : OUT std_logic_vector (7 DOWNTO 0) ;
         cout : OUT std_logic) ;
   end component ;
   component or_6u_6u
      port (
         a : IN std_logic_vector (5 DOWNTO 0) ;
         d : OUT std_logic) ;
   end component ;
   component or_5u_5u
      port (
         a : IN std_logic_vector (4 DOWNTO 0) ;
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
   component or_7u_7u
      port (
         a : IN std_logic_vector (6 DOWNTO 0) ;
         d : OUT std_logic) ;
   end component ;
   signal o_heatmode_EXMPLR22: std_logic_vector (1 DOWNTO 0) ;
   
   signal state: std_logic_vector (1 DOWNTO 0) ;
   
   signal GND, PWR, not_o_heatmode_0: std_logic ;
   
   signal rtlc0n166: std_logic_vector (7 DOWNTO 0) ;
   
   signal not_rtlc0n585, rtlc0_PS14_n305: std_logic ;
   
   signal rtlc0n317: std_logic_vector (7 DOWNTO 0) ;
   
   signal rtlc0n582, not_rtlcn44, rtlc0n585, rtlc0n670, not_rtlc0n670, 
      not_rtlc0n166_2, not_rtlc0n166_1, not_rtlc0n166_0, rtlc0n675, 
      rtlc0n676, rtlc0n677, rtlc0n678, rtlc0n732, rtlc0n733, rtlc0n734, 
      rtlc0n736, rtlcn44, rtlcn76, not_rtlcn106, rtlcn106, rtlcn108, 
      rtlcn109, rtlcn110, not_rtlc0n678, not_rtlc0n736, rtlcn113, rtlcn114, 
      rtlcn119, rtlcn120, rtlcn121, not_rtlc0n317_7, rtlcn123, 
      not_o_heatmode_1, rtlc_117_or_3_nx0, rtlc_127_or_6_nx0, 
      rtlc_131_and_7_nx0, rtlc_132_or_8_nx0, rtlc_135_or_9_nx0: std_logic ;
   type DANGLING_type is array (0 downto 0,511 downto 0) of std_logic ;
   signal DANGLING : DANGLING_type ;

begin
   o_heatmode(1) <= o_heatmode_EXMPLR22(1) ;
   o_heatmode(0) <= o_heatmode_EXMPLR22(0) ;
   GND <= '0' ;
   PWR <= '1' ;
   rtlc0_68_sub_0 : sub_8u_8u_8u_0 port map ( cin=>PWR, a(7)=>i_cur_temp(7), 
      a(6)=>i_cur_temp(6), a(5)=>i_cur_temp(5), a(4)=>i_cur_temp(4), a(3)=>
      i_cur_temp(3), a(2)=>i_cur_temp(2), a(1)=>i_cur_temp(1), a(0)=>
      i_cur_temp(0), b(7)=>i_des_temp(7), b(6)=>i_des_temp(6), b(5)=>
      i_des_temp(5), b(4)=>i_des_temp(4), b(3)=>i_des_temp(3), b(2)=>
      i_des_temp(2), b(1)=>i_des_temp(1), b(0)=>i_des_temp(0), d(7)=>
      rtlc0n317(7), d(6)=>rtlc0n317(6), d(5)=>rtlc0n317(5), d(4)=>
      rtlc0n317(4), d(3)=>rtlc0n317(3), d(2)=>rtlc0n317(2), d(1)=>
      rtlc0n317(1), d(0)=>rtlc0n317(0), cout=>DANGLING(0,0));
   rtlc0_87_sub_1 : sub_8u_8u_8u_0 port map ( cin=>PWR, a(7)=>i_des_temp(7), 
      a(6)=>i_des_temp(6), a(5)=>i_des_temp(5), a(4)=>i_des_temp(4), a(3)=>
      i_des_temp(3), a(2)=>i_des_temp(2), a(1)=>i_des_temp(1), a(0)=>
      i_des_temp(0), b(7)=>i_cur_temp(7), b(6)=>i_cur_temp(6), b(5)=>
      i_cur_temp(5), b(4)=>i_cur_temp(4), b(3)=>i_cur_temp(3), b(2)=>
      i_cur_temp(2), b(1)=>i_cur_temp(1), b(0)=>i_cur_temp(0), d(7)=>
      rtlc0n166(7), d(6)=>rtlc0n166(6), d(5)=>rtlc0n166(5), d(4)=>
      rtlc0n166(4), d(3)=>rtlc0n166(3), d(2)=>rtlc0n166(2), d(1)=>
      rtlc0n166(1), d(0)=>rtlc0n166(0), cout=>DANGLING(0,1));
   not_rtlc0n585 <= NOT rtlc0n585 ;
   not_o_heatmode_0 <= NOT o_heatmode_EXMPLR22(0) ;
   rtlc0n582 <= rtlc0n166(1) AND rtlc0n166(0) ;
   rtlc0n585 <= not_rtlcn44 OR rtlc0n166(7) ;
   not_rtlc0n670 <= NOT rtlc0n670 ;
   not_rtlc0n166_2 <= NOT rtlc0n166(2) ;
   not_rtlc0n166_1 <= NOT rtlc0n166(1) ;
   not_rtlc0n166_0 <= NOT rtlc0n166(0) ;
   rtlc0n675 <= not_rtlc0n166_1 AND not_rtlc0n166_0 ;
   rtlc0n676 <= not_rtlc0n166_2 OR rtlc0n675 ;
   rtlc0n677 <= not_rtlc0n670 AND rtlc0n676 ;
   rtlc0n678 <= rtlc0n677 OR rtlc0n166(7) ;
   rtlc0n733 <= rtlc0n317(0) AND rtlc0n317(1) ;
   rtlc0n734 <= rtlc0n733 OR rtlc0n732 ;
   rtlc0n736 <= rtlc0n734 AND not_rtlc0n317_7 ;
   not_rtlcn44 <= NOT rtlcn44 ;
   not_rtlc0n678 <= NOT rtlc0n678 ;
   rtlcn109 <= not_rtlc0n678 OR not_rtlc0n585 ;
   not_rtlc0n736 <= NOT rtlc0n736 ;
   rtlcn113 <= not_rtlc0n736 AND rtlc0_PS14_n305 ;
   rtlcn114 <= not_o_heatmode_0 AND rtlcn109 ;
   rtlc_118_or_4 : or_6u_6u port map ( a(5)=>rtlc0n317(2), a(4)=>
      rtlc0n317(3), a(3)=>rtlc0n317(4), a(2)=>rtlc0n317(5), a(1)=>
      rtlc0n317(6), a(0)=>rtlc0n317(7), d=>rtlc0n732);
   rtlc_119_or_5 : or_5u_5u port map ( a(4)=>rtlc0n166(3), a(3)=>
      rtlc0n166(4), a(2)=>rtlc0n166(5), a(1)=>rtlc0n166(6), a(0)=>
      rtlc0n166(7), d=>rtlc0n670);
   rtlcn119 <= not_rtlc0n670 AND rtlcn108 ;
   rtlcn120 <= not_o_heatmode_0 AND rtlc0n678 ;
   rtlcn121 <= rtlc0_PS14_n305 AND rtlcn110 ;
   not_rtlc0n317_7 <= NOT rtlc0n317(7) ;
   not_rtlcn106 <= NOT rtlcn106 ;
   not_o_heatmode_1 <= NOT o_heatmode_EXMPLR22(1) ;
   rtlc0_PS14_n305 <= not_o_heatmode_1 AND o_heatmode_EXMPLR22(0) ;
   DFFRSE (not_rtlcn106,GND,i_reset,PWR,i_clock,state(1)) ;
   DFFRSE (rtlcn76,GND,i_reset,PWR,i_clock,state(0)) ;
   DFFPC (state(1),GND,GND,i_clock,o_heatmode_EXMPLR22(1)) ;
   DFFPC (state(0),GND,GND,i_clock,o_heatmode_EXMPLR22(0)) ;
   rtlc_117_or_3_nx0 <= o_heatmode_EXMPLR22(1) OR rtlcn113 ;
   rtlcn76 <= rtlc_117_or_3_nx0 OR rtlcn114 ;
   rtlc_127_or_6_nx0 <= rtlc0n166(7) OR rtlc0n736 ;
   rtlcn110 <= rtlc_127_or_6_nx0 OR rtlcn119 ;
   rtlc_131_and_7_nx0 <= o_heatmode_EXMPLR22(1) AND rtlc0n732 ;
   rtlcn123 <= rtlc_131_and_7_nx0 AND not_rtlc0n317_7 ;
   rtlc_132_or_8_nx0 <= rtlcn120 OR rtlcn121 ;
   rtlcn106 <= rtlc_132_or_8_nx0 OR rtlcn123 ;
   rtlc_135_or_9_nx0 <= not_rtlc0n166_2 OR not_rtlc0n166_1 ;
   rtlcn108 <= rtlc_135_or_9_nx0 OR not_rtlc0n166_0 ;
   modgen_or_0 : or_7u_7u port map ( a(6)=>rtlc0n166(2), a(5)=>rtlc0n166(3), 
      a(4)=>rtlc0n166(4), a(3)=>rtlc0n166(5), a(2)=>rtlc0n166(6), a(1)=>
      rtlc0n166(7), a(0)=>rtlc0n582, d=>rtlcn44);
end main ;

