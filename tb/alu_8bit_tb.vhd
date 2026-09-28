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

entity alu_8bit_tb is
--  Port ( );
end alu_8bit_tb;

architecture Behavioral of alu_8bit_tb is
component alu_8bit is  
    port (
    a : in signed (7 downto 0);
    b : in signed (7 downto 0);
    opcode : in std_logic_vector (3 downto 0);
    v : out std_logic;
    op : out signed (15 downto 0)
    );
end component;
begin


end Behavioral;
