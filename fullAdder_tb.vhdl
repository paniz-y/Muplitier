LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY fullAdder_tb IS 
END ENTITY fullAdder_tb;

ARCHITECTURE test OF fullAdder_tb IS 
    COMPONENT fullAdder IS 
    PORT (Cin, x, y : IN STD_LOGIC;
          s, Cout   : OUT STD_LOGIC);
    END COMPONENT fullAdder;

    SIGNAL x : STD_LOGIC := '0';
    SIGNAL y : STD_LOGIC := '0';
    SIGNAL Cin : STD_LOGIC := '0';

    SIGNAL s : STD_LOGIC;
    SIGNAL Cout : STD_LOGIC;

    BEGIN 
        UUT: fullAdder 
            PORT MAP(
                x => x,
                y => y,
                Cin => Cin,
                s => s,
                Cout => Cout
            );
        inputs_proc : PROCESS
        BEGIN 
            x <= '0';
            y <= '0';
            Cin <= '0';
            WAIT FOR 10 ns;
            x <= '0';
            y <= '0';
            Cin <= '1';
            WAIT FOR 15 ns;
            x <= '0';
            y <= '1';
            Cin <= '0';
            WAIT FOR 20 ns;
            x <= '0';
            y <= '1';
            Cin <= '1';
            WAIT FOR 25 ns;
            x <= '1';
            y <= '0';
            Cin <= '0';
            WAIT FOR 30 ns;
            x <= '1';
            y <= '0';
            Cin <= '1';
            WAIT FOR 35 ns;
            x <= '1';
            y <= '1';
            Cin <= '0';
            WAIT FOR 40 ns;
            x <= '1';
            y <= '1';
            Cin <= '1';
            WAIT FOR 45 ns;
            END PROCESS;
    END;