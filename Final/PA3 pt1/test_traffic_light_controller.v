`timescale 1ns / 1ps


//define states
`define IDLE 4'b0000
`define 15s_LOAD 4'b0001
`define PEDESTRIAN 4'b0010
`define NS_10s_LOAD 4'b0011
`define EW_10s_LOAD 4'b0100
`define NS_GREEN 4'b0101
`define NS_5s_LOAD 4'b0111
`define EW_GREEN 4'b1000
`define EW_5s_LOAD 4'b1001
`define NS_YELLOW 4'b1010
`define EW_YELLOW 4'b1011

//useful macros
`define LIGHT_RED 3'b001
`define LIGHT_YELLOW 3'b010
`define LIGHT_GREEN 3'b100

`define PED_NS 2'b10
`define PED_EW 2'b01 
`define PED_BOTH 2'b11 
`define PED_NEITHER 2'b00

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:13:04 03/07/2019
// Design Name:   traffic_light_controller
// Module Name:   Z:/Shared files/Final/PA3 pt1/test_traffic_light_controller.v
// Project Name:  lab3_start
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: traffic_light_controller
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_traffic_light_controller;

	localparam T=20; // clock period
	reg error;
	reg timer_rst;
	
	
	
	// Inputs
	reg clk; 
	reg rst;
	wire [3:0] timer_out;
	reg car_ns;
	reg car_ew;
	reg ped;

	// Outputs
	wire timer_en;
	wire timer_load;
	wire [3:0] timer_init;
	wire [2:0] light_ns;
	wire [2:0] light_ew;
	wire [1:0] light_ped;

	// Instantiate the Unit Under Test (UUT)
	traffic_light_controller uut (
		.clk(clk), 
		.rst(rst), 
		.timer_en(timer_en), 
		.timer_load(timer_load), 
		.timer_init(timer_init), 
		.timer_out(timer_out), 
		.car_ns(car_ns), 
		.car_ew(car_ew), 
		.ped(ped), 
		.light_ns(light_ns), 
		.light_ew(light_ew), 
		.light_ped(light_ped)
	);
	
	//Instantiate timer
	timer timer_for_traffic_test (.clk(clk), .rst(timer_rst), .en(timer_en), .load(timer_load), .init(timer_init), .out(timer_out));

		//****************************************************************
		// reset for the first half cycle of timer
		//****************************************************************
		initial
		begin
			timer_rst = 1'b1;
			rst = 1'b1;
			#(T/2);
			timer_rst = 1'b0;
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
		
		
		
		initial begin
		// Initialize Inputs
		error = 0;
		car_ns = 0; // no car ns
		car_ew = 0; // no car ew
		ped = 0; // no ped
		@(negedge rst);

		//Idle state
		@(negedge clk)
		if (uut.state != `IDLE) begin
			//$display("ERROR IDLE: NS: %b, EW: %b, PED: %b, Expected %b, %b, %b: ", light_ns, `LIGHT_RED, light_ew, `LIGHT_RED, light_ped, `PED_BOTH);
			$display("ERROR IDLE. State: %b, Expected:", uut.state, `IDLE);
			error = error + 1;
		end
		
		//15s load then to pedestrian
		@(negedge clk)
		if(uut.state != `15s_LOAD) begin
			$display("ERROR PEDESTRIAN: State: %b, Expected: %b", uut.state, `15s_LOAD) ;
			error = error + 1;
		end
		
		//pedestrian should last 15s
		repeat(30)@(negedge clk)
		
		//expected output: both ped lights are off
		
		// Wait 100 ns for global reset to finish
		$display("Finished with %d errors", error);
		$finish;
		#100;
        
		// Add stimulus here
		
		

	end
      
endmodule

