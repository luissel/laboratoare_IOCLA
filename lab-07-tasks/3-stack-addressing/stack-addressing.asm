%include "io.inc"

%define NUM 5

section .text
global CMAIN
CMAIN:
    mov ebp, esp

    ; TODO 1: replace every push by an equivalent sequence of commands
    mov ecx, NUM
push_nums:
    ;push ecx
    sub esp, 4
    mov [esp], ecx
    loop push_nums
    ;push 0
    xor ebx, ebx
    sub esp, 4
    mov [esp], ebx
    ;push "mere"
    sub esp, 4
    mov dword[esp], "mere"
   ; push "are "
    sub esp, 4
    mov dword[esp], "are "
    ;push "Ana "
    sub esp, 4
    mov dword[esp], "Ana "

    PRINT_STRING [esp]
    NEWLINE

    ; TODO 2: print the stack in "address: value" format in the range of [ESP:EBP]
    xor ecx, ecx
    mov ecx, 9
label:
    xor eax, eax
    mov eax, esp
    add eax, ecx
    PRINT_STRING "0x"
    PRINT_HEX 4, eax
    PRINT_STRING ": 0x"
    PRINT_HEX 4, [esp + ecx * 4]
    NEWLINE
    sub ecx, 1
    cmp ecx, 0
    jge label
    
    ; TODO 3: print the string
    PRINT_STRING [esp]
    ; restore the previous value of the EBP (Base Pointer)
    mov esp, ebp

    ; exit without errors
    xor eax, eax
    ret
