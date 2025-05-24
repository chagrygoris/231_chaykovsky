#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <sys/types.h>
#include <unistd.h>


int main()
{

    // make two process which run same
    // program after this instruction
    pid_t p = fork();
    if(p<0){
      perror("fork fail");
      exit(1);
    }
    if (p == 0) {
        pid_t p2 = fork();
        if (p2 < 0) {
            perror("fork fail");
            exit(1);
        }
        if (p2 == 0) {
            printf("Hello from Child2\n");
        } else {
            wait(NULL);
            printf("Hello from Child1\n");
        }
    } else {
        wait(NULL);
        printf("Hello from Parent\n");
    }
    return 0;
}