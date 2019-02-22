`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    logical_shift_right 
// Author(s): 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
module logical_shift_right(A, B, Z);


	
	//parameter definitions	
	parameter N = 32;
	
	input wire [N-1:0] A, B;
	output wire [N-1:0] Z;
	
	wire p [31:0]; //connector
	
	assign p [31:0] = 32'b0; // set everying to zero
	
	
	generate
		genvar i;
		for (i = 31; i > -1  ; i = i - 1) begin	
			assign p[i] = A[i];
			mux_32to1 #(.Q(N)) logical_shift_right_gen (.A(p[31]), .B(p[30]), .C(p[29]), .D(p[28]) , .E(p[27]), .F(p[26]), .G(p[25]), .H(p[24]), .I(p[23]), .J(p[22]), .K(p[21]), .L(p[20]) , .M(p[19]), .N(p[18]), .O(p[17]), .P(p[16]), .AA(p[15]), .BB(p[14]), .CC(p[13]), .DD(p[12]) , .EE(p[11]), .FF(p[10]), .GG(p[9]), .HH(p[8]), .II(p[7]), .JJ(p[6]), .KK(p[5]), .LL(p[4]) , .MM(p[3]), .NN(p[2]), .OO(p[1]), .PP([0]), .S(S[4:0]), .Z(Z[i]));
			
		end
	endgenerate
	
	assign Cout = carrys[N];
	


endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire
