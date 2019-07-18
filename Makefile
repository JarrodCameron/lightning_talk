CC=gcc
CFLAGS=-m32 -fno-stack-protector -O0 -z execstack -no-pie
LDFLAGS=-m32 -z execstack -no-pie

all: vuln hak

vuln: vuln.c

hak: hak.c
	$(CC) -m32 hak.c -o hak

payload_asm: payload_asm.s
	nasm -f elf32 payload_asm.s
	gcc -m32 payload_asm.o -o payload_asm
	rm payload_asm.o

payload: payload.c
	$(CC) -m32 -g payload.c -o payload

clean:
	rm -f *.o *.txt payload vuln hak payload_asm

