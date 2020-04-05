.386
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;includem msvcrt.lib, si declaram ce functii vrem sa importam
includelib msvcrt.lib
extern exit: proc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;declaram simbolul start ca public - de acolo incepe executia
public start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.data
    sir dw 10h, 21h, 3h, 2142h, 7h, 12h, 67h
    lgsir dd 7
    min dw 0
    max dw 0
.code
start:
    mov ax, 0
    mov bx, 0                   ; ax - minim, bx -maxim
    mov esi, 0
    mov ecx, lgsir
    mov ax, sir[esi]
    mov bx, sir[esi]

main_loop:
    cmp ax, sir[esi]
    jl cmp_max
    mov ax, sir[esi]
cmp_max:
    cmp bx, sir[esi]
    jg urmator
    mov bx, sir[esi]
urmator:
    add esi, 2
    loop main_loop

    mov min, ax
    mov max, bx

    push 0
    call exit
end start
