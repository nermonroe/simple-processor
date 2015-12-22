-------------------------------------------------------------------------------
--
-- Title       : cpu_implementation
-- Design      : CPU
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\CPU\CPU\src\cpu_implementation.vhd
-- Generated   : Tue Dec  1 22:12:44 2015
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {cpu_implementation} architecture {behavioral}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use work.cpu_types.all;
use work.register_file.all;
use work.ram_memory.all;
use work.alu_operation.all;

entity cpu_implementation is
	 port(
	 	 clock : in sig;
	 	 instruction_cycle : inout halfword;
		 R0 : out s_halfword;
		 R1 : out s_halfword;
		 R2 : out s_halfword;
		 R3 : out s_halfword;
		 R4 : out s_halfword;
		 R5 : out s_halfword;
		 R6 : out s_halfword;
		 R7 : out s_halfword
	     );
end cpu_implementation;

--}} End of automatically maintained section

architecture behavioral of cpu_implementation is
	signal instruction : halfword;
	signal ram : ram_memory := (x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
								x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
								x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
								x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
								x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
								x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
								x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
								x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
								x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
								x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
								x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
								x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
								x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
								x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
								x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
								x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000");	 
								
	signal reg_file : register_file := (x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000"); 
	signal out_regA, out_regB : s_halfword; 
	signal fill : s_halfword := x"0000";
	signal reg_readA, reg_readB, reg_write, mem_read, mem_write : sig;
	signal H : sig := '1';
	signal L : sig := '0';
begin

program_counter : process(clock) 
	type iArray is array (0 to 14) of halfword;
	variable instruction_memory : iArray := (x"500A", x"5105", x"5200", x"5300", x"5400", x"5500", x"5600", 
											 x"5700", x"0201", x"1301", x"4401", x"630B", x"640A", x"760A", x"770B");
	variable counter : integer := 0 mod 14;
begin 
	
		if clock = '0' then
			instruction_cycle <= instruction_memory(counter);
			counter := counter + 1;
		end if;
	
end process program_counter;

cpu_behavior : process(clock)
	variable dataSig : data_sig;
	variable aluOp : op_code;
	variable alu_result : s_halfword;
	variable load_imm, load_half : s_halfword := x"0000";
	variable H : sig := '1';
	variable L : sig := '0';
begin
	
	aluOp := decode_opcode(instruction_cycle);
	dataSig := send_data_signal(aluOp);
	
	case dataSig is
		when "00" =>
			out_regA <= readRegisterB(clock, reg_file, instruction_cycle(7 downto 4), H, L);
			out_regB <= readRegisterB(clock, reg_file, instruction_cycle(3 downto 0), H, L);
			alu_result := alu(out_regA, out_regB, aluOp);
			writeToRegister(clock, alu_result, instruction_cycle(11 downto 8), reg_file, L, L, H); 
			
		when "01" =>  
			load_imm := signed(x"00"&instruction_cycle(7 downto 0));
			writeToRegister(clock, load_imm, instruction_cycle(11 downto 8), reg_file, L, L, H);
			
		when "10" => 
			load_half := readMemory(clock, instruction_cycle(7 downto 0), ram, L, H);
			writeToRegister(clock, load_half, instruction_cycle(11 downto 8), reg_file, L, L, H);
			
		when "11" =>	
			out_regA <= readRegisterA(clock, reg_file, instruction_cycle(11 downto 8), H, L);
			alu_result := alu(out_regA, fill, aluOp);
			writeToMemory(clock, instruction_cycle(7 downto 0), alu_result, ram, L, H); 
		
		when others => null;	
	
	end case; 
	
end process cpu_behavior;

	outputAllRegisters(reg_file, R0, R1, R2, R3, R4, R5, R6, R7);

end behavioral;
