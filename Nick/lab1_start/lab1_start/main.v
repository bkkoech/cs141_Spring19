`timescale 1ns / 1ps  //sets the timescale (for simulation)
`default_nettype none //overrides default behaviour: errors when a net type is not declired

module main(switch, led);
	// declare inputs and outputs
	input wire [7:0] switch;
	output wire [7:0] led;

	assign led[7:4] = 4'b0000;
	assign led[0] = switch[0] & switch[1]; // 2-bit AND gate
	assign led[1] = ~(switch[2] & ~switch[3]); // derived through inverted sum-of-products 
	assign led[2] = ~^switch; // 8-bit XNOR
	assign led[3] = switch[4] ? led[0] : led[1]; // MUX
	
	
endmodule

`default_nettype none //reengages default behaviour: needed for other Xilinx modules

