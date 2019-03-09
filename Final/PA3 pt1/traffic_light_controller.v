`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    traffic_light_controller 
// Author(s): 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
//define states
`define IDLE 4'b0000
`define ped_15s_LOAD 4'b0001
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

module traffic_light_controller(clk, rst, timer_en, timer_load, timer_init, timer_out, 
										  car_ns, car_ew, ped, light_ns, light_ew, light_ped);

	//port definitions 
	input clk, rst, car_ns, car_ew, ped;
	input wire [3:0] timer_out;
	
	output reg [3:0] timer_init; 
	output reg [2:0] light_ns, light_ew; 
	output reg [1:0] light_ped;
	output reg timer_load, timer_en;

	reg [3:0] state, next_state; 
	reg NSEW_flag; // NSEW_flag; 
	
	
	//change to next state and change value of any internal register
	always @(posedge clk or posedge rst) begin 
		if (rst) begin
			state <= `IDLE; 
		end
		else
			state <= next_state;
	end 
	
	//triggers on change of state or inputs
	always @(state, timer_out, rst, ped, car_ns, car_ew, NSEW_flag) begin 
		case (state) 
				`IDLE : begin 
					if(~NSEW_flag) begin
						NSEW_flag = 1;
					end
					//set outputs
					light_ns = `LIGHT_RED;
					light_ew = `LIGHT_RED;
					light_ped = `PED_NEITHER; 
					timer_en = 0; 
					timer_load = 0; 
					timer_init = 4'b0000;

					
					next_state = `ped_15s_LOAD;
				end
				
				`ped_15s_LOAD : begin 
					//set outputs
					light_ns = `LIGHT_RED;
					light_ew = `LIGHT_RED;
					light_ped = `PED_NEITHER; 
					timer_en = 0; 
					timer_load = 1; 
					timer_init = 4'b1111;

					
					next_state = `PEDESTRIAN;
				
				end
				
				`PEDESTRIAN : begin 
					//set outputs
					light_ns = `LIGHT_RED;
					light_ew = `LIGHT_RED;
					light_ped = `PED_BOTH; 
					timer_en = 1; 
					timer_load = 0; 
					timer_init = 4'b1111;

					
					//if 1 0 
					if (car_ns & ~car_ew & (timer_out == 4'b0000)) begin
						next_state = `NS_10s_LOAD;
					end
					// if 0 1
					else if (~car_ns & car_ew & (timer_out == 4'b0000)) begin
						next_state = `EW_10s_LOAD;
					end
					// if both 1 or 0
					else if ( ((car_ns & car_ew) | (~car_ns & ~car_ew)) & (NSEW_flag) & (timer_out == 4'b0000)) begin
						next_state = `NS_10s_LOAD;
					end
					else if ( ((car_ns & car_ew) | (~car_ns & ~car_ew)) & (~NSEW_flag) & (timer_out == 4'b0000)) begin
						next_state = `EW_10s_LOAD;
					end
					else begin
						//stay in the same state
						next_state = `PEDESTRIAN;
					end
				
				end
				
				`NS_10s_LOAD : begin 
					//set outputs
					light_ns = `LIGHT_RED;
					light_ew = `LIGHT_RED;
					light_ped = `PED_NS; 
					timer_en = 0; 
					timer_load = 1; 
					timer_init = 4'b1010;

					next_state = `NS_GREEN;
				
				end
				
				`EW_10s_LOAD : begin 
					//set outputs
					light_ns = `LIGHT_RED;
					light_ew = `LIGHT_RED;
					light_ped = `PED_EW; 
					timer_en = 0; 
					timer_load = 1; 
					timer_init = 4'b1010;

					next_state = `EW_GREEN;
				
				end
				
				`NS_GREEN : begin 
					//set outputs
					light_ns = `LIGHT_GREEN; //GREEN
					light_ew = `LIGHT_RED; //RED
					light_ped = `PED_NS; //NS PED
					timer_en = 1; 
					timer_load = 0; 
					timer_init = 4'b1010;
					NSEW_flag = 0;

					if (timer_out == 4'b0000) begin
						next_state = `NS_5s_LOAD;
					end
					else begin
						// Stay in the same state
						next_state = `NS_GREEN;
					end
				
				end
					
				`EW_GREEN : begin 
					//set outputs
					light_ns = `LIGHT_RED; //RED
					light_ew = `LIGHT_GREEN; //GREEN
					light_ped = `PED_EW; //EW PED
					timer_en = 1; 
					timer_load = 0; 
					timer_init = 4'b1010;
					NSEW_flag = 1;

					if (timer_out == 4'b0000) begin
						next_state = `EW_5s_LOAD;
					end
					else begin
						// stay in the same state
						next_state = `EW_GREEN;
					end
				
				end
				
				`NS_5s_LOAD : begin 
					//set outputs
					light_ns = `LIGHT_GREEN; //GREEN
					light_ew = `LIGHT_RED; //RED
					light_ped = `PED_NS; //NS PED
					timer_en = 0; 
					timer_load = 1;  //LOAD
					timer_init = 4'b0101; //5


					next_state = `NS_YELLOW;

				
				end
				
				`EW_5s_LOAD : begin 
					//set outputs
					light_ns = `LIGHT_RED; //RED
					light_ew = `LIGHT_GREEN; //GREEN
					light_ped = `PED_EW; //EW PED
					timer_en = 0; 
					timer_load = 1;  //LOAD
					timer_init = 4'b0101; //5

					next_state = `EW_YELLOW;
					
				
				end
				
				`NS_YELLOW : begin 
					//set outputs
					light_ns = `LIGHT_YELLOW; //YELLOW
					light_ew = `LIGHT_RED; //RED
					light_ped = `PED_NS; //NS PED
					timer_en = 1; 
					timer_load = 0;  //LOAD
					timer_init = 4'b0101; //5

					if (ped & (timer_out == 4'b0000)) begin
						next_state = `ped_15s_LOAD;
					end
					else if (~ped & (timer_out == 4'b0000)) begin //(~ped & (timer_out == 4'b0000)
						next_state = `EW_10s_LOAD;
					end
					else begin
						//stay in the same state
						next_state = `NS_YELLOW;
					end
					
				
				end
				
				`EW_YELLOW : begin 
					//set outputs
					light_ns = `LIGHT_RED; //RED
					light_ew = `LIGHT_YELLOW; //YELLOW
					light_ped = `PED_EW; //EW PED
					timer_en = 1; 
					timer_load = 0;  //0
					timer_init = 4'b0101; //5

					if (ped & (timer_out == 4'b0000)) begin
						next_state = `ped_15s_LOAD;
					end
					else if (~ped & (timer_out == 4'b0000)) begin //(~ped & (timer_out == 4'b0000)
						next_state = `NS_10s_LOAD;
					end
					else begin
						//Stay in the same state
						next_state = `EW_YELLOW;
					end
					
				
				end

				
				default : begin 
					light_ns = `LIGHT_RED;
					light_ew = `LIGHT_RED;
					light_ped = `PED_NEITHER; 
					timer_en = 0; 
					timer_load = 1;
					timer_init = 4'b1111;	
					
					next_state = `IDLE; 
					
				end
		endcase
	end 

endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire
