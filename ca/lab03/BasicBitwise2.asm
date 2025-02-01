main:


    # input values
    
    
    li a7, 5 
    ecall 
    mv t0, a0 
    li a7, 5               
    ecall                 
    mv t1, a0            
    
    # x & (-1 << 2)
    li t3, -1
    li t4, 2
    sll t2, t3, t4
    and t2, t2, t0
    
    
    mv a0, t2        
    li a7, 1               
    ecall
    li a7, 11
    li a0, '\n'
    ecall
    
    # x | (-1 >> 30) where >> is logical shift
    
    li t4, 30
    srl t2, t3, t4
    or t2, t0, t2
    
    mv a0, t2        
    li a7, 1               
    ecall
    li a7, 11
    li a0, '\n'
    ecall
    
    # set the y-th bit of x to 1 (bit numbers start from 0)
    li t3, 1
    sll t3, t3, t1
    or t2, t0, t3
    
    mv a0, t2        
    li a7, 1               
    ecall
    li a7, 11
    li a0, '\n'
    ecall
    
    
    # reset the y-th bit of x to 0 (bit numbers start from 0)
    li t3, 1
    sll t2, t3, t1
    not t2, t2
    and t2, t0, t2
    
    mv a0, t2        
    li a7, 1               
    ecall
    li a7, 11
    li a0, '\n'
    ecall
    
    
    # (x == (y+3)) ? 0 : 1
    addi t3, t0, 0
    addi t4, t1, 3
    jal greater
    addi t2, t5, 0
    addi t3, t1, 3
    addi t4, t0, 0
    jal greater
    or t2, t2, t5
    
    mv a0, t2
    li a7, 1               
    ecall
    li a7, 11
    li a0, '\n'
    ecall
    
    
    
    # x > -5 & y < 5
    li t4, -5
    addi t3, t0, 0
    jal greater
    addi t2, t5, 0
    li t3, 5
    addi t4, t1, 0
    jal greater
    and t2, t2, t5
    
    
    mv a0, t2
    li a7, 1               
    ecall
    li a7, 11
    li a0, '\n'
    ecall
    
    
    
    

    li a7, 10              
    ecall
    
    
 greater: # t3 > t4, saves result to t5
    sub t5, t3, t4 # x - y
    srai t5, t5, 31 # (x - y) >> 31
    sub t6, t3, t4
    xor t6, t5, t6 # (x - y) ^ z
    sub t5, t6, t5 # (x - y) ^ z - z
    sub t6, t3, t4
    div t5, t6, t5
    addi t5, t5, 1
    srli t5, t5, 1
    ret