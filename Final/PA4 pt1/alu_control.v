`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs

`include "mips_funct_defines.v"
`include "mips_op_codes_defines.v"

//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    alu_control 
// Author(s): 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
module alu_control(clk, rst, ALUOp, ALUControl, funct);
	input wire clk, rst;
	input wire [1:0] ALUOp;
	input wire [5:0] funct;
	output wire [3:0] ALUControl;
	
	always @*
	begin
		if (ALUOp == 2'b00)

		else if (ALUOp == 2'b01)

		else
	end


endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire
