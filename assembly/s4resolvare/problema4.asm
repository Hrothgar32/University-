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

;sectiunile programului, date, respectiv cod
    .data
    sir db 1, 4, 5, 1, 5
.code
start:
    mov eax, 0
    mov ebx, 0
    add al, byte ptr sir[ebx]
    inc ebx
    add al, byte ptr sir[ebx]
    inc ebx
    add al, byte ptr sir[ebx]
    inc ebx
    add al, byte ptr sir[ebx]
    inc ebx
    add al, byte ptr sir[ebx]
    inc ebx
    mov cl, al
    mov bl, 2
    mul bl
    ;; al contine numarul care nu s-a duplificat
    sub al, cl
    push 0
    call exit
end start
