section .data
    hello db "Hello, "
    hello_len equ $ - hello
    bang db "!", 10
    bang_len equ $ - bang

section .bss
    name resb 64

section .text
    global _start
_start:
    mov rax, 0              ; read
    mov rdi, 0              ; fd 0 = stdin
    mov rsi, name
    mov rdx, 64             ; room for up to 64 bytes
    syscall
    ; TODO: print the greeting (see the exercise), then fall through to exit

    mov rax, 60             ; exit
    xor rdi, rdi
    syscall
