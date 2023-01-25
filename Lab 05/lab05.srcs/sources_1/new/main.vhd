----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.11.2022 23:32:38
-- Design Name: 
-- Module Name: main - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity main is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           an : out STD_LOGIC_VECTOR (3 downto 0);
           cat : out STD_LOGIC_VECTOR (6 downto 0));
end main;

architecture Behavioral of main is
 signal phase_count: std_logic_vector(1 downto 0);
 signal sec_en: std_logic;
 signal num: std_logic_vector(15 downto 0); 
begin

clock: entity work.clock(clk)
 port map(clk => clk, reset => reset,
 phase_count => phase_count,
 sec_en => sec_en,
 sec => num); 
----------------------------------------------------------------------------
driver: entity work.segment_driver(driver)
 port map(clk => clk, reset => reset, phase_count => phase_count, num => num,
 sec_en => sec_en, an => an, cat => cat);



end Behavioral;
