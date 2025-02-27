li a7, 5
ecall

mv t0, a0

li a7, 5
ecall

mv t1, a0

li a7, 5
ecall

mv t2, a0

li a7, 5
ecall

mv t3, a0

add t0, t0, t2
add t1, t1, t3

mv a0, t0        
li a7, 1               
ecall
li a7, 11
li a0, '\n'
ecall

mv a0, t1
li a7, 1               
ecall
li a7, 11
li a0, '\n'
ecall