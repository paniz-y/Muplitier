LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY FourByFourMul_tb IS 
END ENTITY;

ARCHITECTURE test OF FourByFourMul_tb IS
    COMPONENT FourByFourMul IS
        PORT (x, y : IN  STD_LOGIC_VECTOR(3 downto 0);
        P : OUT STD_LOGIC_VECTOR(7 downto 0));
    END COMPONENT FourByFourMul;

    SIGNAL x , y: STD_LOGIC_VECTOR (3 downto 0);
    SIGNAL P : STD_LOGIC_VECTOR (7 downto 0);

    BEGIN 
        UUT : FourByFourMul
            PORT MAP(
                x => x,
                y => y,
                P => P
            );
        inputs_proc : PROCESS 
        BEGIN 
            x <= "1110";
            y <= "1011";
            WAIT FOR 10 ns;
            x <= "1100";
            y <= "0010";
            WAIT FOR 15 ns;
            x <= "0011";
            y <= "1001";
            WAIT FOR 20 ns;
            x <= "1100";
            y <= "1010";
            WAIT FOR 25 ns;

        END PROCESS; 
END test;           