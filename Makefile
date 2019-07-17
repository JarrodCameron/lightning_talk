# Author: Jarrod Cameron (z5210220)
# Date:   24/06/19 10:22

CC=gcc
CFLAGS=-m32 -fno-stack-protector -O0 -z execstack -no-pie
LDFLAGS=-m32 -z execstack -no-pie


all: vuln hak

vuln: vuln.c

hak: hak.c
	$(CC) hak.c -o hak

asm: payload.s
	nasm -f elf32 payload.s
	gcc -m32 payload.o -o payload
	rm payload.o

payload: payload.c
	$(CC) payload.c -o payload

clean:
	rm -f *.o *.txt payload vuln hak

