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





main_loop:

    read_int(t0)
    read_int(t1)
    read_int(t2)

    jal ra, check_triangle

    li t6, 0
    beq a0, t6, end
    
    
    
    li t6, 1
    bne a0, t6, skip_print_yes
    print_char('Y')
    print_char('\n')
    skip_print_yes:

    li t6, 2
    bne a0, t6, skip_print_no
    print_char('N')
    print_char('\n')
    skip_print_no:
    
    
    j main_loop


check_triangle:
    beqz t0, check_zero_a1
    j check_triangle_inequality

check_zero_a1:
    beqz t1, check_zero_a2
    j check_triangle_inequality

check_zero_a2:
    beqz t2, return_zero
    j check_triangle_inequality

check_triangle_inequality:
    
    add t3, t0, t1
    blt t3, t2, return_two
    
    add t3, t0, t2
    blt t3, t1, return_two
    
    add t3, t1, t2
    blt t3, t0, return_two

    li a0, 1
    ret

return_two:
    li a0, 2
    ret

return_zero:
    li a0, 0
    ret
    
    
end: