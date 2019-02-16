`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    mux_16to1 
// Author(s): 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
module mux_16to1(A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,S,Z);

	//port definitions - customize for different bit widths
	input wire [31:0] A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P; // 16 32bit input buses
	input wire [3:0] S; // 4bit signal select bus
	output wire [31:0] Z; // 1 32bit output bus
	
	
	//instantiate hardware
   wire [31:0] mux_0_out , mux_1_out;
	mux_8to1 MUX0 (.E(A) , .F(B) , .G(C), .H(D), .I(E), .J(F), .K(G), .L(H) , .S(S[2:0]), .Z(mux_0_out)); // 8 to 1
	mux_8to1 MUX1 (.E(I) , .F(J) , .G(K), .H(L), .I(M), .J(N), .K(O), .L(P) , .S(S[2:0]), .Z(mux_1_out)); // 8 to 1
	mux_2to1 MUX2 (.X(mux_0_out) , .Y(mux_1_out) , .S(S[3]), .Z(Z)) ; // 2 to 1


endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire
