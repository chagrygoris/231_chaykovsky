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
even_nums: .space 400

.text


main:
li a7, 5
ecall
mv t1, a0
li t0, 0
la t2, even_nums

loop:
beq t0, t1, end_loop
addi t0, t0, 1
read_int(t3)
andi t4, t3, 1
bnez t4, loop
sw t3, 0(t2)
addi t2, t2, 4
j loop
end_loop:


la t0, even_nums
bne t0, t2, printer_loop
li a7, 11
li a0, '\n'
ecall


printer_loop:
beq t2, t0, end_print_loop
lw t3, -4(t2)
print_int(t3)
addi t2, t2, -4
j printer_loop
end_print_loop:
end: