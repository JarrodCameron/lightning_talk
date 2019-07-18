#include <stdlib.h>
#include <unistd.h>

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

    // If we fail then quit.
    exit(0);

    return 0;
}

