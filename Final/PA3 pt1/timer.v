`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    timer_new 
// Author(s): 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
module timer(clk, rst, en, load, init, out);

	//parameter definitions
	parameter N = 4; //4 bits
	
	//port definitions - customize for different bit widths
	input wire clk, rst, en, load;
	input wire [N-1:0] init;
	output wire [N-1:0] out;

	
	// register and wire for next register value
	reg [N-1:0] r_cur, r_next;
	
	//register
	// run this at every positive edge of the clock and the reset
	always @(posedge clk, posedge rst)
	begin
		// if reset is asserted then assign 4 bit max value
		if (rst) // Highest presedence
			r_cur <= 4'b1111; // async reset to max value
		else
			r_cur <= r_next; // go to next state
	end
	
	// next-state logic (combinational)
	always @*
	begin
		// if load is asserted then set next state to the value of init
		if (load) // 2nd highest presedence
			r_next = init;
		// if current state is zero then stay at zero
		else if (r_cur == 4'b0) 
			r_next = r_cur;
		// if en is asserted then decrease by one
		else if (en) // 3rd highest presedence
			r_next = r_cur - 1'b1;
		// default case if none of the above conditions are met
		// hold the previous state
		else
			r_next = r_cur;
	end
	
	// output
	assign out = r_cur;
		

endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire
