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
    sir db 1,2,3,4
    media db 0
    dummy db 0
.code
start:
    lea esi, sir
    mov ax, 0
    mov cl, 0

    add al,byte ptr[esi]
    add esi, 1
    add cl, 1

    add al,byte ptr[esi]
    add esi, 1
    add cl, 1

    add al,byte ptr[esi]
    add esi, 1
    add cl, 1

    add al,byte ptr[esi]
    add esi, 1
    add cl, 1

    div cl
    add media, al

    push 0
    call exit
end start
