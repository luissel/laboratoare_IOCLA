%include "io.inc"

section .data
source_text: db "ABCABCBABCBABCBBBABABBCBABCBAAACCCB", 0
substring: db "BABC", 0

source_length: resd 1
substr_length: dd 4

print_format: db "Substring found at index: ", 0

section .text
global CMAIN
CMAIN:
    push ebp
    mov ebp, esp
   
    ; TODO: Fill source_length with the length of the source_text string.
    ; Find the length of the string using scasb.
   
    sub al, al
    mov edi, source_text
    repne scasb
    sub edi, source_text
    mov [source_length], edi
        
    ; print the result of strlen
    PRINT_STRING print_format
    PRINT_UDEC 4, [source_length]
    NEWLINE
    ; TODO: Print the start indices for all occurrences of the substring in source_text

    leave
    ret
