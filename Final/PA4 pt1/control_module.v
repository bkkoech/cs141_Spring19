`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    control_module 
// Author(s): 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
//define states, R type requires 4 states + 4 wait stats = 8 (3 bits)
`define FETCH_STATE 3'b000
`define DECODE_STATE 3'b001
`define EXECUTE_STATE 3'b010
`define ALU_STATE 3'b011
`define FETCH_WAIT 3'b100
`define DECODE_WAIT 3'b101
`define EXECUTE_WAIT 3'b110
`define ALU_WAIT 3'b111

//useful constants

module control_module(clk, rst, MemRead, MemWrite, IRWrite, MemtoReg, RegDst, RegWrite, 
								ALUSrcA, ALUSrcB, ALUOp, PCSource, PCWriteCond, PCWrite, IorD, OP_code, Funct);
	parameter N = 32;
	//port definitions
	input wire clk, rst, Op_code, Funct;
	//use reg in procedural
	output reg MemRead, MemWrite, IRWrite, MemtoReg, RegDst, RegWrite, ALUSrcA, ALUSrcB, PCSource, PCWriteCond, PCWrite, IorD;
	output reg [1:0] ALUOp;

	//FSM
	reg [2:0] state, next_state; // 3bits CHANGE IF NUMBER OF STATES CHANGES
	
	
	//change to next state and change value of any internal register
	always @(posedge clk or posedge rst) begin 
		if (rst) begin
			//reset state
			state <= `FETCH_STATE; 
		end
		else begin
			state <= next_state;
		end
	end 
	//triggers on change of state or inputs
	always @(state, rst, Op_code, Funct) begin 
		case (state) 
					`FETCH_STATE : begin
						// set outputs
						IorD = 0;
						ALSrcA = 0;
						ALUSrcB = 01;
						ALUOp = 0;
						PCSource = 0;
						//Asserted enables
						IRWrite = 1;
						PCWrite = 1;
						//Not Asserted
						MemRead = 0;
						MemWrite = 0;
						MemtoReg = 0;
						RegDst = 0;
						RegWrite = 0;
						PCWriteCond = 0; // Also known as Branch
						PCWrite = 0;
						
						//check value of inputs to determine next state
					end
		endcase
	end 

endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire
