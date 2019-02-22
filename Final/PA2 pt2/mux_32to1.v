`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    mux_32to1 
// Author(s): 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
module mux_32to1(A,S,Z);


	parameter Q = 32; //32 bits by default
	parameter N = 1; // Make each bus 1 bit
	
	//port definitions - customize for different bit widths
	input wire [Q-1:0] A; //1 32bit input bus
	input wire [4:0] S; // 4bit signal select bus
	output wire Z; // 1 32bit output bus
	
	
	//instantiate hardware
   wire mux_0_out , mux_1_out;
	mux_16to1 #(.Q(N)) MUX_0 (.A(A[0]), .B(A[1]), .C(A[2]), .D(A[3]) , .E(A[4]), .F(A[5]), .G(A[6]), .H(A[7]), .I(A[8]), .J(A[9]), .K(A[10]), .L(A[11]) , .M(A[12]), .N(A[13]), .O(A[14]), .P(A[15]), .S(S[3:0]), .Z(mux_0_out));// 16 to 1 mux
	mux_16to1 #(.Q(N)) MUX_1 (.A(A[0]), .B(A[1]), .C(A[2]), .D(A[3]) , .E(A[4]), .F(A[5]), .G(A[6]), .H(A[7]), .I(A[8]), .J(A[9]), .K(A[10]), .L(A[11]) , .M(A[12]), .N(A[13]), .O(A[14]), .P(A[15]), .S(S[3:0]), .Z(mux_1_out)); // 16 to 1 mux
	mux_2to1 #(.N(N)) MUX_2 (.X(mux_0_out) , .Y(mux_1_out) , .S(S[4]), .Z(Z)); // 2 to 1



endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire
