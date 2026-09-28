----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/03/2026 04:21:25 PM
-- Design Name: 
-- Module Name: rca_nbit - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity rca_nbit is
--  Port ( );
    generic (
        N : integer := 4
    );
    port (
        a : in STD_LOGIC_VECTOR (N-1 downto 0);
        b : in STD_LOGIC_VECTOR (N-1 downto 0);
        sum : out STD_LOGIC_VECTOR (N-1 downto 0);
        cout : out STD_LOGIC
    );
end rca_nbit;

architecture Behavioral of rca_nbit is

    component fa is
        Port ( a : in STD_LOGIC;
                b : in STD_LOGIC;
                cin : in STD_LOGIC;
                sum : out STD_LOGIC;
                cout : out STD_LOGIC);
    end component;

begin

    -- cout & sum <= a + b;

end Behavioral;
