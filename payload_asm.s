; This is an assembly implementation of the code found in payload.c

section     .text
global main
main:

        call .checkpoint

.checkpoint:
        ; Move &checkpoint into `eax`
        mov eax, [esp]

        ; push NULL
        xor ebx, ebx
        push ebx

        ; push "vid.mkv"
        lea ebx, [eax + (argv2-$) - (.checkpoint-$)]
        push ebx

        ; push "/usr/bin/mpv"
        lea ebx, [eax + (argv1-$) - (.checkpoint-$)]
        push ebx

        ; push NULL
        xor ebx, ebx
        push ebx

        ; push "DISPLAY=:0"
        lea ebx, [eax + (envp3-$) - (.checkpoint-$)]
        push ebx

        ; push "XDG_RUNTIME_DIR=/run/user/1000"
        lea ebx, [eax + (envp2-$) - (.checkpoint-$)]
        push ebx

        ; push "HOME=/home/jc"
        lea ebx, [eax + (envp1-$) - (.checkpoint-$)]
        push ebx

        ; execve("/usr/bin/mpv", ..., ...)
        lea edx, [esp]
        lea ecx, [esp + 16]
        lea ebx, [eax + (argv1-$) - (.checkpoint-$)]
        lea eax, [0xb]
        int 0x80

        ; exit(0)
        lea eax, [1]
        xor ebx, ebx
        int 0x80

argv1:  db "/usr/bin/mpv", 0
argv2:  db "vid.mkv", 0
envp1:  db "HOME=/home/jc", 0
envp2:  db "XDG_RUNTIME_DIR=/run/user/1000", 0
envp3:  db "DISPLAY=:0", 0
