--------------------------------------------------------------------------------
-- Section: M6 
-- Engineer: C2C John Rios
--
-- Create Date:   16:45:41 03/08/2014
-- Design Name:   Computer Exercise 3 
-- Module Name:   C:/Users/C15John.Rios/Documents/ECE281/CE3_Rios/Moore_testbench_Rios.vhd
-- Project Name:  CE3_Rios
-- Target Device:  
-- Tool versions:  
-- Description:   CE3 is our third exercise with VHDL meant make our ECE brain muscles grow big and strong.  
-- 
-- VHDL Test Bench Created by ISE for module: MooreElevatorController_Shell
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Moore_testbench_Rios IS
END Moore_testbench_Rios;
 
ARCHITECTURE behavior OF Moore_testbench_Rios IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MooreElevatorController_Shell
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         stop : IN  std_logic;
         up_down : IN  std_logic;
         floor : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal stop : std_logic := '0';
   signal up_down : std_logic := '0';

 	--Outputs
   signal floor : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MooreElevatorController_Shell PORT MAP (
          clk => clk,
          reset => reset,
          stop => stop,
          up_down => up_down,
          floor => floor
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
	
		--Resets Elevator to first floor hold reset state for 10 ns.
		reset <= '1';
		up_down <= '1';
		stop <= '1';
	
      wait for 100 ns;
		
		--Sends the elevator up to the second floor
		reset <= '0';
		up_down <= '1';
		stop <= '0';
		wait for clk_period;
		
		--waits on second floor for two clock cycles
		up_down <= '1';
		stop <= '1';
		wait for clk_period*2;
		
		--Sends the elevator up to the third floor after two clock cycles
		up_down <= '1';
		stop <= '0';
		wait for clk_period;
		
		--waits on third floor for two clock cycles
		up_down <= '1';
		stop <= '1';
		wait for clk_period*2;
		
		--Sends the elevator up to the fourth floor after two clock cycles
		up_down <= '1';
		stop <= '0';
		wait for clk_period;
		
		--waits on fourth floor for two clock cycles
		up_down <= '1';
		stop <= '1';
		wait for clk_period*2;
		
      --Sends the elevator down to the third floor after two clock cycles
		up_down <= '0';
		stop <= '0';
		wait for clk_period;
		
		--Sends the elevator up to the second floor after two clock cycles
		up_down <= '0';
		stop <= '0';
		wait for clk_period;
		
		--Sends the elevator up to the first floor after two clock cycles
		up_down <= '0';
		stop <= '0';
		wait for clk_period;
		
      -- insert stimulus here 

      wait;
   end process;

END;
