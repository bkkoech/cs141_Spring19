`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Spring 2019
// Module Name:    alu 
// Author(s): [[your name here]]
// Description: CS 141 programming assignment 2
//
//
//////////////////////////////////////////////////////////////////////////////////
`include "alu_defines.v"

module alu(X,Y,Z,op_code, equal, overflow, zero);

	//Parameters
	parameter N = 32;
	
	//port definitions - customize for different bit widths
	input  wire [N-1:0] X;
	input  wire [N-1:0] Y;
	output wire [N-1:0] Z;
	input  wire [3:0] op_code;
	
	output wire equal, overflow, zero;
	
	wire [N-1:0] and_out, or_out, xor_out, nor_out, add_out, sub_out, slt_out, srl_out, sll_out, sra_out, reserved, not_connected;
	
	
	//define and assign operations 
	assign and_out = X & Y; // and
	assign or_out = X | Y; // or
	assign xor_out = X ^ Y; // xor
	assign nor_out = ~or_out; // nor
	
	// implement adder
	adder_32_bit #(.N(N)) ADDER (.A(X), .B(Y), .Cout(overflow), .Z(add_out));

	assign sub_out = 'b0; // pass zeros until implemented
	assign slt_out = 'b0; // pass zeros until implemented
	assign srl_out = 'b0; //pass zeros until implemented
	assign sll_out = 'b0; //pass zeros until implemented
	assign sra_out = 'b0; //pass zeros until implemented
	assign reserved = 'b0; // pass in zeros for the reserved op codes
	assign not_connected = 'b0; // pass in zeros for the outputs that are not connected
	
	//Other ALU outputs; To be implemented in Part 2
	assign equal = 1'b0;
	assign zero = 1'b0;
	
	//connect to mux
	mux_16to1 #(.N(N)) MUX_0 (.A(and_out), .B(or_out), .C(xor_out), .D(nor_out) , .E(reserved), .F(add_out), .G(sub_out), .H(slt_out), .I(srl_out), .J(sll_out), .K(sra_out), .L(reserved) , .M(reserved), .N(reserved), .O(reserved), .P(reserved), .S(op_code), .Z(Z));

	
	
   //YOUR CODE HERE - remember to use a separate file for each module you create


endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire
