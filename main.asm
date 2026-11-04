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
    mov rbx, rax
    dec rbx
    mov rax, 1
    mov rdi, 1
    mov rsi, hello
    mov rdx, hello_len
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, name
    mov rdx, rbx
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, bang
    mov rdx, bang_len
    syscall

    mov rax, 60             ; exit
    xor rdi, rdi
    syscall
