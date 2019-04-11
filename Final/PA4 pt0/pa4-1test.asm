nor     $t0, $t0, $t0   # all 1s
addi    $t1, $t0, -15   # 4 LSBs=0
ori     $t2, $t1, 7     # one zero at 4th pos
xori    $t3, $t2, 8     # all 1s
slti    $t4, $0, 1      # lsb = 1
sw 		$t3, 12($0) #lw 		$t5, 8($0)