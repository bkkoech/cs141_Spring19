`ifndef MIPS_FUNCT_DEFINES
`define MIPS_FUNCT_DEFINES

`define FUNCT_SLL 6'd0
`define FUNCT_SRL 6'd2
`define FUNCT_SRA 6'd3
`define FUNCT_JR  6'd8
`define FUNCT_ADD 6'd32
`define FUNCT_SUB 6'd34
`define FUNCT_AND 6'd36
`define FUNCT_OR  6'd37
`define FUNCT_XOR 6'd38
`define FUNCT_NOR 6'd39
`define FUNCT_SLT 6'd42
`define FUNCT_MUL 6'd2 // NOTE: need to check op_code as well

`endif