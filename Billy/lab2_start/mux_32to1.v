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
module mux_32to1(A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,AA,BB,CC,DD,EE,FF,GG,HH,II,JJ,KK,LL,MM,NN,OO,PP,S,Z);


	parameter Q = 32; //32 bits by default
	
	//port definitions - customize for different bit widths
	input wire [Q-1:0] A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,AA,BB,CC,DD,EE,FF,GG,HH,II,JJ,KK,LL,MM,NN,OO,PP; // 32 32bit input buses
	input wire [4:0] S; // 4bit signal select bus
	output wire [Q-1:0] Z; // 1 32bit output bus
	
	
	//instantiate hardware
   wire [Q-1:0] mux_0_out , mux_1_out;
	mux_16to1 #(.Q(Q)) MUX_0 (.A(A), .B(B), .C(C), .D(D) , .E(E), .F(F), .G(G), .H(H), .I(I), .J(J), .K(K), .L(L) , .M(M), .N(N), .O(O), .P(P), .S(S[3:0]), .Z(mux_0_out));; // 16 to 1 mux
	mux_16to1 #(.Q(Q)) MUX_1 (.A(AA), .B(BB), .C(CC), .D(DD) , .E(EE), .F(FF), .G(GG), .H(HH), .I(II), .J(JJ), .K(KK), .L(LL) , .M(MM), .N(NN), .O(OO), .P(PP), .S(S[3:0]), .Z(mux_1_out));; // 16 to 1 mux
	mux_2to1 #(.N(Q)) MUX2 (.X(mux_0_out) , .Y(mux_1_out) , .S(S[4]), .Z(Z)) ; // 2 to 1



endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire
