`timescale 1ns / 1ps
`default_nettype none //helps catch typo-related bugs
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Fall 2015
// Module Name:    SRA 
// Author(s): 
// Description: 
//
//
//////////////////////////////////////////////////////////////////////////////////
module SRA(A,B,Z);

//parameter definitions	
	parameter N = 32;
	
	//port definitions - customize for different bit widths
	input wire [N-1:0] A, B;
	output wire [N-1:0] Z;
	
	//concatenate msb infront of A
	wire [2*N-1:0] C;
	assign C = {{32{A[N-1]}}, A};

	//assign C = {A[N-1],A[N-1],A[N-1],A[N-1],A[N-1],A[N-1],A[N-1],A[N-1],A[N-1],A[N-1],A[N-1],A[N-1],A[N-1],A[N-1],A[N-1],A[N-1],A[N-1],A[N-1],A[N-1],A[N-1],A[N-1],A[N-1],A[N-1],A[N-1],A[N-1],A[N-1],A[N-1],A[N-1],A[N-1],A[N-1],A[N-1],A[N-1], A};
	
	
	//make sure the shamt does not exceed 32
	wire [N-1:0] sra_input, msb_input;
	wire sra_select;
	

	assign msb_input = {32{A[N-1]}};
	//assign msb_input = {A[N-1],A[N-1],A[N-1],A[N-1],A[N-1],A[N-1],A[N-1],A[N-1],A[N-1],A[N-1],A[N-1],A[N-1],A[N-1],A[N-1],A[N-1],A[N-1],A[N-1],A[N-1],A[N-1],A[N-1],A[N-1],A[N-1],A[N-1],A[N-1],A[N-1],A[N-1],A[N-1],A[N-1],A[N-1],A[N-1],A[N-1],A[N-1]};
	assign sra_select = |B[N-1:4];
	
	mux_2to1 #(.N(N)) MUX_1 (.X(sra_input), .Y(msb_input), .S(sra_select), .Z(Z)); 

	
	generate
		genvar i;
		for (i = 0; i < 32  ; i = i + 1) begin	
			mux_32to1 #(.Q(N)) SRL_gen
			(.A({
			C[N-1+i],
			C[N-2+i],
			C[N-3+i],
			C[N-4+i],
			C[N-5+i],
			C[N-6+i],
			C[N-7+i],
			C[N-8+i],
			C[N-9+i],
			C[N-10+i],
			C[N-11+i],
			C[N-12+i],
			C[N-13+i],
			C[N-14+i],
			C[N-15+i],
			C[N-16+i],
			C[N-17+i],
			C[N-18+i],
			C[N-19+i],
			C[N-20+i],
			C[N-21+i],
			C[N-22+i],
			C[N-23+i],
			C[N-24+i],
			C[N-25+i],
			C[N-26+i],
			C[N-27+i],
			C[N-28+i],
			C[N-29+i],
			C[N-30+i],
			C[N-31+i],
			C[N-32+i]
			}),
			.S(B[4:0]),
			.Z(sra_input[i])
			);
			
		end
	endgenerate
	


endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire
