----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.11.2022 23:25:40
-- Design Name: 
-- Module Name: segment_driver - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity segment_driver is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           phase_count : in STD_LOGIC_VECTOR (1 downto 0);
           num : in STD_LOGIC_VECTOR (15 downto 0);
           sec_en : in STD_LOGIC;
           an : out STD_LOGIC_VECTOR (3 downto 0);
           cat : out STD_LOGIC_VECTOR (6 downto 0));
end segment_driver;

architecture driver of segment_driver is
 signal led_in: std_logic_vector(3 downto 0);
 begin
----------------------------------------------------------------------------
 process(phase_count) begin 
 case phase_count is 
 when "00" => an <= "0111";
 led_in <= num(15 downto 12); 
 when "01" => an <= "1011"; 
 led_in <= num(11 downto 8); 
 when "10" => an <= "1101"; 
 led_in <= num(7 downto 4);
 when "11" => an <= "1110";
 led_in <= num(3 downto 0);
 when others => an <= "1111"; 
 end case;
 end process;

LED: entity work.cathode_reg(reg)
 port map(led_in=>led_in, cat => cat); 



end driver;
