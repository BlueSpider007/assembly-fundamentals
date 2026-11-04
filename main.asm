section .data
    result db "00", 10      ; tens digit, ones digit, newline

section .bss
    digits resb 3           ; two digit characters and the newline

section .text
    global _start
_start:
    mov rax, 0              ; read
    mov rdi, 0
    mov rsi, digits
    mov rdx, 3
    syscall

    ; TODO: turn the two characters in `digits` into the sum of their values,
    ;       then store its tens and ones digits as characters into `result`

    movzx rax, byte [digits]
    sub rax, '0'
    movzx rbx, byte [digits + 1]
    sub rbx, '0'
    add rax, rbx
    xor rdx, rdx
    mov rbx, 10
    div rbx

    add al, '0'
    mov [result], al
    add dl, '0'
    mov [result + 1], dl

    mov rax, 1              ; write the three bytes of `result`
    mov rdi, 1
    mov rsi, result
    mov rdx, 3
    syscall

    mov rax, 60
    xor rdi, rdi
    syscall
