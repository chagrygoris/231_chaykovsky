.macro read_int(%x)
li a7, 5
ecall
mv %x, a0
.end_macro

.macro print_char(%x)
li a0, %x
li a7, 11
ecall
.end_macro

.macro print_int (%x)
li a7, 1
mv a0, %x
ecall
.end_macro


.macro print_debug
print_int(t0)
print_char(' ')
print_int(t1)
print_char(' ')
print_int(t2)
print_char(' ')
print_char('\n')
.end_macro

.data
array: .space 4000

.text 
main:
read_int(t0) # t0 = N
mv t1, t0 # t1 = N, counter
la s2, array # start of array
la s3, array # end of array
reader_loop:
beqz t1, end_loop
addi t1, t1, -1
read_int(a0)
sw a0, 0(s3)
addi s3, s3, 4
j reader_loop
end_loop:


mv a0, s2
mv a1, s3
jal ra, sorter

sub t0, s3, s2
addi t0, t0, -4
bnez t0, printer_loop
addi s2, s2, 4
lw a0, 0(s2)
print_int(a0)

printer_loop:
beq s2, s3, end_printer_loop
lw a0, 0(s2)
print_int(a0)
print_char(' ')
addi s2, s2, 4
j printer_loop
end_printer_loop:

li a7, 93           
li a0, 0   
ecall






sorter:
sub t0, a1, a0
srli t0, t0, 2

loop:
li t1, 0
li t2, 0

iteratorloop:
    slli t3, t2, 2
    add t3, a0, t3

    lw t4, 0(t3)
    lw t5, 4(t3)


    ble t4, t5, no_swap

    sw t5, 0(t3)
    sw t4, 4(t3)
    li t1, 1

no_swap:
    addi t2, t2, 1

    addi t6, t0, -1
    blt t2, t6, iteratorloop

    
    beqz t1, return

    j loop
    
return:
    ret

