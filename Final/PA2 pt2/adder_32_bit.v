`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    adder_32_bit 
// Author(s): 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
module adder_32_bit(A, B, Cout, Z);

	//parameter definitions
	parameter N = 32;
	
	input wire [N-1:0] A, B;
	output wire [N-1:0] Z;
	output wire Cout;
	
	wire carrys [N:0];
	
	assign carrys[0] = 0;
	
	generate
		genvar i;
		for (i = 0; i < N; i = i + 1) begin
			one_bit_full_adder adder_gen (.A(A[i]), .B(B[i]), .Cin(carrys[i]), .Cout(carrys[i+1]), .Z(Z[i]));
		end
	endgenerate
	
	assign Cout = carrys[N];
	

endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire
