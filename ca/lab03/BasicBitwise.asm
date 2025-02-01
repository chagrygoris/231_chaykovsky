start:


    # input values
    
    
    li a7, 5 
    ecall 
    mv t0, a0 
    li a7, 5               
    ecall                 
    mv t1, a0            
    
    
    
    # (x >> 2) + ((y - 1) << 3) where >> is logical shift
    li t3, 2
    srl t2, t0, t3
    li t3, 1
    sub t4, t1, t3
    li t3, 3
    sll t4, t4, t3
    add t2, t2, t4
    
    mv a0, t2        
    li a7, 1               
    ecall
    li a7, 11
    li a0, '\n'
    ecall
    
    # (x << y) - 10
    li t3, 10
    sll t2, t0, t1
    sub t2, t2, t3
    
    mv a0, t2        
    li a7, 1               
    ecall
    li a7, 11
    li a0, '\n'
    ecall
    
    # (x >> y) + 10 where >> is arithmetical shift
    sra t2, t0, t1
    add t2, t2, t3
    
    mv a0, t2        
    li a7, 1               
    ecall
    li a7, 11
    li a0, '\n'
    ecall
    
    # ((x << 2) - y + 5) >> 1 where >> is arithmetical shift
    
    li t3, 2
    sll t2, t0, t3
    sub t2, t2, t1
    li t3, 5
    add t2, t2, t3
    li t3, 1
    sra t2, t2, t3
    
    mv a0, t2        
    li a7, 1               
    ecall
    li a7, 11
    li a0, '\n'
    ecall
    
    #  x * 6 - y * 3 using + - >> <<
    li t3, 2
    sll t2, t0, t3
    add t4, t0, t0
    add t2, t2, t4
    li t3, 1
    sll t4, t1, t3
    add t3 t4, t1
    sub t2, t2, t3
    
    mv a0, t2        
    li a7, 1               
    ecall
    li a7, 11
    li a0, '\n'
    ecall
    
    
    
    

    li a7, 10              
    ecall