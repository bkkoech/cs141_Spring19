`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:40:58 02/28/2019
// Design Name:   clk_divider
// Module Name:   Z:/CS141 - Computer Architecture/cs141_Spring19/Nick/lab3_start/clk_divider_tb.v
// Project Name:  lab3_start
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: clk_divider
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module clk_divider_tb;

	localparam T=20; // clock period
	localparam N=10; // divide by
	
	// Inputs
	reg clk_in;
	reg rst;

	// Outputs
	wire clk_out;

	// Instantiate the Unit Under Test (UUT)
	clk_divider #(.N(N)) uut (
		.clk_in(clk_in), 
		.rst(rst), 
		.clk_out(clk_out)
	);

	// reset the uut
	initial begin
		// Initialize Inputs
		clk_in = 0;
		rst = 0;

		// Wait 100 ns for global reset to finish
		#100;
      
		rst = 1'b1;
		#(T/2);
		rst = 1'b0;
		#(1000);
		$finish;
	end

	// clock
	always begin
		clk_in = 1'b0;
		#(T/2);
		clk_in = 1'b1;
		#(T/2);
	end

endmodule

