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

	//parameters
	parameter N = 32;
	
	//port definitions - customize for different bit widths
	input  wire [N-1:0] X;
	input  wire [N-1:0] Y;
	output wire [N-1:0] Z;
	input  wire [3:0] op_code;
	
	output wire equal, overflow, zero;
	
	
	wire [N-1:0] and_out, or_out, xor_out, nor_out, add_out, sub_out, slt_out, srl_out, sll_out, sra_out, reserved;
	wire overflow_add, overflow_sub; // for the overflow mux
	
	//define and assign operations 
	assign and_out = X & Y; // and
	assign or_out = X | Y; // or
	assign xor_out = X ^ Y; // xor
	assign nor_out = ~or_out; // nor
	
	// implement adder
	adder_32_bit ADDER_0 (.A(X), .B(Y), .Cout(overflow_add), .Z(add_out));
	
	// implement subtractor
	subtractor SUB_0 (.A(X), .B(Y), .Cout(overflow_sub), .Z(sub_out));
	
	//overflow mux- pass zeros for other functions except for add and subtract
	mux_16to1 #(.Q(1)) MUX_1 (.A(1'b0), .B(1'b0), .C(1'b0), .D(1'b0) , .E(1'b0), .F(overflow_add), .G(overflow_sub), .H(1'b0), .I(1'b0), .J(1'b0), .K(1'b0), .L(1'b0) , .M(1'b0), .N(1'b0), .O(1'b0), .P(1'b0), .S(op_code), .Z(overflow));

	
	//implement SLT
	set_less_than SLT_0 (.X(X), .Y(Y), .Z(slt_out));

	// implement srl by instantiating SRL module
	SRL SRL_0 (.A(X), .B(Y), .Z(srl_out));
	
	// immplement sll by instantiating SLL module
	SLL SLL_0 (.A(X), .B(Y), .Z(sll_out));

	// implement sra by instantiating SRA module
	SRA SRA_0 (.A(X), .B(Y), .Z(sra_out));

	assign reserved = 'b0; // pass in zeros for the reserved op codes
	
	//Other ALU outputs; To be implemented in Part 2
	assign equal = &(~(X^Y));
	assign zero = ~(|Z);
	
	//connect to mux
	mux_16to1 #(.Q(N)) MUX_0 (.A(and_out), .B(or_out), .C(xor_out), .D(nor_out) , .E(reserved), .F(add_out), .G(sub_out), .H(slt_out), .I(srl_out), .J(sll_out), .K(sra_out), .L(reserved) , .M(reserved), .N(reserved), .O(reserved), .P(reserved), .S(op_code), .Z(Z));
	


endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire
