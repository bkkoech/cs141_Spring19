`timescale 1ns / 1ps
`include "mips_op_codes_defines.v"

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:29:19 04/06/2019
// Design Name:   control_module
// Module Name:   Z:/Shared files/Final/PA4 pt1/test_control_module.v
// Project Name:  lab4-start
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: control_module
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_control_module;

	localparam T=20; // clock period
	// Inputs
	reg clk;
	reg rst;
	reg Op_code;

	// Outputs
	wire MemWrite;
	wire IRWrite;
	wire MemtoReg;
	wire RegDst;
	wire RegWrite;
	wire ALUSrcA;
	wire [2:0] ALUSrcB;
	wire [1:0] ALUOp;
	wire [1:0] PCSource;
	wire PCWriteCond;
	wire PCWrite;
	wire IorD;

	// Instantiate the Unit Under Test (UUT)
	control_module uut (
		.clk(clk), 
		.rst(rst), 
		.MemWrite(MemWrite), 
		.IRWrite(IRWrite), 
		.MemtoReg(MemtoReg), 
		.RegDst(RegDst), 
		.RegWrite(RegWrite), 
		.ALUSrcA(ALUSrcA), 
		.ALUSrcB(ALUSrcB), 
		.ALUOp(ALUOp), 
		.PCSource(PCSource), 
		.PCWriteCond(PCWriteCond), 
		.PCWrite(PCWrite), 
		.IorD(IorD), 
		.Op_code(Op_code)
	);
		//****************************************************************
		// reset for the first half cycle of timer
		//****************************************************************
		initial
		begin
			rst = 0;
			#(T/2);
			rst = 1;
			#(T/2);
			rst = 0;
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
		Op_code = `RTYPE;
		
		repeat(5) @(posedge clk);

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

