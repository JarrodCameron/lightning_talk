#include <stdlib.h>
#include <unistd.h>

void payload (void)
{
	char *argv[] = {
		"/usr/bin/mpv",
		"vid.mkv",
		NULL
	};

	char *envp[] = {
		"HOME=/home/jc",
		"XDG_RUNTIME_DIR=/run/user/1000",
		"DISPLAY=:0",
		NULL
	};

	execve(argv[0], argv, envp);

	// If we fail then quit.
	exit(0);
}

int main (void)
{
	payload();
	return 0;
}

