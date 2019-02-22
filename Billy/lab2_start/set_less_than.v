`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    set_less_than 
// Author(s): 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
module set_less_than(X,Y,Z);

	//parameter definitions
	parameter N = 32;
	
	//port definitions - customize for different bit widths
	input wire [N-1:0] X, Y;
	output wire [N-1:0] Z;
	
	wire [N-1:0] C;
	
	//implement SLT
	subtractor #(.N(N)) SUB (.A(X), .B(Y), .Z(C)); //subtract 
	assign Z = (~X[N-1] & ~Y[N-1] & C[N-1]) | (X[N-1] & ~Y[N-1]) | (X[N-1] & Y[N-1] & C[N-1]);


endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire
