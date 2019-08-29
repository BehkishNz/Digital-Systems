
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.util.all;
use work.kirsch_synth_pkg.all;

entity kirsch is
  port(
    clk        : in  std_logic;                      
    reset      : in  std_logic;                      
    i_valid    : in  std_logic;                 
    i_pixel    : in  unsigned(7 downto 0);
    o_valid    : out std_logic;                 
    o_edge     : out std_logic;	                     
    o_dir      : out direction_ty;
    o_mode     : out mode_ty;
    o_row      : out unsigned(7 downto 0);
    o_col      : out unsigned(7 downto 0)
  );  
end entity;


architecture main of kirsch is
	signal xindex : unsigned( 7 downto 0 );
	signal yindex : std_logic_vector( 2 downto 0 );
	signal rowCounter : unsigned( 7 downto 0 );
	--signal shift : std_logic;
	signal i_pixelprev : unsigned( 7 downto 0 );
	signal validShifteroo : std_logic_vector(6 downto 0);
	
	signal wr0 : std_logic;
	signal wr1 : std_logic;
	signal wr2 : std_logic;
	
	signal data0 : std_logic_vector(7 downto 0);
	signal data1 : std_logic_vector(7 downto 0);
	signal data2 : std_logic_vector(7 downto 0);
	
	signal a : unsigned(7 downto 0);
	signal h : unsigned(7 downto 0);
	signal g : unsigned(7 downto 0);
	signal b : unsigned(7 downto 0);
	signal i : unsigned(7 downto 0);
	signal f : unsigned(7 downto 0);
	signal c : unsigned(7 downto 0);
	signal d : unsigned(7 downto 0);
	signal e : unsigned(7 downto 0);
	
	------pipeline
	signal p00 : unsigned(12 downto 0);
	signal p01 : unsigned(9 downto 0);
	signal p10 : unsigned(9 downto 0);
	signal p11 : unsigned(9 downto 0);
	signal p20 : unsigned(8 downto 0);
	signal p21 : unsigned(9 downto 0);
	signal p30 : unsigned(8 downto 0);
	signal p31 : unsigned(9 downto 0);
	signal c0 : unsigned(9 downto 0);
	signal c1 : unsigned(9 downto 0);
	signal c2 : unsigned(7 downto 0);
	signal c3 : unsigned(7 downto 0);
	signal m0 : unsigned(13 downto 0);
	signal m1 : unsigned(14 downto 0);
	signal m2 : unsigned(9 downto 0);
	
	signal dirfirst1 : std_logic_vector(2 downto 0);
	signal dirfirst2 : std_logic_vector(2 downto 0);
	signal dirfirst3 : std_logic_vector(2 downto 0);
	signal dirfirst4 : std_logic_vector(2 downto 0);
	signal dirsecond1 : std_logic_vector(2 downto 0);
	signal dirsecond2 : std_logic_vector(2 downto 0);
	----
	signal p00prev : unsigned(12 downto 0);
	signal p01prev : unsigned(9 downto 0);
	signal p10prev : unsigned(9 downto 0);
	signal p11prev : unsigned(9 downto 0);
	signal p20prev : unsigned(8 downto 0);
	signal p21prev : unsigned(9 downto 0);
	signal p30prev : unsigned(8 downto 0);
	signal p31prev : unsigned(9 downto 0);
	signal c0prev : unsigned(9 downto 0);
	signal c1prev : unsigned(9 downto 0);
	signal c2prev : unsigned(7 downto 0);
	signal c3prev : unsigned(7 downto 0);
	signal m0prev : unsigned(13 downto 0);
	signal m1prev : unsigned(14 downto 0);
	signal m2prev : unsigned(9 downto 0);
	signal c0prev_2 : unsigned(9 downto 0);
	
	signal o_edgeprev : std_logic;
	signal o_dirprev : std_logic_vector(2 downto 0);
	signal dirfirst1prev : std_logic_vector(2 downto 0);
	signal dirfirst2prev : std_logic_vector(2 downto 0);
	signal dirfirst3prev : std_logic_vector(2 downto 0);
	signal dirfirst4prev : std_logic_vector(2 downto 0);
	signal dirsecond1prev : std_logic_vector(2 downto 0);
	signal dirsecond2prev : std_logic_vector(2 downto 0);
	----
	
	signal pipeCyc : unsigned(3 downto 0);
	----end of pipeline
	
	component mem is port(
			clock    : in  std_logic;
		wren    : in  std_logic;
		address  : in  unsigned( 7 downto 0 );
		data   : in  std_logic_vector( 8 - 1 downto 0 );
		q   : out std_logic_vector( 8 - 1 downto 0 )
		);
	end component;

