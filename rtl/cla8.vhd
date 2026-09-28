----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/13/2026 04:51:52 PM
-- Design Name: 
-- Module Name: cla8 - Behavioral
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

entity cla8 is
    Port ( a : in STD_LOGIC_VECTOR (7 downto 0);
            b : in STD_LOGIC_VECTOR (7 downto 0);
            cin : in STD_LOGIC;
            sum : out STD_LOGIC_VECTOR (7 downto 0);
            cout : out STD_LOGIC);
end cla8;

architecture Behavioral of cla8 is
    signal g : std_logic_vector (7 downto 0);
    signal p : std_logic_vector (7 downto 0);
    signal c : std_logic_vector (7 downto 0);

    component fa
    Port ( a : in STD_LOGIC;
            b : in STD_LOGIC;
            cin : in STD_LOGIC;
            sum : out STD_LOGIC;
            cout : out STD_LOGIC);
    end component;
begin

    g <= a and b;
    p <= a xor b;

    c(0) <= cin;
    c(1) <= (g(0) or (p(0) and c(0)));
    c(2) <= (g(1) or (p(1) and g(0)) or (p(1) and p(0) and c(0)));
    c(3) <= (g(2) or (p(2) and g(1)) or (p(2) and p(1) and g(0)) or (p(2) and p(1) and p(0) and c(0)));
    c(4) <= (g(3) or (p(3) and g(2)) or (p(3) and p(2) and g(1)) or (p(3) and p(2) and p(1) and g(0)) or (p(3) and p(2) and p(1) and p(0) and c(0)));
    c(5) <= (g(4) or (p(4) and g(3)) or (p(4) and p(3) and g(2)) or (p(4) and p(3) and p(2) and g(1)) or (p(4) and p(3) and p(2) and p(1) and g(0)) or (p(4) and p(3) and p(2) and p(1) and p(0) and c(0)));
    c(6) <= (g(5) or (p(5) and g(4)) or (p(5) and p(4) and g(3)) or (p(5) and p(4) and p(3) and g(2)) or (p(5) and p(4) and p(3) and p(2) and g(1)) or (p(5) and p(4) and p(3) and p(2) and p(1) and g(0)) or (p(5) and p(4) and p(3) and p(2) and p(1) and p(0) and c(0)));
    c(7) <= (g(6) or (p(6) and g(5)) or (p(6) and p(5) and g(4)) or (p(6) and p(5) and p(4) and g(3)) or (p(6) and p(5) and p(4) and p(3) and g(2)) or (p(6) and p(5) and p(4) and p(3) and p(2) and g(1)) or (p(6) and p(5) and p(4) and p(3) and p(2) and p(1) and g(0)) or (p(6) and p(5) and p(4) and p(3) and p(2) and p(1) and p(0) and c(0)));
    cout <= (g(7) or (p(7) and g(6)) or (p(7) and p(6) and g(5)) or (p(7) and p(6) and p(5) and g(4)) or (p(7) and p(6) and p(5) and p(4) and g(3)) or (p(7) and p(6) and p(5) and p(4) and p(3) and g(2)) or (p(7) and p(6) and p(5) and p(4) and p(3) and p(2) and g(1)) or (p(7) and p(6) and p(5) and p(4) and p(3) and p(2) and p(1) and g(0)) or (p(7) and p(6) and p(5) and p(4) and p(3) and p(2) and p(1) and p(0) and c(0)));

    sum <= a xor b xor c;

end Behavioral;
