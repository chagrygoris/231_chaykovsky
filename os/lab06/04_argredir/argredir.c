#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/wait.h>

int main(int argc, char *argv[]) {
    if (argc < 4) {
        fprintf(stderr, "Usage: %s input_file output_file command [args...]\n", argv[0]);
        return 1;
    }

    pid_t pid = fork();
    if (pid < 0) {
        perror("fork");
        return 1;
    }

    if (pid == 0) {
        int in = open(argv[1], O_RDONLY);
        int out = open(argv[2], O_WRONLY|O_CREAT|O_TRUNC, 0644);
        
        if (in < 0 || out < 0) {
            perror("open");
            exit(1);
        }

        dup2(in, STDIN_FILENO);
        dup2(out, STDOUT_FILENO);
        close(in);
        close(out);

        execvp(argv[3], &argv[3]);
        perror("execvp");
        exit(1);
    } else {
        int status;
        waitpid(pid, &status, 0);
        printf("received %d\n", WEXITSTATUS(status));
    }

    return 0;
}