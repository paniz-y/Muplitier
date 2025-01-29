library IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY TwoByTwoMul_tb IS
END TwoByTwoMul_tb;

ARCHITECTURE test OF TwoByTwoMul_tb IS
    COMPONENT TwoByTwoMul IS
        PORT (A, B : IN BIT_VECTOR(1 downto 0);
        P : OUT BIT_VECTOR(3 downto 0)
        );
    END COMPONENT TwoByTwoMul;

    SIGNAL A, B : BIT_VECTOR(1 downto 0);
    SIGNAL P : BIT_VECTOR(3 downto 0);

    BEGIN
    UUT : TwoByTwoMul
        port map (
            A => A,
            B => B,
            P => P
        );


    inputs_proc:process
    BEGIN
        A <= "00";
        B <= "00";
        WAIT FOR 20 ns;

        A <= "00";
        B <= "01";
        WAIT FOR 20 ns;

        A <= "00";
        B <= "10";
        WAIT FOR 20 ns;

        A <= "00";
        B <= "11";
        WAIT FOR 20 ns;

        A <= "01";
        B <= "00";
        WAIT FOR 20 ns;

        A <= "01";
        B <= "01";
        WAIT FOR 20 ns;

        A <= "01";
        B <= "10";
        WAIT FOR 20 ns;

        A <= "01";
        B <= "11";
        WAIT FOR 20 ns;

        A <= "10";
        B <= "00";
        WAIT FOR 20 ns;

        A <= "10";
        B <= "01";
        WAIT FOR 20 ns;

        A <= "10";
        B <= "10";
        WAIT FOR 20 ns;

        A <= "10";
        B <= "11";
        WAIT FOR 20 ns;

        A <= "11";
        B <= "00";
        WAIT FOR 20 ns;

        A <= "11";
        B <= "01";
        WAIT FOR 20 ns;

        A <= "11";
        B <= "10";
        WAIT FOR 20 ns;

        A <= "11";
        B <= "11";
        WAIT FOR 20 ns;

    END PROCESS;
END test;