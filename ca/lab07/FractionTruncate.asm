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
li a7, 6
ecall
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


read_int(t1)
read_int(t2)
read_int(a0)

fcvt.d.w fa1, t1
fcvt.d.w fa2, t2
fdiv.d fa0, fa1, fa2


jal ra, truncater

printd(fa0)

j finish


truncater:

li t0, 10
fcvt.d.w ft0, t0
li t0, 1
fcvt.d.w ft1, t0
li t0, 0
loop:
beq t0, a0, end_loop
fmul.d ft1, ft1, ft0
addi t0, t0, 1
j loop
end_loop:
fmul.d fa0, fa0, ft1
fcvt.w.d t0, fa0
fcvt.d.w fa0, t0
fdiv.d fa0, fa0, ft1
ret



finish:
