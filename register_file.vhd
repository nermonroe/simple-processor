library IEEE;

use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use work.cpu_types.all;

package register_file is
	
	procedure writeToRegister(signal clock : in sig; instr_data : in s_halfword; reg_dest :  in nibble; signal registerFile : inout register_file; reg_readA, reg_readB : in sig; reg_write : in sig);
	function readRegisterA(signal clock : sig; regFile : register_file; reg_rsA : in nibble; reg_readA : in sig; reg_write : in sig) return s_halfword;	
	function readRegisterB(signal clock : sig; regFile : register_file; reg_rtB : in nibble; reg_readB : in sig; reg_write : in sig) return s_halfword;	 
	procedure outputAllRegisters(signal regFile : in register_file; signal R0 : out s_halfword; signal R1 : out s_halfword; signal R2 : out s_halfword; signal R3 : out s_halfword; signal R4 : out s_halfword; signal R5 : out s_halfword; signal R6 : out s_halfword; signal R7 : out s_halfword);
	
end register_file;

package body register_file is
	
procedure writeToRegister(signal clock : in sig; 
						  instr_data : in s_halfword; 
						  reg_dest :  in nibble; 
						  signal registerFile : inout register_file; 
						  reg_readA, reg_readB : in sig; 
						  reg_write : in sig) is									  
begin
	if clock = '0' and clock'event then
		if reg_write = '1' and reg_readA = '0' and reg_readB = '0' then
			registerFile(to_integer(unsigned(reg_dest))) <= instr_data;
		end if;
	end if;
		
end writeToRegister;

function readRegisterA(signal clock : sig; 
					   regFile : register_file; 
					   reg_rsA : in nibble;  
					   reg_readA : in sig; 
					   reg_write : in sig) return s_halfword is
	variable out_regA : s_halfword;					   
begin
	
	if clock = '1' and clock'event then
		if reg_readA = '1' and reg_write = '0' then
			out_regA := regFile(to_integer(unsigned(reg_rsA)));
		end if;
	end if;	
	
	return out_regA;
		
end readRegisterA; 

function readRegisterB(signal clock : sig; 
					   regFile : register_file; 
					   reg_rtB : in nibble;  
					   reg_readB : in sig; 
					   reg_write : in sig) return s_halfword is
	variable out_regB : s_halfword;					   
begin
	
	if rising_edge(clock) then
		if reg_readB = '1' and reg_write = '0' then
			out_regB := regFile(to_integer(unsigned(reg_rtB)));
		end if;
	end if;
	
	return out_regB;
		
end readRegisterB; 

procedure outputAllRegisters(signal regFile : in register_file; 
							 signal R0 : out s_halfword;	
							 signal R1 : out s_halfword; 
							 signal R2 : out s_halfword; 
							 signal R3 : out s_halfword; 
							 signal R4 : out s_halfword; 
							 signal R5 : out s_halfword; 
							 signal R6 : out s_halfword; 
							 signal R7 : out s_halfword) is
							 
begin
	
	R0 <= regFile(0);
	R1 <= regFile(1);
	R2 <= regFile(2);
	R3 <= regFile(3);
	R4 <= regFile(4);
	R5 <= regFile(5);
	R6 <= regFile(6);
	R7 <= regFile(7);
	
end outputAllRegisters;

end register_file;
		
		