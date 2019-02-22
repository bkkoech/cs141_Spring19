`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company:   CS141
// Engineer:  Avinash Uttamchandani
//
////////////////////////////////////////////////////////////////////////////////

`include "alu_defines.v"

module test_alu;

	// Inputs
	reg signed [31:0] X;
	reg signed [31:0] Y;
	reg signed [3:0] op_code;
	reg signed [31:0] intermediate;
	

	// Outputs
	wire [31:0] Z;
	wire equal;
	wire overflow;
	wire zero;
	


	// Instantiate the Unit Under Test (UUT)
	alu uut (
		.X(X), 
		.Y(Y), 
		.Z(Z), 
		.op_code(op_code), 
		.equal(equal), 
		.overflow(overflow), 
		.zero(zero)
	);

	// HINT: 'integer' variables might be useful
	integer error = 0;
	integer i = 0;

	
	initial begin
		// Initialize Inputs
		X = 3;
		Y = 2;
		op_code = 4'b0;
		intermediate = 32'b0;
				
		// YOUR CODE HERE
		// loop through all important test vectors
		// this triggers the always block
		
		// Loop through all the op codes and inputs
		for (i = 0; i != 4'b1111; i= i + 1) begin
			op_code = i;
			// Standard case 1 - two positive numbers
			X = 2;
			Y = 3;
			#10;
			
			//standard case 2 - two negative numbers
			X = -2;
			Y = -3;
			#10;
			
			//Standar case 3 - largest 32 bit number and zero
			X = 4294967295;
			Y = 0;
			#10;
			
			// positive and negative number
			X = 3;
			Y = -3;
			#10;
			
			// maximum 32 bit number and 1
			X = 4294967295;
			Y = 1;
			#10;
			
			//big positive number and big negative number 
			// for testing overflow of subtraction
			X = 4294967295;
			Y = -4294967295;
			#10;
			
			// SRL: shift 2 by 1
			X = 2;
			Y = 1;
			#10;
			
			// SRL: shift 8 by 2
			X = 8;
			Y = 1;
			#10;

		end
		

		
		
		$display("Finished with %d errors", error);
		$finish;
	
	end
	
	// an 'always' block is executed whenever any of the variables in the sensitivity
	// list are changed (X, Y, or op_code in this case)
	always @(X,Y,op_code) begin
		#1;
		case (op_code)
			`ALU_OP_AND : begin
				//only executes when the op code is 0000 (AND)
				if( Z !== (X & Y) ) begin
					$display("ERROR: AND:  op_code = %b, X = %h, Y = %h, Z = %h", op_code, X, Y, Z);
					error = error + 1;
				end
			end
			// ADD IN YOUR OWN OP CODE CHECKERS HERE!!!
			`ALU_OP_XOR : begin
			//only executes when the op code is 0010 (XOR)
				if( Z !== (X ^ Y) ) begin
					$display("ERROR: XOR:  op_code = %b, X = %h, Y = %h, Z = %h", op_code, X, Y, Z);
					error = error + 1;
				end
			end
			`ALU_OP_OR : begin
			//only executes when the op code is 0001 (OR)
				if( Z !== (X | Y) ) begin
					$display("ERROR: OR:  op_code = %b, X = %h, Y = %h, Z = %h", op_code, X, Y, Z);
					error = error + 1;
				end
			end
			`ALU_OP_NOR: begin
			//only executes when the op code is 0011 (NOR)
				if( Z !== ~(X | Y) ) begin
					$display("ERROR: NOR:  op_code = %b, X = %h, Y = %h, Z = %h", op_code, X, Y, Z);
					error = error + 1;
				end
			end
			`ALU_OP_ADD: begin
			//only executes when the op code is 0101 (ADD)
				//check if addition works
				if( Z !== X+Y ) begin
					$display("ERROR: ADD:  op_code = %b, X = %h, Y = %h, Z = %h", op_code, X, Y, Z);
					error = error + 1;
				end
				//check if overflow works
				if( (Z > 4294967295) & (overflow !== 1)) begin
					$display("ERROR: ADD overflow failed:  op_code = %b, X = %h, Y = %h, Z = %h", op_code, X, Y, Z);
					error = error + 1;
				end
			end
			`ALU_OP_SUB: begin
			//only executes when the op code is 0110 (SUB)
				//check if addition works
				if( Z !== X-Y ) begin
					$display("ERROR: SUB:  op_code = %b, X = %h, Y = %h, Z = %h", op_code, X, Y, Z);
					error = error + 1;
				end
				//check if overflow works
				if( (Z > 4294967295) & (overflow !== 1)) begin
					$display("ERROR: ADD overflow failed:  op_code = %b, X = %h, Y = %h, Z = %h", op_code, X, Y, Z);
					error = error + 1;
				end
			end
			`ALU_OP_SLT: begin
				//check if slt works
				if( (X<Y && Z!==1) || (X>Y && Z!==0)) begin
						$display("ERROR: SLT failed:  op_code = %b, X = %h, Y = %h, Z = %h", op_code, X, Y, Z);
						error = error + 1;
					end
			end
			`ALU_OP_SRL: begin
			//only executes when the op code is 1000 (SRL)
				//check if shift right works
				if( Z !== X>>Y ) begin
					$display("ERROR: SRL:  op_code = %b, X = %h, Y = %h, Z = %h", op_code, X, Y, Z);
					error = error + 1;
				end
			end
			`ALU_OP_SLL: begin
			//only executes when the op code is 1001 (SLL)
				//check if shift right works
				if( Z !== X<<Y ) begin
					$display("ERROR: SLL:  op_code = %b, X = %h, Y = %h, Z = %h", op_code, X, Y, Z);
					error = error + 1;
				end
			end
			`ALU_OP_SRA: begin
			//only executes when the op code is 1010 (SRA)
				//check if SRA works
				
				// store shifted variable in intermediate variable
				intermediate = X>>>Y;
				if( Z !== intermediate) begin
					$display("ERROR: SRA:  op_code = %b, X = %h, Y = %h, Z = %h, expected Z = %h ", op_code, X, Y, Z, X>>>Y);
					error = error + 1;
				end
			end
			default : begin
				//executes at default
				if (Z !== 32'd0) begin
					$display("ERROR HAPPENED! invalid op code, Z was not zero, op_code = %b, X = %h, Y = %h, Z = %h", op_code, X, Y, Z);
				end
			end
		endcase
		
	end
	
endmodule

