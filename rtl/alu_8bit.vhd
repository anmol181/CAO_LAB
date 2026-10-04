----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/17/2026 04:21:59 PM
-- Design Name: 
-- Module Name: alu_8bit - Behavioral
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

entity alu_8bit is
    Port ( a : in signed (7 downto 0);
            b : in signed (7 downto 0);
            opcode : in std_logic_vector (3 downto 0);
            v : out std_logic;
            op : out signed (15 downto 0));
end alu_8bit;

architecture Behavioral of alu_8bit is

begin

    process(a,b,opcode)
        variable ae : signed( 15 downto 0);
        variable be : signed( 15 downto 0);
        variable temp : signed (15 downto 0);
    begin

        ae := TO_SIGNED (TO_INTEGER (a),16);
        be := TO_SIGNED (TO_INTEGER (b),16);

        case(opcode) is

        when "0000" =>
            temp := ae + be;
        when "0001" =>
            temp := ae - be;
        when "0010" =>
            temp := a*b;
        when "0011" =>
            if b=0 then
                temp := x"ffff";
                v <= '1';
            else
                temp := ae/be;
            end if;
        when "0100" =>
            temp := ae mod be;
        when "0101" =>
            temp := ae rem be;
        when "0110" =>
            temp := not ae;
            temp := temp and x"00ff";
        when "0111" =>
            temp := ae and be;
            temp := temp and x"00ff";
        when "1000" =>
            temp := ae xor be;
        when "1001" =>
            temp := ae srl to_integer(be);
        when "1010" =>
            temp := ae sll to_integer(be);
        when "1011" =>
            temp := ae ror 1;
        when "1100" =>
            temp := ae rol 1;
        when "1101" =>
            if( a >= 32 ) then
                temp := x"ffff";
                v <= '1';
            elsif (a < -32 ) then
                temp := x"ffff";
                v <= '1';
            else
                temp := ae*ae*ae;
            end if;
        when "1110" =>
            temp := (a*a) - (be/2);
        when "1111" =>
            temp := (b*b) - ( be mod ae);
        when others =>
            temp := x"0000";
            v <= '0';

        end case;
        op <= temp;

    end process;


end Behavioral;


-- list of operations
-- add,sub, mul, div,
-- mod, rem, not, xor,
-- logical shift right by b,logical shift left by b,rotate right by 1, rotate left by 1,
-- a cube,and
-- 