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


.macro exit
li a7, 93
li a0, 0
ecall
.end_macro

.data
array: .space 400


.text

read_int(s0) # so = N
read_int(s1) # s1 = T
beqz s1, set_true
la s1, rem_comp
j set_rem
set_true:
la s1, true_comp

set_rem:




mv t0, s0
la t1, array
reader_loop:
beqz t0, end_reader_loop
read_int(a0)
sw a0, 0(t1)
addi t1, t1,  4
addi t0, t0, -1
j reader_loop
end_reader_loop:


mv a0, s0
la a1, array
mv a2, s1


jal ra, sorter


la t1, array
mv t0, s0
printer_loop:
beqz t0, end_printer_loop
lw a0, 0(t1)
print_int(a0)
print_char('\n')
addi t1, t1, 4
addi t0, t0, -1
j printer_loop
end_printer_loop:
exit




# N at a0
# start of array at a1
# comparator at a2
sorter:
mv s2, a0          
mv s3, a1          
li t0, 1
mv s11, ra
beq s2, t0, return



li s4, 0
loop:
    beq s4, s2, end_loop
    li s5, 1
    la s6, array
    
    inner_loop:
    
        beq s5, s2, end_inner_loop
        
        lw a0, 0(s6)
        lw a1, 4(s6)
        jalr ra, a2, 0
        bnez a0, keep
        lw t4, 0(s6)        # t4 = array[i]
        lw t5, 4(s6)        # t5 = array[i+1]
        sw t5, 0(s6)        # array[i] = array[i+1]
        sw t4, 4(s6)        # array[i+1] = array[i]
        keep:
        addi s5, s5, 1
        addi s6, s6, 4
        j inner_loop
    end_inner_loop:
    addi s4, s4, 1
    j loop
end_loop:


return:
    mv ra, s11
    ret




true_comp:
ble a0, a1, proper
j improper

rem_comp:
li t0, 10
rem t1, a0, t0
rem t2, a1, t0
bge t1, t2, proper
j improper




proper:
li a0, 1
ret

improper:
li a0, 0
ret
