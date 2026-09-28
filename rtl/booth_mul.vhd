library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity mul is
    port (
        a  : in signed (3 downto 0);
        b  : in signed (3 downto 0);
        op : out signed (7 downto 0)
    );
end mul;

architecture booth of mul is
begin
    process(a, b)
        variable acc    : signed (3 downto 0);
        variable q      : std_logic_vector (3 downto 0);
        variable qm     : std_logic;
        variable q_p    : std_logic_vector (1 downto 0);
        variable p_temp : std_logic_vector (8 downto 0);
    begin
        q_p    := "00";
        qm     := '0';
        p_temp := "000000000";
        acc    := "0000";
       
        q      := std_logic_vector(b);

        for cnt in 0 to 3 loop
            q_p := q(0) & qm;
           
            case (q_p) is
                when "00" =>
                    acc := acc;
                when "01" =>
                    acc := acc + a;
                when "10" =>
                    acc := acc - a;
                when "11" =>
                    acc := acc;
                when others =>
                    acc := "0000";
            end case;
           
            p_temp := std_logic_vector(acc) & q & qm;
            p_temp := p_temp(8) & p_temp (8 downto 1);
           
            acc := signed(p_temp(8 downto 5));
            q   := p_temp(4 downto 1);
            qm  := p_temp(0);
           
        end loop;
       
        op <= signed(p_temp(8 downto 1));
    end process;
end booth;