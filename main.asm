section .data
    star db "*"
    nl db 10

section .bss
    inbuf resb 2            ; the digit and the newline

section .text
    global _start
_start:
    mov rax, 0              ; read
    mov rdi, 0
    mov rsi, inbuf
    mov rdx, 2
    syscall
    movzx r12, byte [inbuf]
    sub r12, '0'            ; r12 = N, the number of rows
    mov rbx, 1

    ; TODO: print the staircase. Two nested loops; remember that `syscall`
    ;       overwrites rcx and r11, so keep your counters elsewhere.
.outer:
    cmp rbx, r12
    ja .done
    lea r15, [rbx]
.inner:
    cmp r15, 0
    je .next
    mov rax, 1
    mov rdi, 1
    mov rsi, star
    mov rdx, 1
    syscall
    dec r15
    jmp .inner
.next:
    mov rax, 1
    mov rdi, 1
    mov rsi, nl
    mov rdx, 1
    syscall
    inc rbx
    jmp .outer
.done:


    mov rax, 60
    xor rdi, rdi
    syscall
