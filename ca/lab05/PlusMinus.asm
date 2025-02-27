# Example:
#
# for (t0 = 0; t0 < t1; ++t0) {
#     print_int(t0)
#     print_char('\n')
# }
for:
   li   a7, 5
   ecall
   mv   t1, a0
   mv   t0, zero
   li t4, 0
   li t6, 2
   
next:
   beq  t0, t1, end_for
   
   li a7, 5
   ecall
   mv t3, a0
   rem t5, t0, t6
   
   beqz t5, adder
   neg t3, t3
   
adder:
   add t4, t4, t3    
   
   
   
   addi t0, t0, 1
   j    next
end_for:
mv a0, t4
li a7, 1
ecall
li   a7, 11
li   a0, '\n'
ecall