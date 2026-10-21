`timescale 1ns / 1ps

module Single_Cycle_Core(
			 input wire 	    clk, reset,
			 input wire [31:0]  Instr,
			 input wire [31:0]  ReadData,
			 output wire [31:0] PC,
			 output wire 	    MemWrite,
			 output wire [31:0] ALUResult, WriteData
			 );

   wire        MemWriteDecoded, Trap;
   assign MemWrite = MemWriteDecoded & ~reset & ~Trap;

   wire        ALUSrc, RegWrite, Jump, Zero, PCSrc, LT, LTU;
   wire        PCSrcA, CSRWrite, CSRSrc;
   wire [1:0]  ResultSrc;
   wire [2:0]  ImmSrc;
   wire [3:0]  ALUControl;

   Control_Unit Control (
			  .op(Instr[6:0]),
			  .funct3(Instr[14:12]),
			  .funct7b5(Instr[30]),
			  .Zero(Zero),
			  .LT(LT),
			  .LTU(LTU),
			  .ResultSrc(ResultSrc),
			  .MemWrite(MemWriteDecoded),
			  .PCSrc(PCSrc),
			  .ALUSrc(ALUSrc),
			  .RegWrite(RegWrite),
			  .Jump(Jump),
			  .PCSrcA(PCSrcA),
			  .CSRWrite(CSRWrite),
			  .CSRSrc(CSRSrc),
			  .ImmSrc(ImmSrc),
			  .ALUControl(ALUControl)
			  );

   Core_Datapath Datapath (
			    .clk(clk),
			    .reset(reset),
			    .ResultSrc(ResultSrc),
			    .PCSrc(PCSrc),
			    .ALUSrc(ALUSrc),
			    .RegWrite(RegWrite),
			    .PCSrcA(PCSrcA),
			    .CSRWrite(CSRWrite),
			    .CSRSrc(CSRSrc),
			    .ImmSrc(ImmSrc),
			    .ALUControl(ALUControl),
			    .Instr(Instr),
			    .ReadData(ReadData),
			    .Zero(Zero),
			    .LT(LT),
			    .LTU(LTU),
			    .PC(PC),
			    .ALUResult(ALUResult),
			    .WriteData(WriteData),
                            .Trap(Trap)
			    );

endmodule