`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    pc_register
// Author(s): 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////

module pc_register(clk, rst, d, q, ena);

	parameter N = 32;
	input wire clk, rst, ena;
	input wire [N-1:0] d;
	output reg [N-1:0] q;

	always @(posedge rst or posedge clk) begin
		if(rst) begin
			q <= 32'h00400000;
		end
		else if (ena) begin
			q <= d;
		end
		else begin
			q <= q;
		end
	end
	
endmodule
