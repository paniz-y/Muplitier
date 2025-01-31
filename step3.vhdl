library IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY TwoByTwoMul IS 
  PORT (x, y : IN STD_LOGIC_VECTOR(1 downto 0);
        P : OUT STD_LOGIC_VECTOR(3 downto 0)
    );
END TwoByTwoMul;

ARCHITECTURE TwoMul OF TwoByTwoMul IS
BEGIN
	--PROCESS(x,y) IS
	--BEGIN
P(0) <= x(0) AND y(0);
P(1) <= (y(0) AND x(1)) XOR (y(1) AND x(0));
P(2) <= (x(1) and x(0)) XOR x(0);
P(3) <= (x(0) AND y(0)) AND (x(1) AND y(1));
END ARCHITECTURE;