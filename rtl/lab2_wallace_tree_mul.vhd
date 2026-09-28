----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/03/2026 04:18:10 PM
-- Design Name: 
-- Module Name: lab2_wallace_tree_mul - Behavioral
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

entity lab2_wallace_tree_mul is
    Port (
        a : in STD_LOGIC_VECTOR (3 downto 0);
        b : in STD_LOGIC_VECTOR (3 downto 0);
        op : out STD_LOGIC_VECTOR (7 downto 0)
    );
end lab2_wallace_tree_mul;

architecture Behavioral of lab2_wallace_tree_mul is
    -- component rca_nbit is
    --     generic (
    --         N : integer := 4
    --     );
    --     port (
    --         a : in STD_LOGIC_VECTOR (N-1 downto 0);
    --         b : in STD_LOGIC_VECTOR (N-1 downto 0);
    --         sum : out STD_LOGIC_VECTOR (N-1 downto 0);
    --         cout : out STD_LOGIC
    --     );
    -- end component;
    -- component fa is
    --     Port ( a : in STD_LOGIC;
    --             b : in STD_LOGIC;
    --             cin : in STD_LOGIC;
    --             sum : out STD_LOGIC;
    --             cout : out STD_LOGIC);
    -- end component;
    -- component ha is
    --     Port ( a : in STD_LOGIC;
    --             b : in STD_LOGIC;
    --             sum : out STD_LOGIC;
    --             cout : out STD_LOGIC);
    -- end component;

    signal p0 : std_logic_vector(7 downto 0);
    signal p1 : std_logic_vector(7 downto 0);
    signal p2 : std_logic_vector(7 downto 0);
    signal p3 : std_logic_vector(7 downto 0);

    signal s0 : std_logic_vector(7 downto 0);
    signal s1 : std_logic_vector(7 downto 0);
    signal s2 : std_logic_vector(7 downto 0);

    signal t0 : std_logic_vector(7 downto 0);
    signal t1 : std_logic_vector(7 downto 0);
begin

    process(a,b,p0,p1,p2,p3,s0,s1,s2,t0,t1) begin

        p0 <= "00000000";
        p1 <= "00000000";
        p2 <= "00000000";
        p3 <= "00000000";

        for i in 0 to 3 loop
            p0(i) <= a(i) and b(0);
            p1(i+1) <= a(i) and b(1);
            p2(i+2) <= a(i) and b(2);
            p3(i+3) <= a(i) and b(3);
        end loop;

        s0 <= "00000000";
        s1 <= "00000000";
        s2 <= "00000000";

        s0(0) <= p0(0);
        s0(1) <= p0(1) xor p1(1);
        s0(2) <= p0(2) xor p1(2) xor p2(2);
        s0(3) <= p0(3) xor p1(3) xor p2(3);
        s0(4) <= p1(4) xor p2(4) xor p3(4);
        s0(5) <= p2(5) xor p3(5);
        s0(6) <= p3(6);
        s0(7) <= '0';

        s1(0) <= '0';
        s1(1) <= '0';
        s1(2) <= p0(1) and p1(1);
        s1(3) <= ((p0(2) and p1(2)) or (p0(2) and p2(2)) or (p1(2) and p2(2)));
        s1(4) <= ((p0(3) and p1(3)) or (p0(3) and p2(3)) or (p1(3) and p2(3)));
        s1(5) <= ((p1(4) and p2(4)) or (p1(4) and p3(4)) or (p2(4) and p3(4)));
        s1(6) <=  (p2(5) and p3(5));
        s1(7) <=  '0';

        s2(0) <= '0';
        s2(1) <= '0';
        s2(2) <= '0';
        s2(3) <= p3(3);
        s2(4) <= '0';
        s2(5) <= '0';
        s2(6) <= '0';
        s2(7) <= '0';

        t0 <= "00000000";
        t1 <= "00000000";

        t0(0) <= s0(0);
        t0(1) <= s0(1);
        t0(2) <= s0(2) xor s1(2);
        t0(3) <= s0(3) xor s1(3) xor s2(3);
        t0(4) <= s0(4) xor s1(4);
        t0(5) <= s0(5) xor s1(5);
        t0(6) <= s0(6) xor s1(6);
        t0(7) <= '0';

        t1(0) <= '0';
        t1(1) <= '0';
        t1(2) <= '0';
        t1(3) <= s0(2) and s1(2);
        t1(4) <= ((s0(3) and s1(3)) or (s0(3) and s2(3)) or (s1(3) and s2(3)));
        t1(5) <= (s0(4) and s1(4));
        t1(6) <= (s0(5) and s1(5));
        t1(7) <= (s0(6) and s1(6));

        op(0) <= t0(0);
        op(1) <= t0(1);
        op(2) <= t0(2);
        op(3) <= t0(3) xor t1(3);
        op(4) <= t0(4) xor t1(4) xor (t0(3) and t1(3));
        op(5) <= t0(5) xor t1(5) xor ((t0(4) and t1(4)) or ((t0(3) and t1(3)) and (t0(4) or t1(4))));
        op(6) <= t0(6) xor t1(6) xor ((t0(5) and t1(5)) or ((t0(4) and t1(4)) and (t0(5) or t1(5))));
        op(7) <= t1(7);

    end process;


end Behavioral;
