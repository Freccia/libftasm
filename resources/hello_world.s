section .data
hello:
.string db "Hello World!". 10
.len equ $ - hello.string

section .text
global start
global _main
extern _printf

start:
call _main
ret

_main:
push rbp
mov rbp, rsp
sub rsp. 16
lea rdi, [rel hello.string]
call _printf
leave
ret

// lea load effective address
// nasm -f macho64 libc.s -o libc.o
// ld libc.o-macosx_min_version 10.8 -lSystem

