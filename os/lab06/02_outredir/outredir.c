#include "stdio.h"
#include "stdlib.h"
#include "string.h"



char* join_commands_safe(char *commands[], const int N) {
    if (commands == NULL || commands[0] == NULL) {
        return strdup("");
    }

    size_t total_len = 0;
    for (int i = 0; commands[i] != NULL; i++) {
        total_len += strlen(commands[i]) + 1;
    }

    char *result = malloc(total_len);
    if (!result) return NULL;

    size_t pos = 0;
    for (int i = 1; i < N; i++) {
        pos += snprintf(result + pos, total_len - pos, "%s%s",
                        commands[i],
                        (commands[i+1] != NULL) ? " " : "");
    }

    return result;
}



int main(int argc, char* argv[]) {

    if (argc < 3) {
        printf("Provide non less than 2 arguments");
        return 1;
    }

    char* command = join_commands_safe(argv, argc - 1);
    char* filename = argv[argc - 1];

    char buf[1024];

    
    FILE* fp = popen(command, "r");
    
    if (fp == NULL) {
        perror("popen failed");
        return 1;
    }

    

    FILE* ptr = fopen(filename, "w");

    if (!ptr) {
        printf("error with opening file");
        return 1;
    }

    

    while (fgets(buf, sizeof(buf), fp)) {
        fputs(buf, ptr);
    }

    fclose(ptr);

    int status = pclose(fp);
    if (status != 0) {
        printf("incorrect commands");
        return 1;
    }

    return 0;
}