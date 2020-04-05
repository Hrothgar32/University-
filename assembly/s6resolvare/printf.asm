.386
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;includem msvcrt.lib, si declaram ce functii vrem sa importam
includelib msvcrt.lib
extern exit: proc
extern printf: proc

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;declaram simbolul start ca public - de acolo incepe executia
public start
.data
    nume DB "Ion", 0
    varsta DD 20
    format DB "Ma numesc %s si am %d de ani.\n", 0

.code
start:
    push varsta
    push offset nume
    push offset format
    call printf
    add ESP, 12
    push 0
    call exit
end start
