 .586
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;includem msvcrt.lib, si declaram ce functii vrem sa importam
includelib msvcrt.lib
extern exit: proc
extern printf: proc
extern scanf: proc

public start

.data
    format DB "%d",0
    mesaj1 DB "Mai mic",0
    mesaj2 DB "Mai mare",0
    number DB 0


.code
start:
    rdtsc
    xor ebx, ebx
    mov bl, al
read:
    push offset number
    push offset format
    call scanf
    add ESP, 8

    cmp bl, number
    je ex
    jl less
    jg greater

less:
    push offset mesaj1
    call printf
    add ESP, 4
    jmp read

greater:
    push offset mesaj2
    call printf
    add ESP, 4
    jmp read

ex:
    push 0
    call exit
end start
