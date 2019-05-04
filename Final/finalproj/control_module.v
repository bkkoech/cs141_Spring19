`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
`include "mips_op_codes_defines.v"
`include "mips_funct_defines.v"
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    control_module 
// Author(s): 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
//define states
`define FETCH_STATE 			5'd0
`define DECODE_STATE 			5'd1

`define EXECUTE_R_STATE 		5'd6
`define WRITEBACK_R_STATE 		5'd7

`define WRITEBACK_WAIT_STATE 	5'd15

`define EXECUTE_I_STATE 		5'd9
`define WRITEBACK_I_STATE 		5'd10

`define EXECUTE_MEM_STATE 		5'd2
`define MEM_READ_STATE 			5'd3
`define MEM_WRITE_STATE 		5'd5
`define MEM_WRITEBACK_STATE 	5'd4

`define MEM_READ_WAIT_STATE 	5'd14

`define EXECUTE_JAL_STATE 		5'd13
`define EXECUTE_J_STATE 		5'd11
`define EXECUTE_BEQ_STATE		5'd16
`define EXECUTE_BNE_STATE		5'd17
`define WRITEBACK_JR_STATE 		5'd12

//useful constants 

module control_module(clk, rst, MemWrite, IRWrite, MemtoReg, RegDst, RegWrite, ZeroNotZero,
						ALUSrcA, ALUSrcB, ALUOp, PCSource, PCWriteCond, PCWrite, IorD, Op_code, Funct);
	parameter N = 32;
	//port definitions
	input wire clk, rst;
	input wire [5:0] Op_code, Funct;
	//use reg in procedural
	output reg MemWrite, IRWrite, MemtoReg, RegWrite, PCWriteCond, PCWrite, IorD, ZeroNotZero;
	output reg [1:0] ALUOp, PCSource, ALUSrcA, RegDst;
	output reg [2:0] ALUSrcB;

	//FSM
	reg [4:0] state, next_state; // 3bits CHANGE IF NUMBER OF STATES CHANGES
	
	
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
	always @(state, rst, Op_code) begin 
		case (state) 
					`FETCH_STATE : begin
						// set outputs
						// MULTIPLEXER SELECTS:
						IorD = 0;
						ALUSrcA = 2'b00;
						ALUSrcB = 3'b001;
						ALUOp = 2'b00;
						PCSource = 2'b00;
						ZeroNotZero = 0;
						// dont care selects
						RegDst = 2'b00;
						MemtoReg = 0;

						//ENABLE SIGNALS
						//Asserted enables
						IRWrite = 1;
						PCWrite = 1;
						//Not Asserted
						MemWrite = 0;
						RegWrite = 0;
						PCWriteCond = 0; // Also known as Branch
						
						//wait one clock cylce for memory to be fetched
						next_state = `DECODE_STATE;
					end

					`DECODE_STATE : begin
						// wait one_clock cycle for reading and decoding to complete
						// set outputs
						// MULTIPLEXER SELECTS:
						ALUSrcB = 3'b011;
						ALUSrcA = 2'b00;
						ALUOp = 2'b00;
						ZeroNotZero = 0;
						// dont care selects

						IorD = 0;
						PCSource = 2'b00;
						RegDst = 2'b00;
						MemtoReg = 0;

						//ENABLE SIGNALS
						//Asserted enables
						
						//Not Asserted
						IRWrite = 0;
						PCWrite = 0;
						MemWrite = 0;
						RegWrite = 0;
						PCWriteCond = 0; // Also known as Branch
						
						
						//check value of inputs to determine next state
						// if R-type
						if (Op_code == `RTYPE || Op_code == `MUL) begin
							next_state = `EXECUTE_R_STATE;
						end
						//J types
						else if (Op_code == `J) begin
							next_state = `EXECUTE_J_STATE;
						end
						else if (Op_code == `JAL) begin
							next_state = `EXECUTE_JAL_STATE;
						end
						//branches
						else if (Op_code == `BEQ) begin
							next_state = `EXECUTE_BEQ_STATE;
						end
						else if (Op_code == `BNE) begin
							next_state = `EXECUTE_BNE_STATE;
						end
						// I types
						else if ((Op_code == `ADDI) || (Op_code == `SLTI) || (Op_code == `ANDI) || (Op_code == `ORI) || (Op_code == `XORI)) begin
							next_state = `EXECUTE_I_STATE;
						end
						else if ((Op_code == `LW) || (Op_code == `SW)) begin
							next_state = `EXECUTE_MEM_STATE;
						end
						//stay in the same state
						else begin
							next_state = `DECODE_STATE;
						end
					end
					
					`EXECUTE_R_STATE : begin
						// set outputs

						// handling shamt for shifts
						if (Funct == `FUNCT_SLL || Funct == `FUNCT_SRL || Funct == `FUNCT_SRA ) begin
							ALUSrcB = 3'b100;
							ALUSrcA = 2'b10;
						end

						// handle jump register
						else if (Funct == `FUNCT_JR) begin
							ALUSrcA = 2'b01;
							ALUSrcB = 3'b000;
						end
						else begin
							ALUSrcB = 3'b000;
							ALUSrcA = 2'b01;
						end
						
						// MULTIPLEXER SELECTS:
						// handle MUL
						if (Op_code == `RTYPE) begin
							ALUOp = 2'b10;
						end
						else begin
							ALUOp = 2'b11;
						end
						
						ZeroNotZero = 0;
						//dont cares
						IorD = 0;
						PCSource = 2'b00;
						RegDst = 2'b00;
						MemtoReg = 0;

						//ENABLE SIGNALS
						//Asserted enables
				
						//Not Asserted
						IRWrite = 0;
						PCWrite = 0;
						MemWrite = 0;
						RegWrite = 0;
						PCWriteCond = 0; // Also known as Branch
						
						//next state
						if (Funct == `FUNCT_JR) begin
							next_state = `WRITEBACK_JR_STATE;
						end
						else begin
							next_state = `WRITEBACK_R_STATE;
						end
					end

					`EXECUTE_I_STATE : begin
						// set outputs
						
						// MULTIPLEXER SELECTS:
						ALUOp = 2'b11;
						ALUSrcA = 2'b01;
						ALUSrcB = 3'b010;
						ZeroNotZero = 0;
						//dont cares
						IorD = 0;
						PCSource = 2'b00;
						RegDst = 2'b00;
						MemtoReg = 0;

						//ENABLE SIGNALS
						//Asserted enables
				
						//Not Asserted
						IRWrite = 0;
						PCWrite = 0;
						MemWrite = 0;
						RegWrite = 0;
						PCWriteCond = 0; // Also known as Branch
						
						//next state
						next_state = `WRITEBACK_I_STATE;
					end

					`EXECUTE_J_STATE : begin
						// set outputs
						
						// MULTIPLEXER SELECTS:
						PCSource = 2'b10;
						ZeroNotZero = 0;

						//dont cares
						IorD = 0;
						RegDst = 2'b00;
						MemtoReg = 0;
						ALUOp = 2'b11;
						ALUSrcA = 2'b01;
						ALUSrcB = 3'b010;

						//ENABLE SIGNALS
						//Asserted enables
						PCWrite = 1;

						//Not Asserted
						IRWrite = 0;
						MemWrite = 0;
						RegWrite = 0;
						PCWriteCond = 0; // Also known as Branch
						
						//next state
						next_state = `WRITEBACK_WAIT_STATE;
					end

					`EXECUTE_JAL_STATE : begin
						// set outputs
						
						// MULTIPLEXER SELECTS:
						PCSource = 2'b10;
						RegDst = 2'b10;
						MemtoReg = 0;
						ZeroNotZero = 0;

						//dont cares
						IorD = 0;
						ALUOp = 2'b11;
						ALUSrcA = 2'b01;
						ALUSrcB = 3'b010;

						//ENABLE SIGNALS
						//Asserted enables
						PCWrite = 1;
						RegWrite = 1;

						//Not Asserted
						IRWrite = 0;
						MemWrite = 0;
						PCWriteCond = 0; // Also known as Branch
						
						//next state
						next_state = `WRITEBACK_WAIT_STATE;
					end

					`EXECUTE_BEQ_STATE : begin
						// set outputs
						
						// MULTIPLEXER SELECTS:
						ALUSrcA = 2'b01;
						ALUSrcB = 3'b000;
						PCSource = 2'b01;
						ALUOp = 2'b01;
						ZeroNotZero = 0;

						//dont cares
						IorD = 0;
						RegDst = 2'b00;
						MemtoReg = 0;

						//ENABLE SIGNALS
						//Asserted enables
						PCWriteCond = 1; // Also known as Branch
						
						//Not Asserted
						IRWrite = 0;
						MemWrite = 0;
						RegWrite = 0;
						PCWrite = 0;
						
						//next state
						next_state = `WRITEBACK_WAIT_STATE;
					end

					`EXECUTE_BNE_STATE : begin
						// set outputs
						
						// MULTIPLEXER SELECTS:
						ALUSrcA = 2'b01;
						ALUSrcB = 3'b000;
						PCSource = 2'b01;
						ALUOp = 2'b01;
						ZeroNotZero = 1;

						//dont cares
						IorD = 0;
						RegDst = 2'b00;
						MemtoReg = 0;

						//ENABLE SIGNALS
						//Asserted enables
						PCWriteCond = 1; // Also known as Branch
						
						//Not Asserted
						IRWrite = 0;
						MemWrite = 0;
						RegWrite = 0;
						PCWrite = 0;
						
						//next state
						next_state = `WRITEBACK_WAIT_STATE;
					end

					`EXECUTE_MEM_STATE : begin
						// set outputs
						
						// MULTIPLEXER SELECTS:
						ALUOp = 2'b00;
						ALUSrcA = 2'b01;
						ALUSrcB = 3'b010;
						ZeroNotZero = 0;

						//dont cares
						IorD = 0;
						PCSource = 2'b00;
						RegDst = 2'b00;
						MemtoReg = 0;

						//ENABLE SIGNALS
						//Asserted enables
				
						//Not Asserted
						IRWrite = 0;
						PCWrite = 0;
						MemWrite = 0;
						RegWrite = 0;
						PCWriteCond = 0; // Also known as Branch
						
						//next state
						next_state = `WRITEBACK_I_STATE;

						if (Op_code == `LW) begin
							next_state = `MEM_READ_STATE;
						end
						else if (Op_code == `SW) begin
							next_state = `MEM_WRITE_STATE;
						end
						else begin
							next_state = `EXECUTE_MEM_STATE;
						end
					end

					`MEM_READ_STATE : begin
						// set outputs
						
						// MULTIPLEXER SELECTS:
						IorD = 1;
						
						//dont cares
						RegDst = 2'b00;
						MemtoReg = 0;
						ALUSrcA = 2'b01;
						ALUSrcB = 3'b000;
						ALUOp = 2'b10;
						PCSource = 2'b00;
						ZeroNotZero = 0;

						//ENABLE SIGNALS
						//Asserted enables
						
						//Not Asserted
						RegWrite = 0;
						IRWrite = 0;
						PCWrite = 0;
						MemWrite = 0;
						PCWriteCond = 0; // Also known as Branch
						
						//next state
						next_state = `MEM_READ_WAIT_STATE;
					end

					`MEM_READ_WAIT_STATE : begin
						next_state = `MEM_WRITEBACK_STATE;
					end

					`MEM_WRITE_STATE : begin
						// set outputs
						
						// MULTIPLEXER SELECTS:
						IorD = 1;
						ZeroNotZero = 0;

						//dont cares
						RegDst = 2'b00;
						MemtoReg = 0;
						ALUSrcA = 2'b01;
						ALUSrcB = 3'b000;
						ALUOp = 2'b10;
						PCSource = 2'b00;

						//ENABLE SIGNALS
						//Asserted enables
						MemWrite = 1;
						//Not Asserted
						RegWrite = 0;
						IRWrite = 0;
						PCWrite = 0;
						PCWriteCond = 0; // Also known as Branch
						
						//next state
						next_state = `WRITEBACK_WAIT_STATE;
					end

					`MEM_WRITEBACK_STATE : begin
						// set outputs
						
						// MULTIPLEXER SELECTS:
						MemtoReg = 1;
						RegDst = 2'b00;
						ZeroNotZero = 0;

						//dont cares
						IorD = 1;
						ALUSrcA = 2'b01;
						ALUSrcB = 3'b000;
						ALUOp = 2'b10;
						PCSource = 2'b00;

						//ENABLE SIGNALS
						//Asserted enables
						RegWrite = 1;
						//Not Asserted
						MemWrite = 0;
						
						IRWrite = 0;
						PCWrite = 0;
						PCWriteCond = 0; // Also known as Branch
						
						//next state
						next_state = `WRITEBACK_WAIT_STATE;
					end

					`WRITEBACK_I_STATE : begin
						// set outputs
						
						// MULTIPLEXER SELECTS:
						RegDst = 2'b00;
						MemtoReg = 0;
						ZeroNotZero = 0;

						//dont cares
						ALUSrcA = 2'b01;
						ALUSrcB = 3'b000;
						ALUOp = 2'b10;
						IorD = 0;
						PCSource = 2'b00;
						

						//ENABLE SIGNALS
						//Asserted enables
						RegWrite = 1;
						//Not Asserted
						IRWrite = 0;
						PCWrite = 0;
						MemWrite = 0;
						PCWriteCond = 0; // Also known as Branch
						
						//next state
						next_state = `WRITEBACK_WAIT_STATE;
					end

					`WRITEBACK_R_STATE : begin
						// set outputs
						
						// MULTIPLEXER SELECTS:
						RegDst = 2'b01;
						MemtoReg = 0;
						ZeroNotZero = 0;

						//dont cares
						ALUSrcA = 2'b01;
						ALUSrcB = 3'b000;
						ALUOp = 2'b10;
						IorD = 0;
						PCSource = 2'b00;
						

						//ENABLE SIGNALS
						//Asserted enables
						RegWrite = 1;
						//Not Asserted
						IRWrite = 0;
						PCWrite = 0;
						MemWrite = 0;
						PCWriteCond = 0; // Also known as Branch
						
						//next state
						next_state = `WRITEBACK_WAIT_STATE;
					end

					`WRITEBACK_JR_STATE : begin
						// set outputs
						
						// MULTIPLEXER SELECTS:

						//dont cares
						PCSource = 2'b00;
						ALUSrcA = 2'b01;
						ALUSrcB = 3'b000;
						ALUOp = 2'b10;
						IorD = 0;
						RegDst = 2'b00;
						MemtoReg = 0;
						ZeroNotZero = 0;

						//ENABLE SIGNALS
						//Asserted enables
						PCWrite = 1;

						//Not Asserted
						IRWrite = 0;
						MemWrite = 0;
						RegWrite = 0;
						PCWriteCond = 0; // Also known as Branch
						
						//next state
						next_state = `WRITEBACK_WAIT_STATE;
					end

					`WRITEBACK_WAIT_STATE : begin
						
						//Wait for writeback to complete
						RegWrite = 0;
						MemWrite = 0;
						IorD = 0;
						PCWrite = 0;
						ZeroNotZero = 0;
						//go back to fetch
						next_state = `FETCH_STATE;
					end
					default : next_state = `FETCH_STATE;
		endcase
	end 

endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire
