`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    control_module 
// Author(s): 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
module control_module(clk, rst, MemRead, MemWrite, IRWrite, MemtoReg, RegDst, RegWrite, 
								ALUSrcA, ALUSrcB, ALUOp, PCSource, PCWriteCond, PCWrite, IorD);
	parameter N = 32;
	input wire clk, rst;
	output wire MemRead, MemWrite, IRWrite, MemtoReg, RegDst, RegWrite, ALUSrcA, ALUSrcB, PCSource, PCWriteCond, PCWrite, IorD;
	output wire [1:0] ALUOp;

	//FSM


endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire
