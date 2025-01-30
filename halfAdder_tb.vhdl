LIBRARY IEEE;
USE ieee.std_logic_1164.all;

ENTITY halfAdder_tb IS 
END ENTITY halfAdder_tb;

ARCHITECTURE test OF halfAdder_tb IS 
    COMPONENT halfAdder IS
    PORT (x, y  : IN STD_LOGIC;
          s, Cout  : OUT STD_LOGIC);
    END COMPONENT halfAdder;

    SIGNAL x : STD_LOGIC := '0';
    SIGNAL y : STD_LOGIC := '0';

    SIGNAL s : STD_LOGIC;
    SIGNAL Cout : STD_LOGIC;

    BEGIN 
        UUT: halfAdder 
            PORT MAP(
                x => x,
                y => y,
                s => s,
                Cout => Cout
            );
        input_proc : PROCESS 
        BEGIN 
            x <= '0';
            y <= '0';
            WAIT FOR 10 ns;
            x <= '0';
            y <= '1';
            WAIT FOR 15 ns;
            x <= '1';
            y <= '0';
            WAIT FOR 20 ns;
            x <= '1';
            y <= '1';
            WAIT FOR 25 ns;
            END PROCESS;
    END;

