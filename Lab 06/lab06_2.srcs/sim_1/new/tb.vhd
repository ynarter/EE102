----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.11.2022 23:37:11
-- Design Name: 
-- Module Name: tb - Behavioral
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

library ieee;
use ieee.std_logic_1164.all;
----------------------------------------------------------------------
entity tb is
end tb;
----------------------------------------------------------------------
architecture rtl_tb of tb is
 signal clk, reset,enable,ready: std_logic;
 signal in_a, in_b, output : std_logic_vector (7 downto 0);
 type state_type is (hold, replace, subtract);
 signal register_state, next_state : state_type;
begin
----------------------------------------------------------------------
 dut: entity work.gcd_main(rtl_main)
 port map(clk,reset,enable,in_a,in_b,ready,output);
----------------------------------------------------------------------
 clock_process: process begin
 clk <= '0';
 wait for 10ns;
 clk <= '1';
 wait for 10ns;
 end process;
----------------------------------------------------------------------
 stim_process: process begin
 enable <= '1';
 in_a <= "10001100";
 in_b <= "00001100";
 reset <= '0';
 wait for 100ns;
 enable <= '0';
 wait;
 end process;
----------------------------------------------------------------------
end rtl_tb;
----------------------------------------------------------------------
configuration rtl_tb of tb is
 for rtl_tb
 end for; 
end rtl_tb;