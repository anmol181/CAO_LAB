----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/17/2026 04:25:07 PM
-- Design Name: 
-- Module Name: alu_8bit_tb - Behavioral
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

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity alu_8bit_tb is
end alu_8bit_tb;

architecture behavior of alu_8bit_tb is

    -- Component Declaration for the Unit Under Test (UUT)
    component alu_8bit
    Port (
        a : in signed (7 downto 0);
        b : in signed (7 downto 0);
        opcode : in std_logic_vector (3 downto 0);
        v : out std_logic;
        op : out signed (15 downto 0)
    );
    end component;

    -- Inputs
    signal a : signed(7 downto 0) := (others => '0');
    signal b : signed(7 downto 0) := (others => '0');
    signal opcode : std_logic_vector(3 downto 0) := (others => '0');

    -- Outputs
    signal v : std_logic;
    signal op : signed(15 downto 0);

    -- Delay constant for reading waveforms
    constant delay : time := 10 ns;

begin

    -- Instantiate the Unit Under Test (UUT)
    dut: alu_8bit port map (
            a => a,
            b => b,
            opcode => opcode,
            v => v,
            op => op
        );

    -- Stimulus process
    stim_proc: process
    begin
        -- Initialize v signal state (due to latched behavior in source)
        v <= '0';
        
        -- Test 0000: Addition
        a <= to_signed(15, 8);
        b <= to_signed(10, 8);
        opcode <= "0000";
        wait for delay;

        -- Test 0001: Subtraction
        opcode <= "0001";
        wait for delay;

        -- Test 0010: Multiplication
        opcode <= "0010";
        wait for delay;

        -- Test 0011: Division (Normal)
        opcode <= "0011";
        wait for delay;

        -- Test 0011: Division by Zero (Expected: op = x"ffff", v = '1')
        b <= to_signed(0, 8);
        opcode <= "0011";
        wait for delay;

        -- Test 0110: NOT A
        a <= "11110000";
        opcode <= "0110";
        wait for delay;

        -- Test 0111: AND
        a <= "11001100";
        b <= "10101010";
        opcode <= "0111";
        wait for delay;

        -- Test 1000: XOR
        opcode <= "1000";
        wait for delay;

        -- Test 1010: Shift Left by B (Shift A left by 2)
        a <= to_signed(4, 8);
        b <= to_signed(2, 8);
        opcode <= "1010";
        wait for delay;

        -- Test 1101: A cube with limit trigger (A >= 32)
        a <= to_signed(35, 8);
        opcode <= "1101";
        wait for delay;

        -- Test 1110: (a*a) - (b/2)
        -- Let a = 5 (a^2 = 25) and b = 10 (b/2 = 5). Expected temp = 20.
        a <= to_signed(5, 8);
        b <= to_signed(10, 8);
        opcode <= "1110";
        wait for delay;

        -- Test 1111: (b*b) - (b mod a)
        -- Let b = 4 (b^2 = 16) and a = 3 (4 mod 3 = 1). Expected temp = 15.
        a <= to_signed(3, 8);
        b <= to_signed(4, 8);
        opcode <= "1111";
        wait for delay;

        -- End simulation
        wait;
    end process;

end behavior;
