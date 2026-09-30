----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/13/2026 04:11:04 PM
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

entity tb is
--  Port ( );
end tb;

architecture Behavioral of tb is
    signal a : std_logic_vector ( 7 downto 0);
    signal b : std_logic_vector ( 7 downto 0);
    signal sum : std_logic_vector ( 7 downto 0);
    signal cout : std_logic;
    
    component cla8
    Port ( a : in STD_LOGIC_VECTOR (7 downto 0);
           b : in STD_LOGIC_VECTOR (7 downto 0);
           cin : in std_logic;
           sum : out STD_LOGIC_VECTOR (7 downto 0);
           cout : out STD_LOGIC);
           
   end component;
   
   component rca8
    Port ( a : in STD_LOGIC_VECTOR (7 downto 0);
           b : in STD_LOGIC_VECTOR (7 downto 0);
           sum : out STD_LOGIC_VECTOR (7 downto 0);
           cout : out STD_LOGIC);
           
   end component ;
   
   begin
           
   
--   signal match : std_logic;
--   signal exp : std_logic_vector ( 7 downto 0);

    dut : cla8
    port map(
    a => a,
    b => b,
    cin => '0',
    sum => sum,
    cout => cout);
    
    process begin
    
--    exp <= a + b;
--    match <= exp == sum;
    
    a <= "00000110";
    b <= "00010101";
    
    wait for 100ns;

    a <= "00000111";
    b <= "00100011";
    
    wait for 100ns;
    
    a <= "00000100";
    b <= "00000011";
    
    wait for 100ns;
    
    a <= "10000100";
    b <= "10000011";
    
    wait for 100ns;
    
    a <= "01000100";
    b <= "00100011";
    
    wait for 100ns;
    
    a <= "00000000";
    b <= "00000000";
    
    wait;
    end process;

end Behavioral;
