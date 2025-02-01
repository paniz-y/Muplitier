LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY FourByFourMul_2 IS 
    PORT (x, y : IN STD_LOGIC_VECTOR (3 downto 0);
        P : OUT STD_LOGIC_VECTOR (7 downto 0));
END FourByFourMul_2; 
  
ARCHITECTURE behavioral OF FourByFourMul_2 IS
    COMPONENT TwoByTwoMul IS
        PORT (x, y : IN STD_LOGIC_VECTOR(1 downto 0); 
            P : OUT STD_LOGIC_VECTOR(3 downto 0));
    END COMPONENT;

    COMPONENT fullAdder IS 
        PORT (Cin, x, y : IN STD_LOGIC; s, Cout : OUT STD_LOGIC); 
    END COMPONENT; 

    COMPONENT halfAdder IS 
        PORT (x, y : IN STD_LOGIC; s, Cout : OUT STD_LOGIC); 
    END COMPONENT; 

    ALIAS temp_x2 IS x(3 downto 2); 
    ALIAS temp_x1 IS x(1 downto 0); 
    ALIAS temp_y2 IS y(3 downto 2); 
    ALIAS temp_y1 IS y(1 downto 0); 

    SIGNAL partialProduct : STD_LOGIC_VECTOR (15 downto 0); 
    SIGNAL carryOuts : STD_LOGIC_VECTOR (11 downto 0);
    SIGNAL sums : STD_LOGIC_VECTOR (11 downto 0); 

BEGIN 
    MUL1: TwoByTwoMul PORT MAP (temp_x1, temp_y1, partialProduct(3 downto 0)); 
    MUL2: TwoByTwoMul PORT MAP (temp_x1, temp_y2, partialProduct(7 downto 4));
    MUL3: TwoByTwoMul PORT MAP (temp_x2, temp_y1, partialProduct(11 downto 8));
    MUL4: TwoByTwoMul PORT MAP (temp_x2, temp_y2, partialProduct(15 downto 12));

    HA1: halfAdder PORT MAP (partialProduct(4), partialProduct(2), sums(0), carryOuts(0));
    FA1: fullAdder PORT MAP (partialProduct(5), partialProduct(3), carryOuts(0), sums(1), carryOuts(1));
    HA2: halfAdder PORT MAP (partialProduct(6), carryOuts(1), sums(2), carryOuts(2));
    HA3: halfAdder PORT MAP (partialProduct(7), carryOuts(2), sums(3), carryOuts(3));

    HA4: halfAdder PORT MAP (partialProduct(8), sums(0), sums(4), carryOuts(4));
    FA2: fullAdder PORT MAP (partialProduct(9), sums(1), carryOuts(4), sums(5), carryOuts(5));
    FA3: fullAdder PORT MAP (partialProduct(10), sums(2), carryOuts(5), sums(6), carryOuts(6));
    FA4: fullAdder PORT MAP (partialProduct(11),sums(3) , carryOuts(6), sums(7), carryOuts(7));

    HA5: halfAdder PORT MAP (partialProduct(12), sums(6), sums(8), carryOuts(8));
    FA5: fullAdder PORT MAP (partialProduct(13), sums(7), carryOuts(8), sums(9), carryOuts(9));
    FA6: fullAdder PORT MAP (partialProduct(14), carryOuts(7), carryOuts(9), sums(10), carryOuts(10));
    HA6: halfAdder PORT MAP (partialProduct(15), carryOuts(10), sums(11), carryOuts(11));

    P(0) <= partialProduct(0);
    P(1) <= partialProduct(1);
    P(2) <= sums(4);
    P(3) <= sums(5);
    P(4) <= sums(8);
    P(5) <= sums(9);
    P(6) <= sums(10);
    P(7) <= sums(11);

END behavioral;