#!/usr/bin/env python
#
# Template for MIPS assembler.py
#
# Usage:
#    python assembler_template.py [asm file]

import sys, re
DEBUG = True

def bin_to_hex(x):
  y = hex(int(x,2))[2:]
  if len(y) < 8:
    y = (8-len(y))*"0" + y
  return y

def dec_to_bin(value, nbits):
  value = int(value)
  fill = "0"
  if value < 0:
    value = (abs(value) ^ 0xffffffff) + 1
    fill = "1"

  value = bin(value)[2:]
  if len(value) < nbits:
    value = (nbits-len(value))*fill + value
  if len(value) > nbits:
    value = value[-nbits:]
  return value

# List of all R-type instructions.
rtypes = ['add', 'sub', 'and', 'or', 'xor', 'nor', 'sll', 'sra', 'srl', 'slt', 'jr', 'mul']

op_codes = {
  'addi' : dec_to_bin(8,6),
  'andi' : dec_to_bin(12,6),
  'ori'  : dec_to_bin(13,6),
  'xori' : dec_to_bin(14,6),
  'slti' : dec_to_bin(10,6),
  'beq'  : dec_to_bin(4,6),
  'bne'  : dec_to_bin(5,6),
  'j'    : dec_to_bin(2,6),
  'jal'  : dec_to_bin(3,6),
  'lw'   : dec_to_bin(35,6),
  'sw'   : dec_to_bin(43,6),
  'mul'  : dec_to_bin(28,6)
}

function_codes = {
  'add'  : dec_to_bin(32,6),
  'sub'  : dec_to_bin(34,6),
  'and'  : dec_to_bin(36,6),
  'or'   : dec_to_bin(37,6),
  'xor'  : dec_to_bin(38,6),
  'nor'  : dec_to_bin(39,6),
  'sll'  : dec_to_bin(0,6),
  'sra'  : dec_to_bin(3,6),
  'srl'  : dec_to_bin(2,6),
  'slt'  : dec_to_bin(42,6),
  'jr'   : dec_to_bin(8,6),
  'mul'  : dec_to_bin(2, 6)
}

  # Fill out the rest of the registers.

registers = {
  '$zero' : dec_to_bin(0, 5),
  '$0'    : dec_to_bin(0, 5),
  '$at'   : dec_to_bin(1, 5),
  '$1'   : dec_to_bin(1, 5),
  '$v0'   : dec_to_bin(2, 5),
  '$2'   : dec_to_bin(2, 5),
  '$v1'   : dec_to_bin(3, 5),
  '$3'   : dec_to_bin(3, 5),
  '$a0'   : dec_to_bin(4, 5),
  '$4'   : dec_to_bin(4, 5),
  '$a1'   : dec_to_bin(5, 5),
  '$5'   : dec_to_bin(5, 5),
  '$a2'   : dec_to_bin(6, 5),
  '$6'   : dec_to_bin(6, 5),
  '$a3'   : dec_to_bin(7, 5),
  '$7'   : dec_to_bin(7, 5),
  '$t0'   : dec_to_bin(8, 5),
  '$8'   : dec_to_bin(8, 5),
  '$t1'   : dec_to_bin(9, 5),
  '$9'   : dec_to_bin(9, 5),
  '$t2'   : dec_to_bin(10, 5),
  '$10'   : dec_to_bin(10, 5),
  '$t3'   : dec_to_bin(11, 5),
  '$11'   : dec_to_bin(11, 5),
  '$t4'   : dec_to_bin(12, 5),
  '$12'   : dec_to_bin(12, 5),
  '$t5'   : dec_to_bin(13, 5),
  '$13'   : dec_to_bin(13, 5),
  '$t6'   : dec_to_bin(14, 5),
  '$14'   : dec_to_bin(14, 5),
  '$t7'   : dec_to_bin(15, 5),
  '$15'   : dec_to_bin(15, 5),
  '$s0'   : dec_to_bin(16, 5),
  '$16'   : dec_to_bin(16, 5),
  '$s1'   : dec_to_bin(17, 5),
  '$17'   : dec_to_bin(17, 5),
  '$s2'   : dec_to_bin(18, 5),
  '$18'   : dec_to_bin(18, 5),
  '$s3'   : dec_to_bin(19, 5),
  '$19'   : dec_to_bin(19, 5),
  '$s4'   : dec_to_bin(20, 5),
  '$20'   : dec_to_bin(20, 5),
  '$s5'   : dec_to_bin(21, 5),
  '$21'   : dec_to_bin(21, 5),
  '$s6'   : dec_to_bin(22, 5),
  '$22'   : dec_to_bin(22, 5),
  '$s7'   : dec_to_bin(23, 5),
  '$23'   : dec_to_bin(23, 5),
  '$t8' : dec_to_bin(24, 5),
  '$24' : dec_to_bin(24, 5),
  '$t9' : dec_to_bin(25, 5),
  '$25' : dec_to_bin(25, 5),
  '$k0' : dec_to_bin(26, 5),
  '$26' : dec_to_bin(26, 5),
  '$k1' : dec_to_bin(27, 5),
  '$27' : dec_to_bin(27, 5),
  '$gp' : dec_to_bin(28, 5),
  '$28' : dec_to_bin(28, 5),
  '$sp' : dec_to_bin(29, 5),
  '$29' : dec_to_bin(29, 5),
  '$fp' : dec_to_bin(30, 5),
  '$30' : dec_to_bin(30, 5),
  '$ra' : dec_to_bin(31, 5),
  '$31' : dec_to_bin(31, 5)
}

