`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    adder_2bit 
// Author(s): 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
module adder_2bit(A,B,Cin);

	//port definitions - customize for different bit widths
	input wire A, B, Cin; //two 1 bit inputs and Carry in
	output wire Z, Cout; // one 1 bit carry out
	
	assign Z =  (A ^ B) ^ Cin;// add
	assign Cout = (A & B) | (Cin &(A ^ B)); //carry out


endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire
