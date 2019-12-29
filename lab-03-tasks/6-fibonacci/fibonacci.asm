%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov eax, 6      ; vrem sa aflam al N-lea numar; N = 7
    ; TODO: calculati al N-lea numar fibonacci (f(0) = 0, f(1) = 1)
    mov ebx, 0
    mov ecx, 1
label:
    add ebx, ecx
    mov edx, ebx
    mov ebx, ecx
    mov ecx, edx
    sub eax, 1
    cmp eax, 1
    jg label
    je exit
    
exit:
    PRINT_DEC 4, ebx
    NEWLINE
   
    ret