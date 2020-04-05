.386
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;includem msvcrt.lib, si declaram ce functii vrem sa importam
includelib msvcrt.lib
extern exit: proc
extern scanf: proc
extern printf: proc


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;declaram simbolul start ca public - de acolo incepe executia
public start
.data
    msg DB "n=", 0
    n DD 0
    format DB "%d", 0
    format2 DB "The number is %d", 0
.code
start:
    push offset msg
    call printf
    add ESP, 4
    push offset n
    push offset format
    call scanf
    add ESP, 8
    push n
    push offset format2
    call printf
    add ESP, 8
    push 0
    call exit
end start
