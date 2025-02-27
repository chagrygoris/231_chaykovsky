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




.data
even_nums: .space 4000

.text


main:
li a7, 5
ecall
mv t1, a0
li t0, 0
la t2, even_nums
la s1, even_nums

loop:
beq t0, t1, end_loop
addi t0, t0, 1
read_int(t3)
mv t4, t2
addi t4, t4, -4


checker_loop:

blt t4, s1, end_checker_loop
lw t5, 0(t4)
beq t3, t5, dup
addi t4, t4, -4
j checker_loop
end_checker_loop:

sw t3, 0(t2)
addi t2, t2, 4

dup:
j loop
end_loop:


la t0, even_nums
bne t0, t2, printer_loop
li a7, 11
li a0, '\n'
ecall


printer_loop:
beq t2, t0, end_print_loop
lw t3, 0(t0)
print_int(t3)
addi t0, t0, 4
j printer_loop
end_print_loop:
end: