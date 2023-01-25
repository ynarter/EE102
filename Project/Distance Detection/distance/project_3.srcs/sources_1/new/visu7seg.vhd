library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity visu7seg is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           dec_1 : in  STD_LOGIC_VECTOR (3 downto 0);
           dec_10 : in  STD_LOGIC_VECTOR (3 downto 0);
           dec_100 : in  STD_LOGIC_VECTOR (3 downto 0);
           dec_1000 : in  STD_LOGIC_VECTOR (3 downto 0);
           an : out  STD_LOGIC_VECTOR (3 downto 0);
           cat0 : out  STD_LOGIC;
           cat1 : out  STD_LOGIC;
           cat2 : out  STD_LOGIC;
           cat3 : out  STD_LOGIC;
           cat4 : out  STD_LOGIC;
           cat5 : out  STD_LOGIC;
           cat6 : out  STD_LOGIC);
end visu7seg;

architecture Behavioral of visu7seg is
   signal count : unsigned (18 downto 0);
   signal seg_disp : std_logic_vector (6 downto 0);
   signal selector : std_logic_vector (3 downto 0);

begin

   P1_count:process(clk, reset)
   begin
      if (reset = '1') then
         count <= (others => '0');
      elsif rising_edge(clk) then
         count <= count + 1;
      end if;
   end process;
   
   with count(18 downto 17) & reset select
    an <= "1110" when "000",  -- 0
          "1101" when "010",  -- 1
          "1011" when "100",  -- 2
          "0111" when "110",  -- 3
          "1111" when others;  -- turned off 
   
   with count(18 downto 17) select
    selector <=  dec_1 when "00",
           dec_10 when "01",
           dec_100 when "10",
           dec_1000 when others;--
           
   with selector select
    seg_disp <= "0000001" when "0000",  -- 0
            "1001111" when "0001",  -- 1
            "0010010" when "0010",  -- 2
            "0000110" when "0011",  -- 3
            "1001100" when "0100",  -- 4
            "0100100" when "0101",  -- 5
            "0100000" when "0110",  -- 6
            "0001111" when "0111",  -- 7
            "0000000" when "1000",  -- 8
            "0000100" when "1001",  -- 9
            "1111111" when others;  -- turned off
            
  cat0 <= seg_disp(6);
  cat1 <= seg_disp(5);
  cat2 <= seg_disp(4);
  cat3 <= seg_disp(3);
  cat4 <= seg_disp(2);
  cat5 <= seg_disp(1);
  cat6 <= seg_disp(0);

end Behavioral;
