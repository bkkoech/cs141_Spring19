#!/usr/bin/env python
#
# Template for MIPS assembler.py
#
# Usage:
#    python assembler_template.py [asm file]

import sys, re

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

rtypes = [
  'add', 'sub', 'and', 'or', 'xor', 'nor', 'sll', 'sra', 'srl', 'sra', 'slt','jr'
]

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
  'sw'   : dec_to_bin(43,6)
}

function_codes = {

}

registers = {
  '$zero' : dec_to_bin(00, 5),
 }

def main():
  me, fname = sys.argv

  f = open(fname, "r")
  labels = {}        # Map from label to its address.
  parsed_lines = []  # List of parsed instructions.
  address = 0        # Track the current address of the instruction.
  line_count = 0     # Number of lines.
  for line in f:
    line_count = line_count + 1

    # Stores attributes about the current line of code, like its label, line
    # number, instruction, and arguments.
    line_attr = {}

    # Handle comments, whitespace.

    if line:
      # We'll get you started here with line_count.
      line_attr['line_number'] = line_count

      # Handle labels
      # Parse the rest of the instruction and its register arguments.

      # Finally, add this dict to the complete list of instructions.
      parsed_lines.append(line_attr)
  f.close()

  machine = ""  # Current machine code word.

  for line in parsed_lines:
    if line['instruction'] == 'nop':
      print 8*'0'
    elif line['instruction'] in rtypes:
      # Encode an R-type instruction.
    else:
      # Encode a non-R-type instruction.

if __name__ == "__main__":
  main()
