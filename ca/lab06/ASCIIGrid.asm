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


.macro print_char(%x)
li a0, %x
li a7, 11
ecall
.end_macro



.macro print_line(%n, %a, %b)
mv t0, %n
print_char(%a)
loop:
beqz t0, end_loop
print_char(%b)
print_char(%a)
addi t0, t0, -1
j loop
end_loop:
.end_macro

read_int(t1)
read_int(t2)
print_line(t1, '+', '-')
printer_loop:
beqz t2, end_printer_loop
print_char('\n')
print_line(t1, '|', ' ')
print_char('\n')
print_line(t1, '+', '-')
addi t2, t2, -1
j printer_loop
end_printer_loop:







