`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    mux_4to1 
// Author(s): 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
module mux_4to1(A,B,C,D,S,Z);

	//port definitions - customize for different bit widths
	input wire [31:0] A,B,C,D; // 4 32 bit input buses
	input wire [1:0] S; // 2 bit signal select bus
	output wire [31:0] Z; // one 32 bit output bus
	
	
	//instantiate hardware
   wire mux_0_out , mux_1_out;
	mux_2to1 MUX0 (.X(A) , .Y(B) , .S(S[0]) , .Z(mux_0_out));
	mux_2to1 MUX1 (.X(C) , .Y(D) , .S(S[0]) , .Z(mux_1_out));
	mux_2to1 MUX2 (.X(mux_0_out) , .Y(mux_1_out) , . S(S[1]), .Z(Z));
	
endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire
