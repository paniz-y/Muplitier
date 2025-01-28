LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY  oneByOneMul_tb is
END ENTITY oneByOneMul_tb;

ARCHITECTURE test OF oneByOneMul_tb IS 
    COMPONENT oneByOneMul is
        PORT (x, y : IN  STD_LOGIC;
        o : OUT STD_LOGIC);
    END COMPONENT oneByOneMul;

    SIGNAL x : STD_LOGIC := '0';
    SIGNAL y : STD_LOGIC := '0';
    SIGNAL o : STD_LOGIC;
    
    BEGIN 
        UUT: oneByOneMul
            PORT MAP(
            x => x,
            y => y,
            o => o
        );
        inputs_proc : PROCESS 
        BEGIN 
            x <= '0';
            y <= '0';
            WAIT FOR 10 ns;
            x <= '1';
            y <= '0';
            WAIT FOR 10 ns;
            x <= '0';
            y <= '1';
            WAIT FOR 10 ns;
            x <= '1';
            y <= '1';
            WAIT FOR 10 ns;

        END PROCESS;
END;

 
