// Author: Jarrod Cameron (z5210220)
// Date:   06/07/19 18:11

#include <stdio.h>
#include <unistd.h>

void vuln(void)
{
	char buffer[256];

	printf("Show me some elite hacker skillz\n");
	printf("The buffer is at %p\n", buffer);
	gets(buffer);
}

int main (void)
{
	setbuf(stdout, NULL);
	vuln();
	return 0;
}

