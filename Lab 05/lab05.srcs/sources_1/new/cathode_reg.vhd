----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.11.2022 23:18:05
-- Design Name: 
-- Module Name: cathode_reg - Behavioral
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

entity cathode_reg is
    Port ( led_in : in STD_LOGIC_VECTOR (3 downto 0);
           cat : out STD_LOGIC_VECTOR (6 downto 0));
end cathode_reg;

architecture reg of cathode_reg is
begin
 process(led_in) begin 
 case led_in is 
     when "0000" => cat <= "0000001";
     when "0001" => cat <= "1001111";
     when "0010" => cat <= "0010010";
     when "0011" => cat <= "0000110";
     when "0100" => cat <= "1001100";
     when "0101" => cat <= "0100100";
     when "0110" => cat <= "0100000";
     when "0111" => cat <= "0001111";
     when "1000" => cat <= "0000000";
     when "1001" => cat <= "0000100";
     when "1010" => cat <= "0000010"; 
     when "1011" => cat <= "1100000"; 
     when "1100" => cat <= "0110001"; 
     when "1101" => cat <= "1000010"; 
     when "1110" => cat <= "0110000"; 
     when "1111" => cat <= "0111000";
     when others => cat <= "1111111"; 
 end case;
 end process; 


end reg;
