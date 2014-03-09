----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
-- Section: M6 
-- Engineer: C2C John Rios
--
-- Create Date:   16:45:41 03/08/2014
-- Design Name:   Computer Exercise 3 
-- Module Name:   C:/Users/C15John.Rios/Documents/ECE281/CE3_Rios/Mealy_Rios.vhd
-- Project Name:  CE3_Rios
-- Target Device:  
-- Tool versions:  
-- Description:   CE3 is our third exercise with VHDL meant make our ECE brain muscles grow big and strong.  
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MealyElevatorController_Shell is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           stop : in  STD_LOGIC;
           up_down : in  STD_LOGIC;
           floor : out  STD_LOGIC_VECTOR (3 downto 0);
			  nextfloor : out std_logic_vector (3 downto 0));
end MealyElevatorController_Shell;

architecture Behavioral of MealyElevatorController_Shell is

type floor_state_type is (floor1, floor2, floor3, floor4);

signal floor_state : floor_state_type;

begin

---------------------------------------------------------
--Code your Mealy machine next-state process below
--Question: Will it be different from your Moore Machine?
--Answer: Yes, the next-state code is the same. The output
---code will be different. 
---------------------------------------------------------
floor_state_machine: process(clk)
begin

	if clk'event and clk='1' then
		if reset='1' then
			floor_state <= floor1;
			
		else
		
			case floor_state is
			
				when floor1 =>
					if (up_down='1' and stop='0') then 
						floor_state <= floor2;
					else
						floor_state <= floor1;
					end if;
					
				when floor2 => 
					if (up_down='1' and stop='0') then 
						floor_state <= floor3; 			
					elsif (up_down='0' and stop='0') then 
						floor_state <= floor1;
					else
						floor_state <= floor2;
					end if;
					
				when floor3 =>
					if (up_down='1' and stop='0') then 
						floor_state <= floor4;
					elsif (up_down='0' and stop='0') then 
						floor_state <= floor2;	
					else
						floor_state <= floor3;	
					end if;
					
				when floor4 =>
					if (up_down='0' and stop='0') then 
						floor_state <= floor3;	
					else 
						floor_state <= floor4;	
					end if;
				
				when others =>
					floor_state <= floor1;
			end case;
		end if;
	end if;
end process;

-----------------------------------------------------------
--Code your Ouput Logic for your Mealy machine below
--Remember, now you have 2 outputs (floor and nextfloor)
-----------------------------------------------------------
floor <= "0001" when (floor_state = floor1) else
			"0010" when (floor_state = floor2) else
			"0011" when (floor_state = floor3) else
			"0100" when (floor_state = floor4) else
			"0001";

nextfloor <=	"0001" when (floor_state = floor1 and up_down = '0' and stop = '0') else
					"0001" when (floor_state = floor2 and up_down = '0' and stop = '0') else
					
					"0010" when (floor_state = floor1 and up_down = '1' and stop = '0') else
					"0010" when (floor_state = floor3 and up_down = '0' and stop = '0') else
					
					"0011" when (floor_state = floor2 and up_down = '1' and stop = '0') else
					"0011" when (floor_state = floor4 and up_down = '0' and stop = '0') else
		
					"0100" when (floor_state = floor3 and up_down = '1' and stop = '0') else
					"0100" when (floor_state = floor4 and up_down = '1' and stop = '0') else
					"0001";

end Behavioral;

