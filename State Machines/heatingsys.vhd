library ieee;
use ieee.std_logic_1164.all;

package heat_pkg is
  subtype heat_ty is std_logic_vector(1 downto 0);
  constant off  : heat_ty := "00";
  constant low  : heat_ty := "01";
  constant high : heat_ty := "11";
end heat_pkg;


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.heat_pkg.all;

entity heatingsys is                           -- finite state machine
  port(i_cur_temp       : in signed(7 downto 0); -- current temp
       i_des_temp       : in signed(7 downto 0); -- desired temp
       i_reset          : in std_logic;          -- reset
       i_clock          : in std_logic;          -- clock
       o_heatmode       : out heat_ty :=off           -- mode
      );
end heatingsys;

architecture main of heatingsys is
  signal state : heat_ty := off;
begin
  -- insert your vhdl code here
  mainProc : process
  begin
  wait until rising_edge(i_clock);
  if(i_reset = '1')then
	state <= off;
	o_heatmode <= state;
  else	
	o_heatmode <= state;
	if(o_heatmode = off)then
		if(((i_des_temp - i_cur_temp) >= 3) and ((i_des_temp - i_cur_temp)<5))then
			state <= low;
		elsif((i_des_temp - i_cur_temp) >=5)then
			state <=high;
		else
			state <= off;
		end if;
	
	elsIF(o_heatmode = low) then
		if((i_cur_temp - i_des_temp) > 2)then
			state <= off;
		elsif((i_des_temp - i_cur_temp) >= 7)then
			state <= high;
		else
			state <= low;
		end if;
  
	elsIF(o_heatmode = high) then
		if((i_cur_temp - i_des_temp) > 3)then
			state <=low;
		else
			state <= high;
		end if;
	
	else
		state <=off;
	end if;
 end if;
 end process;
end main;

-- question 1
  --insert answer here
  -- 1-bit flip-flops 3
  -- 1-bit latches 0
  -- ANDS 13
  --ORS 15
  -- both and and or gates include more than 2 bit gates
  --XORS 0 
  --NOTs 12
  --adders 0
  --subtracters 2
  --comparitors 0
  -- multiplexers 0 

