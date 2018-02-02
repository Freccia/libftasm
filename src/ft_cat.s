; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_cat.s                                           :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: lfabbro <lfabbro@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/02/02 16:08:04 by lfabbro           #+#    #+#              ;
;    Updated: 2018/02/02 22:57:05 by lfabbro          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

%define MACH_SYSCALL(nb)	0x2000000 | nb
%define STDOUT				1
%define READ				3
%define WRITE				4

global		_ft_cat

section		.data
buf:
	.ptr	dd  "                                                            "
	.len	equ $ - buf.ptr

section		.text
_ft_cat:
	mov		rdx, buf.len	; reading buf.len bytes
	lea		rsi, [rel buf.ptr]	; storing into buffer
	push	rdx				; saving len from being destroyed by read and write

.loop:
	push	rdi				; rdi == fd
	mov		rax, MACH_SYSCALL(READ)	;
	syscall					;
	cmp		rax, 0			; (rax <= 0)
	jng		.end			; 	return
	mov		rdi, STDOUT		; write on stdout
	mov		rdx, rax		; write rax (read) bytes
	mov		rax, MACH_SYSCALL(WRITE) ;
	syscall					;
	pop		rdi				; rdi = fd
	pop		rdx				; rdx = buf.len
	push	rdx				; rdx == buf.len
	jmp		.loop			;

.end:
	leave
	ret

