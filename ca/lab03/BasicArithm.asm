start:
    li a7, 5 
    ecall 
    mv t0, a0 
    
    # input values

    li a7, 5               
    ecall                 
    mv t1, a0            
    
    # (x + 5) - (y - 7)
    
    li t3, 12
    
    add t2, t0, zero
    add t2, t2, t3
    sub t2, t2, t1
    
    mv a0, t2        
    li a7, 1               
    ecall
    li a7, 11
    li a0, '\n'
    ecall
    
    
    # 2 * x * x - 3 * y + 4
    
    mul t2, t0, t0
    li t3, 1
    sll t2, t2, t3
    li t3, 3
    mul t4, t1, t3
    sub t2, t2, t4
    li t3, 4
    add t2, t2, t3
    
    mv a0, t2        
    li a7, 1               
    ecall
    li a7, 11
    li a0, '\n'
    ecall
    
    #  (x + 5) / y + 10 / (y - 1)
    
    li t3, 5
    add t2, t0, t3
    div t2, t2, t1
    li t3, 1
    sub t4, t1, t3
    li t3, 10
    div t4, t3, t4
    add t2, t2, t4
    
    
    mv a0, t2        
    li a7, 1               
    ecall
    li a7, 11
    li a0, '\n'
    ecall
    
    
    # (x / y) * y + x % y
    
    
    div t2, t0, t1
    mul t2, t2, t1
    rem t3, t0, t1
    add t2, t2, t3
    
    mv a0, t2        
    li a7, 1               
    ecall
    li a7, 11
    li a0, '\n'
    ecall
    
    
    
    
    # x > y ? 1 : 0
    
    
    li t3, 1
    sub t2, t0, t1
    li t3, 31
    sra t4, t2, t3
    xor t5, t2, t4
    sub t5, t5, t4
    div t2, t2, t5
    li t3, 1
    add t2, t2, t3
    li t3, 2
    div t2, t2, t3
    
    
    mv a0, t2        
    li a7, 1               
    ecall
    li a7, 11
    li a0, '\n'
    ecall
    
    
    
    
    
    

    li a7, 10              
    ecall