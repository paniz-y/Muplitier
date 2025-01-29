library IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY TwoByTwoMul IS 
  PORT (A, B : IN bit_vector(1 downto 0);
        P : OUT bit_vector(3 downto 0)
    );
END TwoByTwoMul;

ARCHITECTURE TwoMul OF TwoByTwoMul IS
BEGIN
	PROCESS(A,B) IS
	BEGIN
		CASE A IS
			WHEN "00" =>
				--IF B = "00" THEN P <= "0000";
				--ELSIF B = "01" THEN P <= "0000";
				--ELSIF B = "10" THEN P <= "0000";
				P <= "0000";
				--END IF;
			WHEN "01" =>
				IF B = "00" THEN P <= "0000";
				ELSIF B = "01" THEN P <= "0001";
				ELSIF B = "10" THEN P <= "0010";
				ELSE P <= "0011";
				END IF;
			WHEN "10" =>
				IF B = "00" THEN P <= "0000";
				ELSIF B = "01" THEN P <= "0010";
				ELSIF B = "10" THEN P <= "0100";
				ELSE P <= "0110";
				END IF;
			WHEN "11" =>
				IF B = "00" THEN P <= "0000";
				ELSIF B = "01" THEN P <= "0011";
				ELSIF B = "10" THEN P <= "0110";
				ELSE P <= "1001";
				END IF;
		END CASE;
END PROCESS;
END ARCHITECTURE;