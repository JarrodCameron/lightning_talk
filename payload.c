// Author: Jarrod Cameron (z5210220)
// Date:   17/07/19 13:32

#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#define check() printf("Here -> %d (%s)\n", __LINE__, __FUNCTION__)

int main (void)
{

    char *args[] = {
        "/usr/bin/mpv",
        "vid.mkv",
        NULL
    };

    char *env[] = {
        "XDG_RUNTIME_DIR=/run/user/1000",
        "DISPLAY=:0",
        NULL
    };

    execve(args[0], args, env);

    return 0;
}

