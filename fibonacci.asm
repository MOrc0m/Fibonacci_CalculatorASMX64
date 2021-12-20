
; calculate the 20th Fibonacci number
 
section  .data

; -----

; Define constants

EXIT_SUCCESS equ 0
SYS_exit equ 60

; -----

; Define  data.

n   dd 20  ; Fibonacci sequence element to calculate
rst dq 0


; ******************************************************

section .text
global _start
_start:

mov rax, 0 ;fn-2
mov ecx, dword[n]
mov rbx, 1 ;fn-1
sub ecx, 2 ;we start from te 3rd element (counting from f0 = 0 since f1 and f2 both = 1)
fibo:
 mov rdx, 0
 add rdx,rax
 add rdx, rbx
 mov rax, rbx 
 mov rbx, rdx
loop fibo
mov rax, 0
mov qword[rst], rbx

; *************************************************************************************
; Done, terminate program.

last:
   mov rax, SYS_exit
   mov rdi, EXIT_SUCCESS
   syscall