begin  
--instantiate mem 
-- 0th row mem block
	rowzero_mem : mem 
	port map(
		clock => clk,
		wren => wr0,
		address => xindex,
		data => std_logic_vector(i_pixel),
		q => data0
	);
	
	-- 1st row mem block
	rowone_mem : mem 
	port map(
		clock => clk,
		wren => wr1,
		address => xindex,
		data =>std_logic_vector(i_pixel),
		q => data1
	);
	
	-- 2nd row mem block
	rowtwo_mem : mem 
	port map(
		clock => clk,
		wren => wr2,
		address => xindex,
		data => std_logic_vector(i_pixel),
		q => data2
	);
-- end instantiate mem


	--fill mem
	--fill : process (yindex) 
	--begin
	--	--if(pipecyc(0) = '1') then
	--		wr0 <= '1' when yindex(0) = '1' else '0';
	--		wr1 <= '1' when yindex(1) = '1' else '0';
	--		wr2 <= '1' when yindex(2) = '1' else '0';
	--	--else
	--	--	wr0 <= '0'  ;
	--	--	wr1 <= '0'  ;
	--	--	wr2 <= '0'  ;
	--	--end if;
	--end process;
	o_row <= rowCounter;
	o_col <= xindex;
	calc : process (pipeCyc) 
	begin
				case(pipeCyc)is
				when "0001" =>
					-- Stage 1
					p00 <= unsigned("00000" & b) + unsigned("00000" & c);
					p10 <= unsigned("00" & d) + unsigned("00" & e);
					p20 <= unsigned('0' & f) + unsigned('0' & g);
					p30 <= unsigned('0' & h) + unsigned('0' & a);
					if(a>=d)then
						c0 <= unsigned("00" & a);
						dirfirst1 <= "010"; -- n
					else
						c0 <= unsigned("00" & d);
						dirfirst1 <= "110"; -- ne
					end if;
					if(c>=f)then
						c1 <= unsigned("00" &c);
						dirfirst2 <= "000"; -- e
					else
						c1 <= unsigned("00" &f);
						dirfirst2 <= "101"; -- se
					end if;
					if(e>=h)then
						c2 <= e;
						dirfirst3 <= "011"; -- s
					else
						c2 <= h;
						dirfirst3 <= "111"; -- sw
					end if;
					if(g>=b)then
						c3 <= g;
						dirfirst4 <= "001"; -- w
					else
						c3 <= b;
						dirfirst4 <= "100"; -- nw
					end if;
					
					
					-- Stage 2
					m0 <= (shift_left(unsigned("0" & p00prev), 1)) + unsigned("0" & p00prev);
					--m0 <= "11"*p00prev(11 downto 0);
					m1 <=m1prev;
					m2 <=m2prev;
					
					--unused registers (in this cycle)
					p01 <= p01prev;
					p11 <= p11prev;
					p21 <= p21prev;
					p31 <= p31prev;
					o_dir <= o_dirprev;
					o_edge <= o_edgePrev;
					--dirfirst1   <= dirfirst1prev   ;
					--dirfirst2   <= dirfirst2prev   ;
					--dirfirst3   <= dirfirst3prev   ;
					--dirfirst4   <= dirfirst4prev   ;
					dirsecond1  <= dirsecond1prev  ;
					dirsecond2  <= dirsecond2prev  ;
					
					
				when "0010" =>
					--stage 1
					p01 <= p00(9 downto 0) + c0; --N/NE
					p11 <= p10 + c1; --E/SE
					p21 <= unsigned('0' &p20) + unsigned("00" &c2); --S /SW
					p31 <= unsigned('0' & p30) + unsigned("00" &c3); --W/NW
					
					--stage 2
				    --m0  <= "1000"*c0prev_2;
					m0  <= shift_left(unsigned("0000" & c0prev_2), 3);
					m1 <= unsigned('0' & m0prev) + "000000101111111";
					
					--unused registers (in this cycle)
					p00 <= p00prev;
					p10 <= p10prev;
					p20 <= p20prev;
					p30 <= p30prev;
					c0  <= c0prev ;
					c1  <= c1prev ;
					c2  <= c2prev ;
				    c3  <= c3prev ;
					m2  <= m2prev ;
					o_dir <= o_dirprev;
					o_edge <= o_edgePrev;
					dirfirst1   <= dirfirst1prev   ;
					dirfirst2   <= dirfirst2prev   ;
					dirfirst3   <= dirfirst3prev   ;
					dirfirst4   <= dirfirst4prev   ;
					dirsecond1  <= dirsecond1prev  ;
					dirsecond2  <= dirsecond2prev  ;
					
				when "0100" =>
					--stage 1
					p00 <= p00 + unsigned("000" &p10);
					p10 <= unsigned('0' &p20) + unsigned('0' &p30);
					if(p01>p31)then
						c0 <= p01;
						dirsecond1 <= dirfirst1; --N/NE
					else
						c0 <= p31;
						dirsecond1 <= dirfirst4; --W/NW
					end if;
					if(p21>p11)then
						c1 <= p21;
						dirsecond2 <= dirfirst3; --S/SW
					else
						c1 <= p11;
						dirsecond2 <= dirfirst2; --E/SE
					end if;
					
					--stage 2
					if(m0 > m1) then
						o_edge <= '1';
						o_dir <= o_dirprev;
					else
						o_edge <= '0';
						o_dir <= "000";
					end if;

					--unused registers (in this cycle)			
					p01 <= p01prev;
					p11 <= p11prev;
					p20 <= p20prev;
					p21 <= p21prev;
					p30 <= p30prev;
					p31 <= p31prev;
					c2  <= c2prev ;
				    c3  <= c3prev ;
				    m0  <= m0prev ;
					m1  <= m1prev ;
					m2  <= m2prev ;
					--o_dir <= o_dirprev;
					dirfirst1   <= dirfirst1prev   ;
					dirfirst2   <= dirfirst2prev   ;
					dirfirst3   <= dirfirst3prev   ;
					dirfirst4   <= dirfirst4prev   ;
					--o_edge <= o_edgePrev;
				when others =>
					--stage 1
					p00 <= p00 + unsigned("000" &p10);
					if(c1>c0)then
						c0 <= c1prev;
						o_dir <= dirsecond2; --S/SW/E/SE
						
					else
						c0 <= c0prev;
						o_dir <= dirsecond1; --N/NE/W/NW	
					end if;
					
					--unused registers (in this cycle)
					p01 <= p01prev;
					p10 <= p10prev;
					p11 <= p11prev;
					p20 <= p20prev;
					p21 <= p21prev;
					p30 <= p30prev;
					p31 <= p31prev;
					c1  <= c1prev ;
					c2  <= c2prev ;
				    c3  <= c3prev ;
				    m0  <= m0prev ;
					m1  <= m1prev ;
					m2  <= m2prev ;
					--o_dir <= o_dirprev;
					o_edge <= o_edgePrev;
					dirfirst1   <= dirfirst1prev   ;
					dirfirst2   <= dirfirst2prev   ;
					dirfirst3   <= dirfirst3prev   ;
					dirfirst4   <= dirfirst4prev   ;
					dirsecond1  <= dirsecond1prev  ;
					dirsecond2  <= dirsecond2prev  ;
				end case;
	end process;
	
	clocked : process (clk) begin
		if(rising_edge(clk)) then
			if(reset = '1') then 
				--reset
				xindex <= to_unsigned(0, xindex'length);
				yindex <= "001";
				wr0 <= '1';
				wr1 <= '0';
				wr2 <= '0';
				rowCounter <= "00000000";
				pipeCyc <= "0001";
				--shift <= '0';
				validShifteroo <= "0000000";
				o_mode <= m_reset;
			else
				-- pipeline registers
				 p00prev <= p00;
				 p01prev <= p01;
				 p10prev <= p10;
				 p11prev <= p11;
				 p20prev <= p20;
				 p21prev <= p21;
				 p30prev <= p30;
				 p31prev <= p31;
				 c0prev_2 <= c0prev;
				 c0prev  <= c0;
				 c1prev  <= c1;
				 c2prev  <= c2;
				 c3prev  <= c3;
				 m0prev  <= m0;
				 m1prev  <= m1;
				 m2prev  <= m2;
				 i_pixelprev <=i_pixel;
				 
				 o_edgeprev <= o_edge;
				 o_dirprev <= o_dir;
				 dirfirst1prev   <= dirfirst1   ;
				 dirfirst2prev   <= dirfirst2   ;
				 dirfirst3prev   <= dirfirst3   ;
				 dirfirst4prev   <= dirfirst4   ;
				dirsecond1prev  <= dirsecond1  ;
				dirsecond2prev  <= dirsecond2  ;

				-- TODO: we should tie pipe cycle to i valid in a more concrete method
				-- ie. i_valid goes high we always run 8 cycles of pipecycle afterwards
				-- this will handle all number of bubbles
				--if(rowCounter > "00000001" and xindex > "00000001" )then
				--		pipeCyc <= pipeCyc + 1;
				--end if;
				--if( pipeCyc(3) = '1') then 
				--	a <= b;
				--	h <= i;
				--	g <= f;
				--	
				--	b <= c;
				--	i <= d;
				--	f <= e;
				--	
				--	if yindex = "001" then 
				--		wr0 <= '1';
				--		wr1 <= '0';
				--		wr2 <= '0';
				--		c <= Unsigned(data1);
				--		d <= Unsigned(data2);
				--	elsif yindex = "010" then
				--		wr0 <= '0';
				--		wr1 <= '1';
				--		wr2 <= '0';
				--		c <= Unsigned(data2);
				--		d <= Unsigned(data0);
				--	else
				--		wr0 <= '0';
				--		wr1 <= '0';
				--		wr2 <= '1';
				--		c <= Unsigned(data0);
				--		d <= Unsigned(data1);
				--	end if;
				--	
				--	e <= i_pixelprev; --when yindex = "100" else Unsigned(data2);
				--	--shift <= '0';
				--end if;
				
				--shift validShifteroo
				validShifteroo(1) <= validShifteroo(0);
				validShifteroo(2) <= validShifteroo(1);
				validShifteroo(3) <= validShifteroo(2);
				validShifteroo(4) <= validShifteroo(3);
				validShifteroo(5) <= validShifteroo(4);
				validShifteroo(6) <= validShifteroo(5);
				o_valid <= validShifteroo(6); --eventually the one we fed in will come out 8 cycles later 
				
				pipeCyc(0) <= pipeCyc(3);
				pipeCyc(1) <= pipeCyc(0);
				pipeCyc(2) <= pipeCyc(1);
				pipeCyc(3) <= pipeCyc(2);
				
				if(i_valid = '1')then
				o_mode <= m_busy;
					pipeCyc <= "1000";
					--look at replkacing shift with pipecyc
					--shift <= '1';
					--used to feed 7 bit number a one in the first position when we have i valid. 
					--otherwise feed in a zero
					--rowCounter > "00000001" and
					if( rowCounter > "00000001" and xindex > "00000001") then
						validShifteroo(0) <= '1';
					else
						validShifteroo(0) <= '0';
					end if;
					xindex <= xindex + 1; 
					-------------------
					if(xindex = 255 ) then 
						--yindex(1) <= yindex(0);
						--yindex(2) <= yindex(1);
						--yindex(0) <= yindex(2);
						wr1 <= wr0;
						wr2<= wr1;
						wr0<= wr2;
						

						rowCounter <= rowCounter + 1; 
					end if;
					
					
					a <= b;
					h <= i;
					g <= f;
					
					b <= c;
					i <= d;
					f <= e;
					
					--if yindex = "001" then 
					--	wr0 <= '1';
					--	wr1 <= '0';
					--	wr2 <= '0';
					--	c <= Unsigned(data1);
					--	d <= Unsigned(data2);
					--elsif yindex = "010" then
					--	wr0 <= '0';
					--	wr1 <= '1';
					--	wr2 <= '0';
					--	c <= Unsigned(data2);
					--	d <= Unsigned(data0);
					--else
					--	wr0 <= '0';
					--	wr1 <= '0';
					--	wr2 <= '1';
					--	c <= Unsigned(data0);
					--	d <= Unsigned(data1);
					--end if;
					
					if wr0 = '1' then 
						c <= Unsigned(data1);
						d <= Unsigned(data2);
					elsif wr1 = '1' then
						c <= Unsigned(data2);
						d <= Unsigned(data0);
					else
						c <= Unsigned(data0);
						d <= Unsigned(data1);
					end if;
					
					e <= i_pixel; --i_pixelprev; --when yindex = "100" else Unsigned(data2);
					

				else
					validShifteroo(0) <= '0';
				end if;
				if (rowCounter = "00000000" and xindex = "00000000")then
					o_mode <= m_idle;
				end if;
			end if;
		end if;
	end process;
	
	--8*max(max(a,d)+c+b, max(c,f) + e + d, max(e,h)+g+f ,max(g,b) + a + h) > 383 + 3*(a+b+c+d+e+f+g+h)
end architecture;
