`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs

`include "alu_defines.v"
`include "mips_op_codes_defines.v"


//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    alu_control 
// Author(s): 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
module alu_control(clk, rst, ALUOp, ALUControl, funct);
	input wire clk, rst;
	input wire [1:0] ALUOp;
	input wire [5:0] funct;
	output wire [3:0] ALUControl;
	
	always @*
	begin
		if (ALUOp == 2'b00) // add
			assign ALUControl = `ALU_OP_ADD;

		else if (ALUOp == 2'b01)
			assign ALUControl = `ALU_OP_SUB;

		else if (ALUOp == 2'b10)
			// Do R-Type
			case(funct)
				`FUNCT_ADD : begin
					assign ALUControl = `ALU_OP_ADD;
				end

				`FUNCT_SUB : begin
					assign ALUControl = `ALU_OP_SUB;
				end

				`FUNCT_SLL : begin
					assign ALUControl = `ALU_OP_SLL;
				end
				
				`FUNCT_SRA : begin
					assign ALUControl = `ALU_OP_SRL;
				end

				`FUNCT_JR : begin
					assign ALUControl = `ALU_OP_ADD;
				end

				`FUNCT_AND : begin
					assign ALUControl = `ALU_OP_AND;
				end

				`FUNCT_OR : begin
					assign ALUControl = `ALU_OP_OR;
				end

				`FUNCT_XOR : begin
					assign ALUControl = `ALU_OP_XOR;
				end

				`FUNCT_NOR : begin
					assign ALUControl = `ALU_OP_NOR;
				end

				`FUNCT_SLT : begin
					assign ALUControl = `ALU_OP_SLT;
				end
	end


endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire
