library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity input_lut is
    port (
        sw_i   : in  std_logic_vector (2 downto 0);
        code_o : out std_logic_vector (4 downto 0);
        len_o  : out std_logic_vector (2 downto 0)
    );
end input_lut;

architecture Behavior of input_lut is
    constant A : STD_LOGIC_VECTOR(2 downto 0) := "000";
    constant B : STD_LOGIC_VECTOR(2 downto 0) := "001";
    constant C : STD_LOGIC_VECTOR(2 downto 0) := "010";
    constant D : STD_LOGIC_VECTOR(2 downto 0) := "011";
    constant E : STD_LOGIC_VECTOR(2 downto 0) := "100";
    constant F : STD_LOGIC_VECTOR(2 downto 0) := "101";
    constant G : STD_LOGIC_VECTOR(2 downto 0) := "110";
    constant H : STD_LOGIC_VECTOR(2 downto 0) := "111";

begin

    process(sw_i)
    begin
        -- Characters
        case sw_i is
            when A =>
                code_o <= "00010";
                len_o  <= std_logic_vector(to_unsigned(2-1, 3));
            when B =>
                code_o <= "00001";
                len_o  <= std_logic_vector(to_unsigned(4-1, 3));
            when C =>
                code_o <= "00101";
                len_o  <= std_logic_vector(to_unsigned(4-1, 3));
            when D =>
                code_o <= "00001";
                len_o  <= std_logic_vector(to_unsigned(3-1, 3));
            when E =>
                code_o <= "00000";
                len_o  <= std_logic_vector(to_unsigned(1-1, 3));
            when F =>
                code_o <= "00100";
                len_o  <= std_logic_vector(to_unsigned(4-1, 3));
            when G =>
                code_o <= "00011";
                len_o  <= std_logic_vector(to_unsigned(3-1, 3));
            when H =>
                code_o <= "00000";
                len_o  <= std_logic_vector(to_unsigned(4-1, 3));
            when others =>
                null;
        end case;
    end process;
end Behavior;
