LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY FourByFourMul_2 IS 
    PORT (x, y : IN STD_LOGIC_VECTOR (3 downto 0);
        P : OUT STD_LOGIC_VECTOR (7 downto 0));
END FourByFourMul_2; 
  
ARCHITECTURE behavioral OF FourByFourMul_2 IS
    COMPONENT TwoByTwoMul IS
        PORT (x, y : IN STD_LOGIC_VECTOR(1 downto 0); 
            P : OUT STD_LOGIC_VECTOR(3 downto 0) );
    END COMPONENT TwoByTwoMul;

    COMPONENT fullAdder IS 
        PORT (Cin, x, y : IN STD_LOGIC; s, 
            Cout : OUT STD_LOGIC); 
    END COMPONENT fullAdder; 

    COMPONENT halfAdder IS 
        PORT (x, y : IN STD_LOGIC; s, 
            Cout : OUT STD_LOGIC); 
    END COMPONENT halfAdder; 

    ALIAS temp_x2 IS x(3 downto 2); 
    ALIAS temp_x1 IS x(1 downto 0); 
    ALIAS temp_y2 IS y(3 downto 2); 
    ALIAS temp_y1 IS y(1 downto 0); 

    SIGNAL partialProduct : STD_LOGIC_VECTOR (15 downto 0); 
    SIGNAL carryOuts : STD_LOGIC_VECTOR (9 downto 0);
    SIGNAL sums : STD_LOGIC_VECTOR (10 downto 0); 

    BEGIN 
        MUL1: TwoByTwoMul PORT MAP (temp_x1, temp_y1, partialProduct(3 downto 0)); 
        MUL2: TwoByTwoMul PORT MAP (temp_x1, temp_y1, partialProduct(7 downto 4)); 
        MUL3: TwoByTwoMul PORT MAP (temp_x2, temp_y2, partialProduct(11 downto 8));
        MUL4: TwoByTwoMul PORT MAP (temp_x2, temp_y2, partialProduct(15 downto 12));
        HA1: halfAdder PORT MAP (partialProduct(8), partialProduct(4), sums(0), carryOuts(0));
        FA1: fullAdder PORT MAP (sums(0), partialProduct(2), carryOuts(0), sums(1), carryOuts(1));
        FA2: fullAdder PORT MAP (partialProduct(9), partialProduct(5), carryOuts(1), sums(2), carryOuts(2));
        FA3: fullAdder PORT MAP (sums(2), partialProduct(3), carryOuts(2), sums(4), carryOuts(3));
        FA4: fullAdder PORT MAP (partialProduct(12), partialProduct(10), carryOuts(3), sums(5), carryOuts(4));
        FA5: fullAdder PORT MAP (sums(5), partialProduct(6), carryOuts(4), sums(6), carryOuts(5));
        FA6: fullAdder PORT MAP (partialProduct(13), partialProduct(11), carryOuts(5), sums(7), carryOuts(6));
        FA7: fullAdder PORT MAP (sums(7), partialProduct(7), carryOuts(6), sums(8), carryOuts(7));
        HA2: halfAdder PORT MAP (partialProduct(14), carryOuts(7), sums(9), carryOuts(8));
        HA3: halfAdder PORT MAP (partialProduct(15), carryOuts(8), sums(10), carryOuts(9));

    P(0) <= partialProduct(0); 
    P(1) <= partialProduct(1); 
    P(2) <= sums(1); 
    P(3) <= sums(4); 
    P(4) <= sums(6); 
    P(5) <= sums(8); 
    P(6) <= sums(9); 
    P(7) <= sums(10); 

END behavioral ;