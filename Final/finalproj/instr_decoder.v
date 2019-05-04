`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs


//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    instr_decoder 
// Author(s): 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
module instr_decoder(instr, op, rs, rt, rd, shamt, funct, imm, addr);
	parameter N = 32;
	input wire [N-1:0] instr;
	output wire [5:0] op, funct;
	output wire [4:0] rs, rt, rd;
	output wire [N-1:0] shamt;
	output wire [15:0] imm;
	output wire [25:0] addr;
	
	assign op = instr[31:26];
	assign rs = instr[25:21];
	assign rt = instr[20:16];
	assign rd = instr[15:11];
	assign shamt = {27'b0, instr[10:6]};
	assign funct = instr[5:0];
	assign imm = instr[15:0];
	assign addr = instr[25:0];

endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire
