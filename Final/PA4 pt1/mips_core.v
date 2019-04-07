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
	
	// Control Signal Definitions
	wire MemWrite, IRWrite, MemtoReg, RegDst, RegWrite, ALUSrcA, PCWriteCond, PCWrite, IorD;
	wire [1:0] ALUOp, PCSource;
	wire [2:0] ALUSrcB;

	// register file output wires
	wire [N-1:0] rd_data1, rd_data2, wr_data;

	// register input addr wires 
	wire [4:0] rd_addr1, rd_addr2, wr_addr;

	// ALU wires
	wire [N-1:0] ALUOutput;
	wire [N-1:0] ALU_SrcA_in, ALU_SrcB_in;
	wire alu_zero;
	wire [3:0] ALU_control_sig;
	
	// Internal Wires
	wire PCWriteEn, AND_out;
	wire [N-1:0] pc_out, aluout_out, decoder_in, mdr_out, a_to_alusrcA_mux;
	wire [N-1:0] b_to_alusrcB_mux, imm_extended, imm_extendedshift, jump_addr;
	reg [N-1:0] pc_feedback = `I_START_ADDRESS;

	// decoder out signals
	wire [5:0] op_decoded, funct_decoded;
	wire [4:0] rd_decoded;
	wire [N-1:0] shamt_decoded;
	wire [15:0] imm_decoded;
	wire [25:0] addr_decoded;

	// Internal Registers
	
	register IR (.clk(clk), .rst(rst), .ena(IRWrite), .d(read_data), .q(decoder_in));
	register MDR (.clk(clk), .rst(rst), .ena(1'b1), .d(read_data), .q(mdr_out));
	register A (.clk(clk), .rst(rst), .ena(1'b1), .d(rd_data1), .q(a_to_alusrcA_mux));
	register B (.clk(clk), .rst(rst), .ena(1'b1), .d(rd_data2), .q(b_to_alusrcB_mux));
	register ALUOut (.clk(clk), .rst(rst), .ena(1'b1), .d(ALUOutput), .q(aluout_out));
	register PC (.clk(clk), .rst(rst), .ena(PCWriteEn), .d(pc_feedback), .q(pc_out));
	
	// Instruction Decoder
	instr_decoder DECODER(
		.instr(decoder_in), 
		.op(op_decoded), 
		.rs(rd_addr1), 
		.rt(rd_addr2), 
		.rd(rd_decoded), 
		.shamt(shamt_decoded), 
		.funct(funct_decoded), 
		.imm(imm_decoded), 
		.addr(addr_decoded)
		);
	
	// Register Intantiation
	 register_file #(.N(32)) REGISTER(
		.clk(clk),
		.rst(rst),
		.rd_addr1(rd_addr1),
		.rd_addr2(rd_addr2),
		.wr_addr(wr_addr),
		.rd_data1(rd_data1),
		.rd_data2(rd_data2),
		.wr_data(wr_data),
		.wr_ena(RegWrite)
		);
		
	// WRITE INTERNAL WIRES 
	// ALU Instantiation
	alu ALU(
		.x(ALU_SrcA_in), 
		.y(ALU_SrcB_in), 
		.op_code(ALU_control_sig), 
		.z(ALUOutput), 
		//.equal(), 
		.zero(alu_zero) 
		//.overflow()
		);
	
	// WRITE INTERNAL WIRINGs
	// ALU Controller Instantiation
	alu_control ALU_CONTROL(
		.ALUOp(ALUOp),
		.ALUControl(ALU_control_sig),
		.funct(funct_decoded)
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
		.IorD(IorD),
		.OP_code(op_decoded),
		.Funct(funct_decoded)
		);

	5to1_mux 5to1_ALUb_MUX(
		.in0(b_to_alusrcB_mux),
		.in1(32'd4),
		.in2(imm_extended),
		.in3(imm_extendedshift),
		.in4(shamt_decoded),
		.select(ALUSrcB),
		.out(ALU_SrcB_in)
		);

	3to1_mux 3to1_PCSource_MUX(
		.in0(ALUOutput),
		.in1(aluout_out),
		.in2(jump_addr),
		.select(PCSource),
		.out(pc_feedback)
		);
	// conenct back to memory
	assign write_data = b_to_alusrcB_mux;

	// logic for PC
	assign AND_out = PCWriteCond & alu_zero;
	assign PCWriteEn = AND_out | PCWrite;

	// PC MUX
	assign write_addr = IorD ? aluout_out : pc_out;

	// reg dest mux
	assign wr_addr = RegDst ? rd_decoded : rd_addr2;

	// mem to reg mux
	assign wr_data = MemtoReg ? mdr_out : aluout_out;

	// ALU SRCA MUX
	assign ALU_SrcA_in = ALUSrcA ? a_to_alusrcA_mux : pc_out;

	// IMM extension and shift
	assign imm_extended = {{16{imm_decoded[15]}}, imm_decoded};
	assign imm_extendedshift = imm_extended << 2;

	// Jump addr calculation
	assign jump_addr = {pc_out[31:28], {addr_decoded, 2'b00}};

		
	//
endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire
