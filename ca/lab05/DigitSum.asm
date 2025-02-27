# Example:
#
# for (t0 = 0; t0 < t1; ++t0) {
#     print_int(t0)
#     print_char('\n')
# }
for:
   li   a7, 5
   ecall
   li t2, 10
   mv   t1, a0
   mv   t0, zero
   bge t1, zero, next
   neg t1, t1
next:
   beqz t1, end_for
   rem t3, t1, t2
   add t0, t0,t3 
   div t1, t1, t2
   j next
end_for:
mv a0, t0
li a7, 1
ecall
li a7, 11
li a0, '\n'
ecall