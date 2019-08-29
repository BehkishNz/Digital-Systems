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
	--signal yindex : std_logic_vector( 2 downto 0 );
	signal rowCounter : unsigned( 7 downto 0 );
	--signal shift : std_logic;
	--signal i_pixelprev : unsigned( 7 downto 0 );
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
	signal p01 : unsigned(12 downto 0);
	signal p10 : unsigned(9 downto 0);
	signal p11 : unsigned(9 downto 0);
	signal p20 : unsigned(9 downto 0);
	signal p21 : unsigned(9 downto 0);
	signal p30 : unsigned(9 downto 0);
	signal p31 : unsigned(9 downto 0);
	signal c0 : unsigned(9 downto 0);
	signal c1 : unsigned(9 downto 0);
	signal c2 : unsigned(7 downto 0);
	signal c3 : unsigned(7 downto 0);
	signal m0 : unsigned(13 downto 0);
	signal m1 : unsigned(14 downto 0);
	signal m2 : unsigned(9 downto 0);
	
	signal add0 : unsigned(12 downto 0);
	signal add1 : unsigned(9 downto 0);
	signal add2 : unsigned(9 downto 0);
	signal add3 : unsigned(9 downto 0);
	signal add4 : unsigned(14 downto 0);
	signal add5 : unsigned(13 downto 0);
	
	signal comp0 : unsigned(9 downto 0);
	signal comp1 : unsigned(9 downto 0);
	signal comp2 : unsigned(7 downto 0);
	signal comp3 : unsigned(7 downto 0);
	signal comp4 : std_logic;
	signal dir0 : std_logic_vector(2 downto 0);
	signal dir1 : std_logic_vector(2 downto 0);
	signal dir2 : std_logic_vector(2 downto 0);
	signal dir3 : std_logic_vector(2 downto 0);
	signal dir4 : std_logic_vector(2 downto 0);
	
	signal reg1 : unsigned(13 downto 0);
	
	signal dirfirst1 : std_logic_vector(2 downto 0);
	signal dirfirst2 : std_logic_vector(2 downto 0);
	signal dirfirst3 : std_logic_vector(2 downto 0);
	signal dirfirst4 : std_logic_vector(2 downto 0);
	signal dirsecond1 : std_logic_vector(2 downto 0);
	signal dirsecond2 : std_logic_vector(2 downto 0);

	signal c0prev : unsigned(9 downto 0);
	
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
 
 o_row <= rowCounter;
 o_col <= xindex;
    reg : process(clk)
	begin
	if(rising_edge(clk)) then
		case(pipeCyc)is
				when "0001" =>
				p00 <= add0;
				p10 <= add1;
				p20 <= add2;
				p30<= add3;
				c0 <=comp0;
				c1 <=comp1;
				c2 <=comp2;
				c3 <=comp3;
				m0 <=add5;
				dirfirst1 <= dir0;
				dirfirst2 <= dir1;
				dirfirst3 <= dir2;
				dirfirst4 <= dir3;
				
				when "0010" =>
				p01 <= add0;
				p11 <= add1;
				p21 <= add2;
				p31 <= add3;
				m1 <= add4;
				
				m0 <= reg1;
				
				when "0100" =>
				p00 <= add0;
				p10 <= add1;
				c0 <=comp0;
				c1 <=comp1;
				o_edge <= comp4;
				dirsecond1 <= dir0;
				dirsecond2 <= dir1;
				o_dir <= dir4;
				

				when others =>
				p00 <= add0;
				c0 <=comp0;
				o_dir <= dir0;
				
		end case;
	end if;
	
	end process;
	
	clocked : process (clk) begin
		if(rising_edge(clk)) then
			if(reset = '1') then 
				--reset
				xindex <= to_unsigned(0, xindex'length);
				--yindex <= "001";
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
				 -- p00prev <= p00;
				 -- p01prev <= p01;
				 -- p10prev <= p10;
				 -- p11prev <= p11;
				 -- p20prev <= p20;
				 -- p21prev <= p21;
				 -- p30prev <= p30;
				 -- p31prev <= p31;
				 -- c0prev_2 <= c0prev;
				 c0prev  <= c0;
				 -- c1prev  <= c1;
				 -- c2prev  <= c2;
				 -- c3prev  <= c3;
				 -- m0prev  <= m0;
				 -- m1prev  <= m1;
				 -- m2prev  <= m2;
				 -- i_pixelprev <=i_pixel;
				 
				 o_edgeprev <= o_edge;
				 o_dirprev <= o_dir;
				 dirfirst1prev   <= dirfirst1   ;
				 dirfirst2prev   <= dirfirst2   ;
				 dirfirst3prev   <= dirfirst3   ;
				 dirfirst4prev   <= dirfirst4   ;
				dirsecond1prev  <= dirsecond1  ;
				dirsecond2prev  <= dirsecond2  ;

				
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
					pipeCyc <= "0001";
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
	
	--Mos:TODO:-
	-- connect components here combinationally (adders, comparators, shifters and subs)
	-- so in our first cycle for example, we have
	add0 <= unsigned("00000" & b) + unsigned("00000" & c) when ( pipeCyc = "0001" ) else 
	        p00 + unsigned("000" & c0) when ( pipeCyc = "0010" ) else
	        p00 + unsigned("000" & p10) when ( pipeCyc = "0100" ) else
	        p00 + unsigned("000" & p10);
	add1 <= unsigned("00" & d) + unsigned("00" & e) when ( pipeCyc = "0001" ) else
	        p10 + c1 when ( pipeCyc = "0010" ) else
	        p20 + p30;
	        
	add2 <= unsigned("00" & f) + unsigned("00" & g) when ( pipeCyc = "0001" ) else
	         p20 + unsigned("00" & c2);
	         
	add3 <= unsigned("00" & h) + unsigned("00" & a) when ( pipeCyc = "0001" ) else
	         p30 + unsigned("00" & c3);
	add4 <= unsigned('0' & m0) + "000000101111111";
	add5 <= (shift_left(unsigned("0" & p00), 1)) + unsigned("0" & p00);
	reg1  <= shift_left(unsigned("0000" & c0prev), 3);
	 
	--we're in the first cycle
	--		unsigned("0" & p00) + unsigned("0" & c0) when ( pipeCyc(1) = '1' ) else //then we're in the 2nd cycle
	-- and so on for the first adder for every cycle it's being shared, this is STRAIGHT from the scheduling table
	-- You need to TAKE THE OUTPUT OF THIS ADDER a0 and PUT IT IN THE CORRECT REGISTER IN A CLOCKED PROCESS
	
	--TODO:-
	--Do the same for all components that are being shared (adders, comparators, shifters and sub)
    --Doing the same for the comparators
			 
	comparisons : process (a,b,c,d,e,f,g,h,p01,p31,c0,c1,p21,p11,m0,m1)
	begin
		--0 
		if pipecyc = "0001" and a >= d then
			comp0 <= unsigned("00" & a);
			dir0 <= "010";
		elsif pipecyc = "0001" and d >a then
			comp0 <= unsigned("00" & d);
			dir0 <= "110"; -- ne
		elsif pipecyc = "0100" and p01(9 downto 0) > p31 then 
			comp0 <= p01(9 downto 0);
			dir0 <= dirfirst1;
		elsif (pipecyc = "0100" and p01(9 downto 0) <= p31) then
			comp0 <= p31;
			dir0 <= dirfirst4; --W/NW
		elsif (pipecyc = "1000" and c1> c0) then --BACKWARDS?
			comp0 <= c1;
			dir0 <= dirsecond2;
		else 
			comp0 <= c0;
			dir0 <= dirsecond1; --N/NE/W/NW	
		end if;
		
		--  1 
		if (pipecyc = "0001" and c >= f) then 
			comp1 <= unsigned("00" & c);
			dir1 <= "000";
		elsif (pipecyc = "0001" and f >c) then
			comp1 <= unsigned("00" & f);
			dir1 <= "101"; -- se
		elsif (pipecyc = "0100" and p21 > p11) then --BACKWARDS?
			comp1 <= p21;
			dir1 <= dirfirst3;
		else 
			comp1 <= p11;
			dir1 <= dirfirst2; --N/NE/W/NW	
		end if;
		
		-- 2
		if (pipecyc = "0001" and e >= h) then --BACKWARDS?
			comp2 <= e;
			dir2 <= "011";
		else 
			comp2 <= h;
			dir2 <= "111"; --N/NE/W/NW	
		end if;
		
		-- 3
		if (pipecyc = "0001" and g >= b) then --BACKWARDS?
			comp3 <= g;
			dir3 <="001";
		else 
			comp3 <= b;
			dir3 <= "100"; --N/NE/W/NW	
		end if;
		-- 4
		if (pipecyc = "0100" and m0 >m1) then --BACKWARDS?
			comp4 <= '1';
			dir4 <= o_dirprev;
		else 
			comp4 <= '0';
			dir4 <= "000"; --N/NE/W/NW	
		end if;
		
	end process;
			 
	         
	    
	
	
end architecture;