def main():
  me, fname = sys.argv

  f = open(fname, "r")
  parsed_lines = []  # List of parsed instructions.
  address = 0        # Track the current address of the instruction.
  line_count = 0     # Number of lines.
  
  for line in f:
    print(line)
    line_count = line_count + 1


    # Stores attributes about the current line of code, like its label, line
    # number, instruction, and arguments.
    line_attr = {}


    # Handle comments, whitespace.

    if line: # if line is not empty
      
      line = line.replace(',', '') # remove commas by raplacing with empty char
      line = line.strip() # remove spaces on either side of string
      # remove comments
      if '#' in line:
        line = line[0:line.find('#')]


      # We'll get you started here with line_count.
      line_attr['line_number'] = line_count

      
      # Handle labels
      if ':' in line:
        line_attr['label'] = line.split(':')[0]
        line = line.split(':')[1]
      else:
        line_attr['label'] = '' # no label
      # Parse the rest of the instruction and its register arguments.
      
      # split by white spaces
      line = line.split()

      # skip blank lines
      # if line != []:
      # store instructions
      line_attr['instruction'] = line[0]

      # store arguments 
      arguments = line[1:]
      for i in range(len(arguments)):
        # reg0 reg1 etc
        line_attr['arg' + str(i)] = arguments[i]

      # Finally, add this dict to the complete list of instructions.
      parsed_lines.append(line_attr)
  f.close()

  if DEBUG:
    for each in parsed_lines:
      print(each)

  machine = ""  # Current machine code word.
  for line in parsed_lines:
    if line['instruction'] == 'nop':
      word =  8*'0' + "\n"
      machine += word
    elif line['instruction'] in rtypes:
      # Encode an R-type instruction.
      # R type instructions with 3 arguments
      if line['instruction'] in ['add', 'sub', 'and', 'or', 'xor', 'nor', 'slt']:
        # 0 6bit op_code, 5bit rs, 5bit rt, 5bit rd,0 5bit shamt, 6bit func
        word = dec_to_bin(0,6) + registers[line['arg1']] + registers[line['arg2']] + registers[line['arg0']] + dec_to_bin(0,5) + function_codes[line['instruction']] + "\n"
        machine += word
      # mul R type
      elif line['instruction'] == 'mul':
        word = op_codes['mul'] + registers[line['arg1']] + registers[line['arg2']] + registers[line['arg0']] + dec_to_bin(0,5) + function_codes['mul'] + "\n"
        machine += word
      # R-type instruction with 1 argument
      elif line['instruction'] == 'jr':
        #0 6bit op_code, 5bit reg, 0 5bit reg, 0 5bit reg, 0 5bit shamt, 6bit func
        word = dec_to_bin(0,6) + registers[line['arg0']] + dec_to_bin(0,5) + dec_to_bin(0,5) + dec_to_bin(0,5) + function_codes[line['instruction']] + "\n"
        machine += word
      elif line['instruction'] in ['sll', 'sra', 'srl']:
        #0 6 bit op_code, 5bit rs, 5bit rt, 0 5bit rd, 5 bit shamt, 6bit func
        word = dec_to_bin(0,6) +  dec_to_bin(0,5) + registers[line['arg1']] + registers[line['arg0']]  + dec_to_bin(line['arg2'],5) + function_codes[line['instruction']] + "\n"
        machine += word
      else: 
        # in case non of the rtypes match
        print("Error: R-type, Type Not converted to machine code")
        print(line['instruction'])
    else:
      # Encode a non-R-type instruction.
      if line['instruction'] in ['addi', 'andi', 'ori', 'xori', 'slti']:
        # 6bit op_code, 5bit rs, 5bit rt , 16bit imm
        word = op_codes[line['instruction']] + registers[line['arg1']] + registers[line['arg0']] + dec_to_bin(line['arg2'],16) + "\n"
        machine += word
      elif line['instruction'] in ['beq', 'bne']:
        #6bit op_code, 5bit rs, 5bit rt, 16bit label
        jump_label = line['arg2']
        jump_to_addr = 0

        for each_line in parsed_lines:
          if each_line['label'] == jump_label:
            # find line number of label and add offset from PA4 instruction ie 0x00400000
            jump_to_addr = int(each_line['line_number']) - int(line['line_number']) - 1

        word = op_codes[line['instruction']] + registers[line['arg0']] + registers[line['arg1']] + dec_to_bin(jump_to_addr, 16) + "\n"
        machine += word
      elif line['instruction'] in ['j', 'jal']:
        #6bit op_code, 26bit label
        jump_label = line['arg0']
        jump_to_addr = 0

        for each_line in parsed_lines:
          if each_line['label'] == jump_label:
            # find line number of label and add offset from PA4 instruction ie 0x00400000
            jump_to_addr =  (int(each_line['line_number']) -1 ) + (0x00400000/4)  

        word = op_codes[line['instruction']] + dec_to_bin(jump_to_addr, 26) + "\n"
        machine += word
      elif line['instruction'] in ['lw', 'sw']:
        #6bit op_code, 5bit rs, 5bit rt, 16bit imm
        imm = line['arg1'].split('(')[0]
        rs = line['arg1'].split('(')[1].split(')')[0]
        word = op_codes[line['instruction']] + registers[rs] + registers[line['arg0']] + dec_to_bin(imm, 16) + "\n"
        machine += word
      else:
        #in case non of them match
        print("Error: I/J-type, Type mismatch, Not converted to machine code")
        print(line['instruction'])
    
    if DEBUG:
      print("Instruction: " + line['instruction'])
      print(word)

  f = open("output.machine", "w")
  machine = machine.split()
  for line in machine:
    f.write(bin_to_hex(line))
    f.write("\n")
  f.close()

  print('------DONE------')

if __name__ == "__main__":
  main()
