section     .text
global main
main:

    ; Add these so the code is four byte aligned
    nop
    nop
    nop

    ; Relative jump to `call'
    jmp shellcode_bot

    ; We now have the address of &argv[0]
shellcode_top:
    pop edi

    ; Save *filename
    lea ebx, [edi]

    ; push NULL
    xor eax, eax
    push eax

    ; push &argv[1]
    lea eax, [edi + 16]
    push eax

    ; push &argv[0]
    push edi

    ; Save **args
    lea ecx, [esp]

    ; push NULL
    xor eax, eax
    push eax

    ; push &env[0]
    lea eax, [edi + 56]
    push eax

    ; push &env[1]
    lea eax, [edi + 24]
    push eax

    ; Save **env
    lea edx, [esp]

    ; Syscall number
    mov eax, 0x0b

    ; execve()
    int 0x80

    ; If fail, then exit(0)
    xor eax, eax
    inc eax
    xor ebx, ebx
    int 0x80

    ; Go back to `pop edi'
shellcode_bot:
    call shellcode_top

    arg1 db "/usr/bin/mpv", 0, 0, 0, 0              ; argv[0] -> Program to invoke
    arg2 db "vid.mkv", 0                            ; argv[1] -> Selected video
    env1 db "XDG_RUNTIME_DIR=/run/user/1000", 0, 0  ; env[0] -> Video stuff
    env2 db "DISPLAY=:0", 0, 0                      ; env[1] -> Where to start on the screen

