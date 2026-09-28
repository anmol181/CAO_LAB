library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;

entity booth_multiplier_tb is
--  Port ( );
end booth_multiplier_tb;

architecture Behavioral of booth_multiplier_tb is
    signal a : signed (3 downto 0);
    signal b : signed (3 downto 0);
    signal op : signed (7 downto 0);

    component mul is
    port (
    a : in signed (3 downto 0);
    b : in signed (3 downto 0);
    op : out signed (7 downto 0)
    );
    end component;
begin

    mul0 : mul port map(
    a => a,
    b => b,
    op => op);

    process begin

    wait for 10ns;

    a <= "0000";
    b <= "0000";

    wait for 100ns;

    a <= "1111";
    b <= "1111";

    wait for 100ns;

    a <= "0010";
    b <= "0010";

    wait for 100ns;

    a <= "1101";
    b <= "1011";

    wait;

    end process;

end Behavioral;
