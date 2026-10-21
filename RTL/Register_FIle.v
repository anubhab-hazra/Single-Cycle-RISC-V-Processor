`timescale 1ns / 1ps
`include "logger.vh"

// This register file has two read ports and one write port.
// clk
// Write performed using enable WE3, address WA2 and data WD3
// Read 1 performed using RA1, and collected at RD1
// Read 2 performed using RA2, and collected at RD2

module Register_File(
		     input wire 	clk, WE3,
		     input wire [4:0] 	RA1,RA2,WA3,
		     input wire [31:0] 	WD3,
		     output wire [31:0] RD1,RD2
		     );

   reg [31:0] 				REG_MEM_BLOCK[31:0];

// x0 is hardwired to zero; discard writes as well as forcing reads.
   always@(posedge clk)
     begin
	if(WE3 && WA3 != 0) begin
	   REG_MEM_BLOCK[WA3] <= WD3;
`ifdef DEBUG_LOG
	   `LOG_INFO(("[RegFile   ] x%0d <= 0x%08h", WA3, WD3))
`endif
	end
     end

// This is the benefit of the RISC-V ISA specifying that the R0 is always hardcoded to 0
// If RA1 or RA2 is 0, then the data is always 0
   assign RD1 = (RA1 != 0) ? REG_MEM_BLOCK[RA1] : 0;
   assign RD2 = (RA2 != 0) ? REG_MEM_BLOCK[RA2] : 0;

endmodule