.386
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;includem msvcrt.lib, si declaram ce functii vrem sa importam
includelib msvcrt.lib
extern exit: proc
extern fopen: proc
extern fscanf: proc
extern fprintf:proc
extern fgets:proc
extern fseek:proc
extern fclose:proc

public start
.data
    seek_set DD 0
    seek_cur DD 1
    seek_end DD 2
    mode1 DB "r",0
    mode2 DB "a",0
    inputfile DB "input.in",0
    outputfile DB "output.out",0
    input_pointer DD 0
    output_pointer DD 0
    format DB "%s",0
    format2 DB "%c",0
    character_buffer DD 0
    output_buffer DD 0

.code
start:
    push offset mode1
    push offset inputfile
    call fopen
    add ESP, 8
    mov input_pointer, EAX
    xor EBX, EBX
    push offset inputfile
    call fclose
    add ESP, 4
    push offset mode2
    push offset outputfile
    call fopen
    add ESP, 8
    mov output_pointer,EAX
    push offset outputfile
    call fclose
    add ESP, 4
    push offset mode1
    push offset inputfile
    call fopen
    add ESP, 8

search_for_endline:
    push seek_end
    push EBX
    push input_pointer
    call fseek
    add ESP, 8
    cmp EAX, 0
    jne done
    push offset character_buffer
    push offset format2
    push input_pointer
    call fscanf
    add ESP, 8
    cmp character_buffer, 10
    je read_line_and_print
    sub EBX, 1
    jmp search_for_endline

read_line_and_print:
    push input_pointer
    push 100
    push offset output_buffer
    call fgets
    add ESP, 12
    sub EBX, 1

    push offset mode2
    push offset outputfile
    call fopen
    add ESP, 8

    push offset output_buffer
    push offset format
    push EAX
    call fprintf
    add ESP, 12
    jmp search_for_endline

done:
    push 0
    call exit
end start
