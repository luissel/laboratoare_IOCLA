%include "io.inc"

section .text
global CMAIN
CMAIN:
    ;cele doua multimi se gasesc in eax si ebx
    mov eax, 139 
    mov ebx, 169
    PRINT_DEC 4, eax ; afiseaza prima multime
    NEWLINE
    PRINT_DEC 4, ebx ; afiseaza cea de-a doua multime
    NEWLINE

    ; TODO1: reuniunea a doua multimi
    mov ecx, 0
    or ecx, eax
    or ecx, ebx
    PRINT_STRING "reuniune: "
    PRINT_DEC 4, ecx
    NEWLINE

    ; TODO2: adaugarea unui element in multime
    or ecx, 0x606
    PRINT_STRING "adaugare: "
    PRINT_DEC 4, ecx
    NEWLINE

    ; TODO3: intersectia a doua multimi
    mov edx, 0xffff
    and edx, eax
    and edx, ebx
    PRINT_STRING "intersectia: "
    PRINT_DEC 4, edx
    NEWLINE

    ; TODO4: complementul unei multimi
    not eax
    and eax, 0xff
    PRINT_STRING "complement: "
    PRINT_DEC 4, eax
    NEWLINE

    ; TODO5: eliminarea unui element
    mov edx, eax
    xor edx, 5
    and eax, edx
    PRINT_STRING "eliminare: "
    PRINT_DEC 4, eax
    NEWLINE

    ; TODO6: diferenta de multimi EAX-EBX
    not ebx
    and eax, ebx
    PRINT_STRING "diferenta: "
    PRINT_DEC 4, eax
    NEWLINE
    
    xor eax, eax
    ret
