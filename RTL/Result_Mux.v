`timescale 1ns / 1ps

// ResultSrc encoding:
//   00 = ALUResult  (R-type, I-type, LUI, AUIPC, branches)
//   01 = ReadData   (loads)
//   10 = PC+4       (JAL, JALR)
//   11 = CSRReadData (CSR instructions)

module Result_Mux (
		   input wire [31:0]  ALUResult, ReadData, PC_Plus_4, CSRReadData,
		   input wire [1:0]   ResultSrc,
		   output wire [31:0] Result
		   );

   assign Result = (ResultSrc == 2'b11) ? CSRReadData :
                    ResultSrc[1]         ? PC_Plus_4   :
                    ResultSrc[0]         ? ReadData     : ALUResult;

endmodule