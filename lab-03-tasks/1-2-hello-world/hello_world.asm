%include "io.inc"

section .data
    myString: db "Hello, World!",0
    secondString: db "Goodbye World!",0
section .text
global CMAIN
CMAIN:
    mov ecx, 6                 ; N = valoarea registrului ecx
    mov eax, 1
    mov ebx, 1
    cmp eax, ebx
    jge print                   ; TODO1: eax > ebx?
    ret

print:
    PRINT_STRING myString
    NEWLINE
    dec ecx
    cmp ecx, 0
    jne print
    PRINT_STRING secondString
    
                               ; TODO2.2: afisati "Hello, World!" de N ori
                               ; TODO2.1: afisati "Goodbye, World!"

    ret
