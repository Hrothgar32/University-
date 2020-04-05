.386
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;includem msvcrt.lib, si declaram ce functii vrem sa importam
includelib msvcrt.lib
extern exit: proc
extern printf: proc
extern scanf: proc
extern fopen: proc
extern fprintf:proc
extern fclose:proc


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;declaram simbolul start ca public - de acolo incepe executia
public start
.data
    file_name DB "filename",0
    mode DB "w",0
    lungime_sir DD 4
    format_sir DB "%s",0
    sir_pointer DB 0

.code
start:
    push offset sir_pointer
    push offset format_sir
    call scanf
    add ESP, 8

    mov ESI, offset sir_pointer[3]
    mov EDI, offset sir_pointer[4]
    mov ECX, lungime_sir

cpy:
    mov AL, [ESI]
    mov [EDI],AL
    sub ESI, 1
    add EDI, 1
    loop cpy
    sub EDI, 4

    push offset mode
    push offset file_name
    call fopen
    add ESP, 12

    push EDI
    push offset format_sir
    push EAX
    call fprintf
    pop EAX
    add ESP, 8

    push EAX
    call fclose
    add ESP, 4


    push 0
    call exit
end start
