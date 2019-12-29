%include "io.inc"

section .data
    string: db "HELLO", 0

section .text
global CMAIN

reverse:
    push ebp
    mov ebp, esp
    mov esi, [ebp + 8]
    mov ecx, [ebp + 12]
    
    sub esp, ecx
    lea edi, [esp]
    cld
    rep movsb
    
    mov edi, [ebp + 8]
    mov ecx, [ebp + 12]
    
move_bytes:
    mov al, [esp]
    mov [edi + ecx - 1], al
    inc esp
    loop move_bytes
    
    add esp, 5

    leave
    ret
CMAIN:
    ;write your code here
    mov ebp, esp
    
    mov ecx, 5
    push ecx
    mov eax, string
    push eax
    call reverse
    add esp, 8
    
   mov ecx, 0
   mov edi, string
print1:
   mov al, byte [edi + ecx]
   PRINT_CHAR al
   inc ecx
   cmp ecx, 5
   jne print1 
   NEWLINE
    xor eax, eax
    ret