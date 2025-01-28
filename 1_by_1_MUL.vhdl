LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY oneByOneMul IS 
    PORT (x, y : IN  STD_LOGIC;
    o : OUT STD_LOGIC);
END oneByOneMul;

ARCHITECTURE Mul OF oneByOneMul IS 
BEGIN 
    o <= x AND y;
END Mul;
