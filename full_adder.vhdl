LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY fullAdder IS 
    PORT (x, y, Cin : IN STD_LOGIC;
          s, Cout   : OUT STD_LOGIC);
END fullAdder;

ARCHITECTURE logicFunc OF fullAdder IS 
BEGIN 
    s <= x XOR y XOR Cin;
    Cout <= (x AND y) OR (Cin AND x) OR (Cin AND y);
END logicFunc;