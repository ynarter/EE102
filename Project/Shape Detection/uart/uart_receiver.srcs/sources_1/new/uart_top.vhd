----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.12.2022 20:22:20
-- Design Name: 
-- Module Name: uart_top - Behavioral
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
---------------------------------------------------------------------
entity main is
 Port (clk : in STD_LOGIC;
 reset : in STD_LOGIC;
 rx : in std_logic;
 tr: out STD_lOGIC;
 rec: out STD_lOGIC;
 cir: out STD_lOGIC
 );
end main;
---------------------------------------------------------------------
architecture Behavioral of main is
signal shape: std_logic_vector(7 downto 0);

begin
--------------------------------------------------------------------- 
UART: entity work.UART_reciever(Behavioral)
 port map(clk => clk,
 reset => reset,
 rx => rx,
 rx_data_out => shape);
 
tr <= '1' when shape="01100001" else '0';
rec <= '1' when shape="01100010" else '0';
cir <= '1' when shape="01100011" else '0';



end Behavioral;
 