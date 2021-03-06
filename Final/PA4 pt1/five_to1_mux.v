`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs

`include "alu_defines.v"
`include "mips_op_codes_defines.v"
`include "mips_funct_defines.v"


//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    5to1_mux 
// Author(s): 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
module five_to1_mux(in0, in1, in2, in3, in4, select, out);
	parameter N=32;

	input wire [N-1:0] in0, in1, in2, in3, in4;
	input wire [2:0] select;
	output wire [N-1:0] out;

	reg [N-1:0] mux_output = 32'b0;
	
	always @(*) begin
		case(select)
			3'd0 : mux_output = in0;
			3'd1 : mux_output = in1;
			3'd2 : mux_output = in2;
			3'd3 : mux_output = in3;
			3'd4 : mux_output = in4;
			default    : mux_output = 0;
		endcase
	end

	assign out = mux_output;

endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire
