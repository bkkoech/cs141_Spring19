`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    mux_2to1 
// Author(s):  Billy Koech
// Description: Two to 1 multiplexer
//
//
//////////////////////////////////////////////////////////////////////////////////
module mux_2to1(X,Y,S,Z); // declare new module 

	parameter N = 32; // 32 bits by default
	
	//port definitions - customize for different bit widths
	input wire [N-1:0] X, Y; //two N bit input buses
	input wire S; // select signal wire 
	output wire [N-1:0] Z; // one N bit output bus
	
	assign Z = S ? Y : X; // mux


endmodule // end of the module
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire
