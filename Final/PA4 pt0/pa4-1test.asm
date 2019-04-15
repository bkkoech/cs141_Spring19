nor $t0, $t0, $t0		# load 1s into t0
addi    $t1, $t0, -15   # 4 LSBs=0
ori     $t2, $t1, 7     # one zero at 4th pos
xori    $t3, $t2, 8     # all 1s
slti    $t4, $0, 1      # lsb = 1
sw 	$t0, 16($0)			# DMEM 0x4 has all 1s
sw $t1 4($0)			# DMEM 0x1 has all 1s
lw $t5, 4($0)			# t5 has all 1s

