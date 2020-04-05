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
    NUM1 DW 10
    NUM2 DW 5
    REZ DW 0
    PARTREZ DW 0

    .code
start:
    mov eax, 0
    mov ax, 14
    mov bx, 6
    add PARTREZ, ax
    add PARTREZ, bx ;; Calcul AX + BX in variabila PARTREZ
    mov cx, NUM1
    mul cx
    add REZ, ax ;; Calcul AX*NUM1
    mov ax, num2
    mov cx, PARTREZ
    mul cx ;; Calcul (AX+BX)*NUM2
    add REZ, ax ;; Calcul AX*NUM1 + (AX+BX)*NUM2
    push 0
    call exit
end start
