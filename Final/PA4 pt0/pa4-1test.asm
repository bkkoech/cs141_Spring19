sw 	$t0, 16($0)
nor $t1, $t1, $t1
sw $t1 4($0)
lw $t2, 4($0)

nor $t0, $t0, $t0
addi    $t1, $t0, -15   # 4 LSBs=0
ori     $t2, $t1, 7     # one zero at 4th pos
xori    $t3, $t2, 8     # all 1s
slti    $t4, $0, 1      # lsb = 1