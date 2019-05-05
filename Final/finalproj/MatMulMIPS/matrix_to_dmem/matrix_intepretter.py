import numpy as np

# write your matrix here
mat0 = np.array([
	[1,2,3,4,5,6,7,8],
	[1,2,3,4,5,6,7,8],
	[1,2,3,4,5,6,7,8],
	[1,2,3,4,5,6,7,8],
	[1,2,3,4,5,6,7,8],
	[1,2,3,4,5,6,7,8],
	[1,2,3,4,5,6,7,8],
	[1,2,3,4,5,6,7,8],
	])

mat1 = np.array([
	[1,2,3,4,5,6,7,8],
	[1,2,3,4,5,6,7,8],
	[1,2,3,4,5,6,7,8],
	[1,2,3,4,5,6,7,8],
	[1,2,3,4,5,6,7,8],
	[1,2,3,4,5,6,7,8],
	[1,2,3,4,5,6,7,8],
	[1,2,3,4,5,6,7,8],
	])

# basic operation functions courtesy of CS141 staff
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


# convert matrix to string of hex values
def matrix_to_dmem(_matrix):
	dmem = ""
	for row in _matrix:
		for column in row:
			dmem += bin_to_hex(dec_to_bin(column, 32))
			dmem += "\n"
	return dmem

# store values in memh file
f = open("output.memh", "w")
f.write(matrix_to_dmem(mat0))
f.write(matrix_to_dmem(mat1))
f.close()
print("---Done---")
