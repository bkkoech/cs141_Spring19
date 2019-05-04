`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs

`include "alu_defines.v"
`include "mips_op_codes_defines.v"
`include "mips_funct_defines.v"


//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    3to1_mux 
// Author(s): 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
module three_to1_mux(in0, in1, in2, select, out);
	parameter N=32;

	input wire [N-1:0] in0, in1, in2;
	input wire [1:0] select;
	output wire [N-1:0] out;

	reg [N-1:0] mux_output;
	
	always @(*) begin
		case(select)
			2'd0 : mux_output = in0;
			2'd1 : mux_output = in1;
			2'd2 : mux_output = in2;
			default : mux_output = 0;
		endcase
	end

	assign out = mux_output;

endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire
