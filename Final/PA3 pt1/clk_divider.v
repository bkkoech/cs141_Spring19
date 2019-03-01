`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    clk_divider 
// Author(s): 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
module clk_divider(clk_in, rst, clk_out);

	//parameter definitions
	parameter N = 100000000; //divide by number

	//port definitions - customize for different bit widths
	input wire clk_in;
	input wire rst;
	output reg clk_out;
	
	//internal state registers and clk
	reg [31:0] r_cur;
	
	// next-state assignments
	always @(posedge clk_in, posedge rst)
	begin
		if (rst) begin
			r_cur <= 1'b0;
			clk_out <= 1'b0;
		end
		else if (r_cur >= (N/2)-1) begin
			r_cur <= 1'b0;
			clk_out <= ~clk_out;
		end
		else 
			r_cur <= r_cur + 1;
	end
	
	
endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire
