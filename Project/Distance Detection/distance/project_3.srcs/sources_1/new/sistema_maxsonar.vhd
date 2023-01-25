library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sistema_maxsonar is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           echo : in  STD_LOGIC;
           measure : in  STD_LOGIC;
           enable : in  STD_LOGIC;
           buzzer : OUT STD_LOGIC;           
		   trigger : OUT std_logic;
		   data_valid : OUT std_logic;
           an : OUT std_logic_vector(3 downto 0);
		     cat0 : OUT std_logic;
		     cat1 : OUT std_logic;
		     cat2 : OUT std_logic;
		     cat3 : OUT std_logic;
		     cat4 : OUT std_logic;
		     cat5 : OUT std_logic;
		     cat6 : OUT std_logic
           );
end sistema_maxsonar;


architecture Behavioral of sistema_maxsonar is

   COMPONENT control_maxsonar
	PORT(
		clk : IN std_logic;
		reset : IN std_logic;
		start : IN std_logic;
		echo : IN std_logic;          
		trigger : OUT std_logic;
		data_valid : OUT std_logic;
		distance : OUT std_logic_vector(10 downto 0)
		);
	END COMPONENT;
   
   COMPONENT bin2bcd
	PORT(
		clk : IN std_logic;
		reset : IN std_logic;
		b_in : IN std_logic_vector(12 downto 0);          
		dec_1 : OUT std_logic_vector(3 downto 0);
		dec_10 : OUT std_logic_vector(3 downto 0);
		dec_100 : OUT std_logic_vector(3 downto 0);
		dec_1000 : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
   
   COMPONENT visu7seg
	PORT(
		clk : IN std_logic;
		reset : IN std_logic;
		dec_1 : IN std_logic_vector(3 downto 0);
		dec_10 : IN std_logic_vector(3 downto 0);
		dec_100 : IN std_logic_vector(3 downto 0);
		dec_1000 : IN std_logic_vector(3 downto 0);          
		an : OUT std_logic_vector(3 downto 0);
		cat0 : OUT std_logic;
		cat1 : OUT std_logic;
		cat2 : OUT std_logic;
		cat3 : OUT std_logic;
		cat4 : OUT std_logic;
		cat5 : OUT std_logic;
		cat6 : OUT std_logic
		);
	END COMPONENT;
   
   signal dec_1, dec_10, dec_100, dec_1000 : std_logic_vector(3 downto 0);
   signal b_in : std_logic_vector(12 downto 0);
   signal start : std_logic;         
	signal distance : std_logic_vector(10 downto 0);
   signal distance_2 : std_logic_vector(12 downto 0);
   type state_type is (meas, hold);
   signal state: state_type;
   signal div_clock : unsigned(26 downto 0);

begin

   Inst_control_maxsonar: control_maxsonar PORT MAP(
		clk => clk,
		reset => reset,
		start => start,
		echo => echo,
		trigger => trigger,
		data_valid => data_valid,
		distance => distance
	);
   
   Inst_bin2bcd: bin2bcd PORT MAP(
		clk => clk,
		reset => reset,
		b_in => distance_2,
		dec_1 => dec_1,
		dec_10 => dec_10,
		dec_100 => dec_100,
		dec_1000 => dec_1000
	);
   
   Inst_visu7seg: visu7seg PORT MAP(
		clk => clk,
		reset => reset,
		dec_1 => dec_1,
		dec_10 => dec_10,
		dec_100 => dec_100,
		dec_1000 => dec_1000,
		an => an,
		cat0 => cat0,
		cat1 => cat1,
		cat2 => cat2,
		cat3 => cat3,
		cat4 => cat4,
		cat5 => cat5,
		cat6 => cat6
	);
   
   Pprincipal:process(clk, reset)
   begin
      if (reset = '1') then
         state <= meas;
         start <= '0';
      elsif rising_edge(clk) then
         case state is
            when meas =>
               start <= '1';
               if enable = '0' then
                  state <= hold;
               end if;
            when hold =>
               start <= measure;
               if enable = '1' then
                  state <= meas;
               end if;
         end case;
      end if;
   end process;
   
   clk_div:process(clk, reset)
   begin
      if (reset = '1') then
         div_clock <= (others => '0');
      elsif rising_edge(clk) then
         div_clock <= div_clock + 1;
      end if;
   end process;
   
   distance_2 <= "00" & distance;
   
   buzzer <= not div_clock(26) when (distance > "00001001011" and distance < "00001100100") else
             not div_clock(25) when (distance > "00000110010" and distance < "00001001011") else
             not div_clock(24) when (distance > "00000011001" and distance < "00000110010") else
             not div_clock(23) when (distance > "00000001010" and distance < "00000011001") else
             '1' when (distance < "00000001010") else
             '0';
   
end Behavioral;