library IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY TwoByTwoMul_tb IS
END TwoByTwoMul_tb;

ARCHITECTURE test OF TwoByTwoMul_tb IS
    COMPONENT TwoByTwoMul IS
        PORT (x, y : IN STD_LOGIC_VECTOR(1 downto 0);
        P : OUT STD_LOGIC_VECTOR(3 downto 0)
        );
    END COMPONENT TwoByTwoMul;

    SIGNAL x, y : STD_LOGIC_VECTOR(1 downto 0);
    SIGNAL P : STD_LOGIC_VECTOR(3 downto 0);

    BEGIN
    UUT : TwoByTwoMul
        port map (
            x => x,
            y => y,
            P => P
        );


    inputs_proc:process
    BEGIN
        x <= "00";
        y <= "00";
        WAIT FOR 10 ns;

        x <= "00";
        y <= "01";
        WAIT FOR 15 ns;

        x <= "00";
        y <= "10";
        WAIT FOR 20 ns;

        x <= "00";
        y <= "11";
        WAIT FOR 25 ns;

        x <= "01";
        y <= "00";
        WAIT FOR 30 ns;

        x <= "01";
        y <= "01";
        WAIT FOR 35 ns;

        x <= "01";
        y <= "10";
        WAIT FOR 40 ns;

        x <= "01";
        y <= "11";
        WAIT FOR 45 ns;

        x <= "10";
        y <= "00";
        WAIT FOR 50 ns;

        x <= "10";
        y <= "01";
        WAIT FOR 60 ns;

        x <= "10";
        y <= "10";
        WAIT FOR 65 ns;

        x <= "10";
        y <= "11";
        WAIT FOR 70 ns;

        x <= "11";
        y <= "00";
        WAIT FOR 75 ns;

        x <= "11";
        y <= "01";
        WAIT FOR 80 ns;

        x <= "11";
        y <= "10";
        WAIT FOR 85 ns;

        x <= "11";
        y <= "11";
        WAIT FOR 90 ns;

    END PROCESS;
END test;