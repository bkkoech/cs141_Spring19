# --------------------REGISTER ASSIGNMENTS--------------------

# $s0 64 total matrix elements
# $s1 dim matrix dimention
# $s2 cumulative sum to write back

# $t0 res result matrix read address
# $t1 loc1 matrix 1 read address
# $t2 loc2 matrix 2 read address
# $t3 column counter
# $t4 row counter
# $t5 dim_count counter 1-8 for calculations loop

# $t6 operand reg1
# $t7 operand reg2 and result of mul

# ------------------------------------------------------------
SETUP:	addi $s1 $0 8		# define mat dimention
		addi $t2 $0 64		# define mat2 start address
		addi $t0 $0 128		# define result start address
INNER:	lw $t6 0($t1)
		lw $t7 0($t2)		# load operands
		mul $t7 $t7 $t6
		add $s2 $s2 $t7		# add to result
		addi $t1 $t1 1		# increment loc1 address
		addi $t2 $t2 8		# increment loc2 addr
		addi $t5 $t5 1		# increment calculation counter
		bne $t5 $s1 INNER	# loop over mat1 row/ mat2 column 
COLUMN:	sw $s2 0($t0)		# write result back
		add $s2 $0 $0		# reset cumulative sum
		addi $at $at 1
		addi $t0 $t0 1		# increment resut address
		add $t5 $0 $0		# reset calculation counter
		addi $t1 $t1 -8		# reset loc1 to start of row
		addi $t2 $t2 -64
		addi $t2 $t2 1		# reset loc2 to next column
		addi $t3 $t3 1		# increment column counter
		bne $t3 $s1 INNER
ROW:	add $t3 $0 $0		# reset column counter
		addi $t1 $t1 8		# move to next row
		addi $t4 $t4 1		# increment row counter
		bne	$t4 $s1 INNER	# next row/col if not done