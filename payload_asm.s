;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; This is an assembly implementation of the code found in payload.c
;
;   char *args[] = {
;       "/usr/bin/mpv",
;       "vid.mkv",
;       NULL
;   };
;
;   char *env[] = {
;       "HOME=/home/jc",
;       "XDG_RUNTIME_DIR=/run/user/1000",
;       "DISPLAY=:0",
;       NULL
;   };
;
;   execve(args[0], args, env);
;
;   // If we fail then quit.
;   exit(0)

section     .text
global main
main:

        call .checkpoint

.checkpoint:
        ; Move &checkpoint into `eax`
        mov eax, [esp]

        xor ebx, ebx
        push ebx

        lea ebx, [eax + (argv2-$) - (.checkpoint-$)]
        push ebx

        lea ebx, [eax + (argv1-$) - (.checkpoint-$)]
        push ebx

        xor ebx, ebx
        push ebx

        lea ebx, [eax + (envp3-$) - (.checkpoint-$)]
        push ebx

        lea ebx, [eax + (envp2-$) - (.checkpoint-$)]
        push ebx

        lea ebx, [eax + (envp1-$) - (.checkpoint-$)]
        push ebx

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
