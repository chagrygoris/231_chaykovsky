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
read_int(a0)


jal ra, calc_pi
jal ra, truncater

printd(fa0)

j finish




calc_pi:
fcvt.d.w fa0, zero #fa0 = res
li t0, 1 
fcvt.d.w ft0, t0 #ft0 = sign
li t0, 0
li t1, 10000
loop:
beq t0, t1, end_loop
slli t2, t0, 1
addi t2, t2, 1
fcvt.d.w ft1, t2
fdiv.d ft1, ft0, ft1
fadd.d fa0, fa0, ft1
fneg.d ft0, ft0
addi t0, t0, 1
j loop
end_loop:
li t0, 4
fcvt.d.w ft0, t0
fmul.d fa0, fa0, ft0
ret


truncater:

li t0, 10
fcvt.d.w ft0, t0
li t0, 1
fcvt.d.w ft1, t0
li t0, 0
trunc_loop:
beq t0, a0, end_trunc_loop
fmul.d ft1, ft1, ft0
addi t0, t0, 1
j trunc_loop
end_trunc_loop:
fmul.d fa0, fa0, ft1
fcvt.w.d t0, fa0
fcvt.d.w fa0, t0
fdiv.d fa0, fa0, ft1
ret






finish: