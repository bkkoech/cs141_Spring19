`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs

`include "mips_op_codes_defines.v"

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
	output wire [5:0] op;
	output wire [4:0] rs, rt, rd, shamt;
	output wire [5:0] funct;
	output wire [15:0] imm;
	output wire [25:0] addr;
	
	//TODO

endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire
