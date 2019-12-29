%include "io.inc"
%define ARRAY_SIZE    5

section .data
    dword_array: dd 1, 2, 3, 4, 5
section .bss    
    p: resd 5
section .text
global CMAIN
CMAIN:
    ;write your code here
    mov ebp, esp
    
    mov ecx, ARRAY_SIZE
    xor ebx, ebx
    xor edx, edx
    
add_dword_array_element:
    mov edx, dword [dword_array + 4 * ecx - 4]
    ;patrat
    mov eax, edx
    mul eax
    ;sum
    mov [p + 4 * ecx - 4], eax
    add ebx, eax
    loop add_dword_array_element
    
print:
    mov eax, dword[p + 4 * ecx]
    PRINT_DEC 4, eax
    PRINT_STRING " "
    
    inc ecx
    cmp ecx, 5
    jl print   
    
    NEWLINE
    PRINT_STRING "Sum"
    PRINT_UDEC 4, ebx
    NEWLINE
    xor eax, eax
    ret