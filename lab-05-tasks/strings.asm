%include "io.inc"

section .data
    string db "Lorem ipsum dolor sit amet.", 0
    print_strlen db "strlen: ", 10, 0
    print_occ db "occurences of `i`:", 10, 0

    occurences dd 0
    length dd 0    
    char db 'i'

section .text
global CMAIN
CMAIN:
    push ebp
    mov ebp, esp

    ; TODO1: compute the length of a string
    mov al, '.'
    mov edi,string
    repne scasb
    sub edi, string
    ; TODO1: save the result in at address length
    mov [length], edi
    ; print the result of strlen
    PRINT_STRING print_strlen
    PRINT_UDEC 4, [length]
    NEWLINE
    xor eax, eax
    xor edx, edx
    xor ecx, ecx
    ; TODO2: compute the number of occurences
   mov ebx, 0
 
    mov al, 'i'
    mov edi, string
    mov ecx, [length]
   
    label:
    repne scasb
    inc ebx
    cmp ecx, 0 
    jne label
    dec ebx
    sub edi, string
    
    ;PRINT_UDEC 4, ebx
    ;NEWLINE
    ;PRINT_UDEC 4, ecx
    ;NEWLINE
    ; TODO2: save the result in at address occurences
     mov [occurences], ebx
    ; print the number of occurences of the char
    PRINT_STRING print_occ
    PRINT_UDEC 4, [occurences]
    NEWLINE

    xor eax, eax
    leave
    ret
