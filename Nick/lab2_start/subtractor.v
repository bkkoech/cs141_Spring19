`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    subtractor 
// Author(s): 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
module subtractor(A, B, Cout, Z);

	//parameter definitions
	parameter N = 32;
	
	//inputs and output
	input wire [N-1:0] A, B;
	output wire [N-1:0] Z;
	output wire Cout;
	
	// Invert B and pass Cin = 1
	adder_32_bit #(.Cin(1)) ADDER_1 (.A(A), .B(~B), .Cout(Cout), .Z(Z));



endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire
