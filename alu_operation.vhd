library IEEE;

use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use work.cpu_types.all;

package alu_operation is 
	
--	function "+" (left, right : in s_halfword) return s_halfword;
--	function "-" (left, right : in s_halfword) return s_halfword;
--	function "*" (left, right : in s_halfword) return s_prod;
	function alu (A, B : in s_halfword; alu_op : op_code) return s_halfword;
	
end alu_operation;

package body alu_operation is 
	
	function alu (A, B : in s_halfword; alu_op : op_code) return s_halfword is	 
		variable s_A, s_B : s_halfword := x"0000";
		variable result : s_prod;
	begin
		
		s_A := signed(A);
		s_B := signed(B);
		
		case alu_op is 
			when add => 
				return s_A + s_B;
			when sub =>
				return s_A - s_B;
			when mult =>
				result := s_A * s_B;
				return result(15 downto 0);	
			when passA =>
				return s_A;
			when passB =>
				return s_B;
			when ldi =>
				return s_A + 0;
			when lh =>
				return s_A + 0;
			when sh => 
				return s_A;
			when others =>
				return "ZZZZZZZZZZZZZZZZ";
			
		end case; 
		
	end alu;
		
	
end alu_operation;
	
	