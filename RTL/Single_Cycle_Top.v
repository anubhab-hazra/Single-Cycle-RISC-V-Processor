`timescale 1ns / 1ps

module Single_Cycle_Top #(
   parameter MEM_WORDS = 16384,
   parameter INIT_FILE = "instructions.txt"
)(
			input 	      clk,reset,
			output [31:0] WriteData,DataAddr,
			output 	      MemWrite );

   wire [31:0] 			      PC, Instr, ReadData;

   Single_Cycle_Core core_top (
			       .clk(clk),
			       .reset(reset),
			       .Instr(Instr),
			       .ReadData(ReadData),
			       .PC(PC),
			       .MemWrite(MemWrite),
			       .ALUResult(DataAddr),
			       .WriteData(WriteData) );

   Data_Memory #(.WORDS(MEM_WORDS), .INIT_FILE(INIT_FILE)) Data_Memory (
                                    .IA(PC),
                                    .Instr(Instr),
			    .clk(clk),
			    .WE(MemWrite),
			    .funct3(Instr[14:12]),
			    .A(DataAddr),
			    .WD(WriteData),
			    .RD(ReadData) );

endmodule