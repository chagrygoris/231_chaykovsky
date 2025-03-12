.macro read_int(%x)
li a7, 5
ecall
mv %x, a0
.end_macro

.macro print_int (%x)
li a7, 1
mv a0, %x
ecall
li a7, 11
li a0, '\n'
ecall
.end_macro

.macro read_float (%x)
li a7, 7
ecall
fmv.d  %x, fa0
.end_macro

.macro printd (%x)
li a7, 3
fmv.d  fa0, %x
ecall
li a7, 11
li a0, '\n'
ecall
.end_macro


main:
read_float(ft0)
read_float(fa1)
fmv.d ft7, ft0
jal ra, cubic_root

printd(ft0)

j finish
# takes cubic root
cubic_root:
#mv.d ft1, zero # x_{n - 1}
li t0, 0
li t1, 25

loop:
beq t0, t1, end_loop
fmul.d ft2, ft0, ft0
fdiv.d ft2, ft7, ft2
li t3, 2
fcvt.d.w ft3, t3
fmul.d ft0, ft0, ft3
fadd.d ft0, ft0, ft2
li t3, 3
fcvt.d.w ft3, t3
fdiv.d ft0, ft0, ft3
addi t0, t0, 1
j loop
end_loop:
ret




finish: