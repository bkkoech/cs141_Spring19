`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    non_arch_reg 
// Author(s): 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
module non_arch_reg(clk, rst, enable, data_in, data_out);
	parameter N = 32;
	input wire clk, rst, enable;
	input wire [N-1:0] data_in;
	output wire [N-1:0] data_out;
	output wire [N-1:0] data_out;



endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire
