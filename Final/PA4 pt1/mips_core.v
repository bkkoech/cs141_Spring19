`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs

`include "mips_memory_space_defines.v"

//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    mips_core
// Author(s): 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
module mips_core(clk, rst, MemWrite, read_data, write_data, write_addr);
	parameter N = 32;
	
	input wire clk, rst;
	input wire [N-1:0] read_data;
	output wire [N-1:0] write_data, write_addr, MemWrite;
	
	// Internal Wires
	// Control Signal Definitions
	wire MemWrite, IRWrite, MemtoReg, RegDst, RegWrite, ALUSrcA, PCWriteCond, PCWrite, IorD;
	wire [1:0] ALUOp, PCSource;
	wire [2:0] ALUSrcB;
	// register file output wires
	wire [N-1:0] rd_data1, rd_data2, wr_data;
	// register input addr wires 
	wire [4:0] rd_addr1, rd_addr2, wr_addr;
	// ALU wires
	wire [N-1:0] ALUoutput;
	
	// Internal Registers
	reg PC = `I_START_ADDRESS;
	register IR (.clk(clk), .rst(rst), .ena(IRWrite), .d(), .q());
	register MDR (.clk(clk), .rst(rst), .ena(1'b1), .d(), .q());
	register A (.clk(clk), .rst(rst), .ena(1'b1), .d(rd_data0), .q());
	register B (.clk(clk), .rst(rst), .ena(1'b1), .d(rd_data1), .q());
	register ALUOut (.clk(clk), .rst(rst), .ena(1'b1), .d(ALUOutput), .q());
	
	// Instruction Decoder
	instr_decoder DECODER(
		.instr, 
		.op, 
		.rs(rd_addr1), 
		.rt(rd_addr2), 
		.rd, 
		.shamt, 
		.funct, 
		.imm, 
		.addr
		);
	
	// Register Intantiation
	 register_file #(.N(32)) REGISTER(
		.clk(clk),
		.rst(rst),
		.rd_addr0(rd_addr0),
		.rd_addr1(rd_addr1),
		.wr_addr(wr_addr),
		.rd_data0(rd_data0),
		.rd_data1(rd_data1),
		.wr_data(wr_data),
		.wr_ena(RegWrite)
		);
		
	// WRITE INTERNAL WIRES 
	// ALU Instantiation
	alu ALU(
		.x(), 
		.y(), 
		.op_code(), 
		.z(ALUOutput), 
		.equal(), 
		.zero(), 
		.overflow()
		);
	
	// WRITE INTERNAL WIRINGs
	// ALU Controller Instantiation
	alu_control ALU_CONTROL(
		.ALUOp(ALUOp),
		.ALUControl(),
		.funct()
		);
		
	// Control Module Instantiation
	control_module CONTROL(
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
		.IorD(IorD)
		.OP_code()
		);
		
	//
endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire
