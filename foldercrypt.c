#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#define ALGORITHM "aes-256-cbc"
#define ITER 10000

int main(int argc, char *argv[]) {
    if(argc != 3) {
        fprintf(stderr, "Usage: %s [-e|-d] folder_name\n", argv[0]);
        return 1;
    }

    char* option = argv[1];
    char* folder_name = argv[2];
    char cmd[1024];

    if(strcmp(option, "-e") == 0) {
        // Check if directory exists
        if (access(folder_name, F_OK) == -1) {
            fprintf(stderr, "Error: Folder does not exist.\n");
            return 1;
        }

        // openssl and tar commands, similar to the Bash script
        snprintf(cmd, sizeof(cmd), "openssl rand -hex 64 | xxd -r -p > %s.enc.key && tar czf - -C %s . | openssl enc -%s -salt -pbkdf2 -iter %d -out %s.tar.gz.enc -pass file:%s.enc.key",
                folder_name, folder_name, ALGORITHM, ITER, folder_name, folder_name);
        system(cmd);
        
        // rm -r command, similar to the Bash script
        snprintf(cmd, sizeof(cmd), "rm -r %s", folder_name);
        system(cmd);

    } else if(strcmp(option, "-d") == 0) {
        // Check if encrypted file exists
        snprintf(cmd, sizeof(cmd), "%s.tar.gz.enc", folder_name);
        if (access(cmd, F_OK) == -1) {
            fprintf(stderr, "Error: Encrypted folder does not exist.\n");
            return 1;
        }

        // openssl and tar commands, similar to the Bash script
        snprintf(cmd, sizeof(cmd), "openssl enc -%s -d -salt -pbkdf2 -iter %d -in %s.tar.gz.enc -out %s.tar.gz -pass file:%s.enc.key && mkdir %s && tar xzf %s.tar.gz -C %s",
                 ALGORITHM, ITER, folder_name, folder_name, folder_name, folder_name, folder_name, folder_name);
        system(cmd);

        // rm command, similar to the Bash script
        snprintf(cmd, sizeof(cmd), "rm %s.tar.gz %s.tar.gz.enc %s.enc.key", folder_name, folder_name, folder_name);
        system(cmd);

    } else {
        fprintf(stderr, "Error: Invalid option. Use -e for encrypt or -d for decrypt.\n");
        return 1;
    }

    return 0;
}
