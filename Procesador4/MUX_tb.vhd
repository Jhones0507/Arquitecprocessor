--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:03:26 04/02/2014
-- Design Name:   
-- Module Name:   D:/Universidad Tecnologica/Procesador con Inmediato/MUX_tb.vhd
-- Project Name:  ProcesadorBasico
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MUX
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
 
ENTITY MUX_tb IS
END MUX_tb;
 
ARCHITECTURE behavior OF MUX_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MUX
    PORT(
         Entrada1 : IN  std_logic_vector(31 downto 0);
         Entrada2 : IN  std_logic_vector(31 downto 0);
         SET : IN  std_logic;
         MUXOUT : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Entrada1 : std_logic_vector(31 downto 0) := (others => '0');
   signal Entrada2 : std_logic_vector(31 downto 0) := (others => '0');
   signal SET : std_logic := '0';

 	--Outputs
   signal MUXOUT : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MUX PORT MAP (
          Entrada1 => Entrada1,
          Entrada2 => Entrada2,
          SET => SET,
          MUXOUT => MUXOUT
        );

   

   -- Stimulus process
   stim_proc: process
   begin		
--      Entrada1 <= "00000000000000000000000000000101";
--		Entrada2 <= "00000000000000000000000000000010";
--		wait for 100 ns;
--      SET <= '0';
--		wait for 100 ns;
--		SET <= '1';
--		

      

      

      wait;
   end process;

END;
