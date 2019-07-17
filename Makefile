# Author: Jarrod Cameron (z5210220)
# Date:   24/06/19 10:22

CC=gcc
CFLAGS=-m32 -fno-stack-protector -O0 -z execstack -no-pie
LDFLAGS=-m32 -z execstack -no-pie


all: vuln hak

vuln: vuln.c

asm: asm.s
	nasm -f elf32 asm.s
	gcc -m32 asm.o -o asm
	rm asm.o

payload: payload.c
	$(CC) -m32 -g payload.c -o payload

clean:
	rm -f *.o *.txt payload vuln hak

