`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs

`include "alu_defines.v"
`include "mips_op_codes_defines.v"
`include "mips_funct_defines.v"


//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    alu_control 
// Author(s): 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
module alu_control(ALUOp, ALUControl, funct);
	input wire [1:0] ALUOp;
	input wire [5:0] funct;
	output wire [3:0] ALUControl;

	reg [3:0] alu_output = 4'b0000;
	
	always @(*) begin
		if (ALUOp == 2'b00) begin // add
			assign ALUControl = `ALU_OP_ADD;
		end
		else if (ALUOp == 2'b01) begin
			assign ALUControl = `ALU_OP_SUB;
		end
		else if (ALUOp == 2'b10) begin
			// Do R-Type
			case(funct)
				`FUNCT_ADD : alu_output = `ALU_OP_ADD;
				`FUNCT_SUB : alu_output = `ALU_OP_SUB;
				`FUNCT_SLL : alu_output = `ALU_OP_SLL;
				`FUNCT_SRA : alu_output = `ALU_OP_SRL;
				`FUNCT_JR  : alu_output = `ALU_OP_ADD;
				`FUNCT_AND : alu_output = `ALU_OP_AND;
				`FUNCT_OR  : alu_output = `ALU_OP_OR;
				`FUNCT_XOR : alu_output = `ALU_OP_XOR;
				`FUNCT_NOR : alu_output = `ALU_OP_NOR;
				`FUNCT_SLT : alu_output = `ALU_OP_SLT;
				default    : alu_output = 4'b0000;
			endcase
		end
	end

	assign ALUControl = alu_output;

endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire
