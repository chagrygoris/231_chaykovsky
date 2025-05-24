#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/wait.h>

int main(int argc, char *argv[]) {
    if (argc < 4) {
        fprintf(stderr, "Usage: %s input_file output_file command [args...]\n", argv[0]);
        return 2;
    }

    pid_t pid = fork();
    if (pid < 0) {
        perror("fork failed");
        return 3;
    }

    if (pid == 0) {
        int in = open(argv[1], O_RDONLY);
        if (in < 0) {
            perror("open input failed");
            return 4;
        }

        int out = open(argv[2], O_WRONLY|O_CREAT|O_TRUNC, 0644);
        if (out < 0) {
            perror("open output failed");
            close(in);
            return 5;
        }

        if (dup2(in, STDIN_FILENO) < 0) {
            perror("dup2 stdin failed");
            close(in);
            close(out);
            return 6;
        }

        if (dup2(out, STDOUT_FILENO) < 0) {
            perror("dup2 stdout failed");
            close(in);
            close(out);
            return 7;
        }

        close(in);
        close(out);

        execvp(argv[3], &argv[3]);
        perror("execvp failed");
        return 8;
    }

    int status;
    if (waitpid(pid, &status, 0) < 0) {
        perror("waitpid failed");
        return 9;
    }

    if (WIFEXITED(status)) {
        printf("received %d", WEXITSTATUS(status));
        return WEXITSTATUS(status);
    }
    
    return 10;
}