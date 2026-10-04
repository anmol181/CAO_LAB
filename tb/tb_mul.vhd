library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_mul is
--  Port ( );
end tb_mul;

architecture Behavioral of tb_mul is
    signal a : std_logic_vector ( 3 downto 0);
    signal b : std_logic_vector ( 3 downto 0);
    signal OP : std_logic_vector ( 7 downto 0);

    component lab2_wallace_tree_mul is
        Port (
            a : in STD_LOGIC_VECTOR (3 downto 0);
            b : in STD_LOGIC_VECTOR (3 downto 0);
            op : out STD_LOGIC_VECTOR (7 downto 0)
        );
    end component;
begin

    mul_inst : lab2_wallace_tree_mul
        port map (
            a => a,
            b => b,
            op => OP
        );

    process begin

        a <= "0000";
        b <= "0000";

        wait for 100 ns;

        a <= "0001";
        b <= "0001";

        wait for 100 ns;

        a <= "0001";
        b <= "0010";

        wait for 100 ns;

        a <= "1111";
        b <= "1111";

        wait for 100 ns;

        a <= "0100";
        b <= "0010";

        wait for 100 ns;

        a <= "0001";
        b <= "0011";

        wait for 100 ns;

        a <= "1111";
        b <= "0010";

        wait for 100 ns;

        a <= "0001";
        b <= "0010";

        wait;
    end process;


end Behavioral;

architecture behav of tb_mul is
    signal a : std_logic_vector ( 3 downto 0);
    signal b : std_logic_vector ( 3 downto 0);
    signal OP : std_logic_vector ( 7 downto 0);

    component lab2_wallace_tree_mul is
        Port (
            a : in STD_LOGIC_VECTOR (3 downto 0);
            b : in STD_LOGIC_VECTOR (3 downto 0);
            op : out STD_LOGIC_VECTOR (7 downto 0)
        );
    end component;
begin

    mul_inst : lab2_wallace_tree_mul
        port map (
            a => a,
            b => b,
            op => OP
        );

    process begin

        for i in 0 to 15 loop
            for j in 0 to 15 loop
                a <= std_logic_vector(to_unsigned(i, 4));
                b <= std_logic_vector(to_unsigned(j, 4));
                wait for 100 ns;
            end loop;
        end loop;

        wait;
    end process;


end behav;