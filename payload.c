#include <stdlib.h>
#include <unistd.h>

void payload (void)
{
	__asm__("nop");
	__asm__("nop");
	__asm__("nop");

	char argv1[] = "/usr/bin/mpv";
	char argv2[] = "vid.mkv";
	char *argv[] = {argv1, argv2, NULL};

	char envp1[] = "HOME=/home/jc";
	char envp2[] = "XDG_RUNTIME_DIR=/run/user/1000";
	char envp3[] = "DISPLAY=:0";
	char *envp[] = {envp1, envp2, envp3, NULL};

	execve(argv[0], argv, envp);

	// If we fail then quit.
	exit(0);
}

int main (void)
{
    payload();
    return 0;
}

