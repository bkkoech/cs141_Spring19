`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    test_timer 
// Author(s): 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
module test_timer();

localparam T=20; // clock period
	reg clk, rst, load, en, error;
	reg [3:0] init;
	wire [3:0] out;

	// the .* notation automatically passes all signals that have
	// the same name as the input/output ports into the corresponding
	// port in the module
	// since every port here has the same name as the wires/regs we
	// want to pass in, we can use .* for all port assignments
	timer uut_timer (.clk(clk), .rst(rst), .en(en), .load(load), .init(init), .out(out));;

	//****************************************************************
	// reset for the first half cycle
	//****************************************************************
	initial
	begin
		rst = 1'b1;
		#(T/2);
		rst = 1'b0;
	end
	
	

	//****************************************************************
	// clock
	//****************************************************************
	// 20 ns clock running forever
	always
	begin
		clk = 1'b1;
		#(T/2);
		clk = 1'b0;
		#(T/2);
	end

	initial
	begin
		//*************************************************************
		// initial input
		//*************************************************************
		error = 0;
		load = 1'b0; // not loaded
		en = 1'b0; // not enabled
		init = 4'b0000; // 0 init value
		@(negedge rst);  // wait reset to deassert
		@(negedge clk);    // wait for one clock
		$display("start out: %d, expected: 15", out);
		if (out !== 15) begin
			$display("ERROR start out: %d, expected: 15", out);
			error = error + 1;
		end
			

		//*************************************************************
		// test load
		//*************************************************************	
		load = 1'b1; // enable load
		init = 4; // set initial value to 4
		@(negedge clk);    // wait for one clock to ensure init value is sampled
		load = 1'b0; // disable load
		@(negedge clk); // one clock cycles
		$display("test load out: %d, expected: %d", out, init);
		if (out !== init) begin
			$display(" ERROR test load out: %d, expected: %d", out, init);
			error = error + 1;
		end
		
		
		//*************************************************************
		// test reset
		//*************************************************************
		rst = 1'b1;
		@(negedge clk);
		rst = 1'b0;
		@(negedge clk);
		$display("test reset: %d, expected: 15", out);
		if (out !== 15) begin
			$display("ERROR test reset: %d, expected: 15", out);
			error = error + 1;
		end
		
		//*************************************************************
		// test down counter and pause
		//*************************************************************
		//reset to max val
		rst = 1'b1;
		@(negedge clk);
		rst = 1'b0;
		@(negedge clk);
		
		en = 1'b1; // enable
		repeat(10) @(negedge clk); // count down by 10
		en = 1'b0; //deassert enable
		@(negedge clk); // wait for one clk cycle
		$display("test down counter and pause out: %d, expected: 5", out);
		if (out !== 5) begin
			$display("ERROR test down counter and pause out: %d, expected: 5", out);
			error = error + 1;
		end
		
		//*************************************************************
		// test if timer stops at zero
		//*************************************************************
		//reset to max val
		rst = 1'b1;
		@(negedge clk);
		rst = 1'b0;
		@(negedge clk);
		
		en = 1'b1; // enable
		repeat(20) @(negedge clk); // count down by >15
		en = 1'b0; //deassert enable
		@(negedge clk); // wait for one clk cycle
		$display("test if timer stops at zero for clk cycles >15 out: %d, expected: 0", out);
		if (out !== 0) begin
			$display("ERROR if timer stops at zero for clk cycles >15 out: %d, expected: 0", out);
			error = error + 1;
		end
		
		//*************************************************************
		// test timer holds value when enable is not asserted
		//*************************************************************
		//reset to max val
		rst = 1'b1;
		@(negedge clk);
		rst = 1'b0;
		@(negedge clk);
		
		en = 1'b1; // enable
		repeat(5) @(negedge clk); // count down by 5
		en = 1'b0; //deassert enable
		repeat(5) @(negedge clk); // wait for 5 clk cycle
		$display("test timer holds value when enable is not asserted: %d, expected: 10", out);
		if (out !== 10) begin
			$display("ERROR test timer holds value when enable is not asserted: %d, expected: 10", out);
			error = error + 1;
		end
		
		//*************************************************************
		// test if reset takes presedence over enable
		//*************************************************************
		//reset to max val
		rst = 1'b1;
		@(negedge clk);
		rst = 1'b0;
		@(negedge clk);
		
		en = 1'b1; // enable
		repeat(5) @(negedge clk); // count down by 5
		rst = 1'b1; // reset while enable is still asserted
		@(negedge clk); // wait one clock cycle
		$display("test if reset takes presedence over enable: %d, expected: 15", out);
		if (out !== 15) begin
			$display("ERROR test if reset takes presedence over enable: %d, expected: 15", out);
			error = error + 1;
		end
		en = 1'b0; //deassert enable
		rst = 1'b0; // deassert reset
		
		
		//*************************************************************
		// test if reset takes presedence over load
		//*************************************************************
		//reset to max val
		rst = 1'b1;
		@(negedge clk);
		rst = 1'b0;
		@(negedge clk);
		
		load = 1'b1; // enable load
		init = 4; // set initial value to 4
		@(negedge clk);    // wait for one clock to ensure init value is sampled
		rst = 1'b1; // reset while load is still asserted
		@(negedge clk); // one clock cycle
		$display("test if reset takes presedence over load out: %d, expected: %d", out, 15);
		if (out !== 15) begin
			$display(" ERROR test if reset takes presedence over load out: %d, expected: %d", out, 15);
			error = error + 1;
		end
		load = 1'b0; //deassert load
		rst = 1'b0; // deassert reset
		@(negedge clk); // one clock cycle
		
		//*************************************************************
		// test if load takes presedence over enable
		//*************************************************************
		//reset to max val
		rst = 1'b1;
		@(negedge clk);
		rst = 1'b0;
		@(negedge clk);
		
		en = 1'b1; // enable
		repeat(5) @(negedge clk); // count down by 5
		init = 2; // set initial value to 2
		load = 1'b1; // load while enable is asserted
		@(negedge clk);    // wait for one clock to ensure init value is sampled
		$display("test if load takes presedence over load out: %d, expected: %d", out, init);
		if (out !== init) begin
			$display(" ERROR test if load takes presedence over load out: %d, expected: %d", out, init);
			error = error + 1;
		end
		load = 1'b0; //deassert load
		en = 1'b0; // deassert enable
		@(negedge clk); // one clock cycle
		
				
		// absolute delay
		#(4*T);  //  wait for 80 ns
		en = 1'b0; // pause
		#(4*T);  //  wait for 80 ns
		//*************************************************************
		// stop simulation
		//*************************************************************
		// return to interactive simulation mode
		$display("Finished with %d errors", error);
		$finish;
	end

endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire
