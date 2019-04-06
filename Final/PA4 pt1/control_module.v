`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
`include "mips_op_codes_defines.v"
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
`define ALU_WRITEBACK_STATE 3'b011



//useful constants

module control_module(clk, rst, MemRead, MemWrite, IRWrite, MemtoReg, RegDst, RegWrite, 
								ALUSrcA, ALUSrcB, ALUOp, PCSource, PCWriteCond, PCWrite, IorD, OP_code);
	parameter N = 32;
	//port definitions
	input wire clk, rst, Op_code, Funct;
	//use reg in procedural
	output reg MemRead, MemWrite, IRWrite, MemtoReg, RegDst, RegWrite, ALUSrcA, PCSource, PCWriteCond, PCWrite, IorD;
	output reg [1:0] ALUOp, ALUSrcB;

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
						ALUSrcB = 2'b01;
						ALUOp = 2'b00;
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
						
						//wait one clock cylce for memory to be fetched
						next_state = DECODE_STATE;
					end

					`DECODE_STATE : begin
						// wait one_clock cycle for reading and decoding to complete
						// dont change any outputs from previous state
						
						
						//check value of inputs to determine next state
						// if R-type
						if (Op_code == RTYPE) begin
							next_state = `EXECUTE_STATE;
						end
						//Other types
						//IMPLEMENT LATER
						if (Op_code == J) begin
							next_state = `DECODE_STAE;
						end
						else begin
						//stay in the same state
						next_state = `DECODE_STATE;
						end
					end
					
					`EXECUTE_STATE : begin
						// set outputs
						
						ALSrcA = 0;
						ALUSrcB = 2'b00;
						ALUOp = 2'b10;
						//dont cares
						PCSource = 0;
						IorD = 0;
						//Not Asserted
						IRWrite = 0;
						PCWrite = 0;
						MemRead = 0;
						MemWrite = 0;
						MemtoReg = 0;
						RegDst = 0;
						RegWrite = 0;
						PCWriteCond = 0; // Also known as Branch
						PCWrite = 0;
						
						//next state
						next_state = ALU_WRITEBACK_STATE;
					end
					`ALU_WRITEBACK_STATE : begin
						// set outputs
						RegDst = 1;
						MemtoReg = 0;
						//dont cares
						PCSource = 0;
						IorD = 0;
						ALSrcA = 0;
						ALUSrcB = 2'b00;
						ALUOp = 2'b10;
						//Asserted 
						RegWrite = 1;
						//Not Asserted
						IRWrite = 0;
						PCWrite = 0;
						MemRead = 0;
						MemWrite = 0;
						PCWriteCond = 0; // Also known as Branch
						PCWrite = 0;
						
						//wait one clock cylce for memory to be fetched
						next_state = FETCH_STATE;
					end
		endcase
	end 

endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire
