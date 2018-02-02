; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_cat.s                                           :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: lfabbro <lfabbro@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/02/02 16:08:04 by lfabbro           #+#    #+#              ;
;    Updated: 2018/02/02 22:40:23 by lfabbro          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

%define MACH_SYSCALL(nb)	0x2000000 | nb
%define STDOUT				1
%define READ				3
%define WRITE				4

extern		_malloc
extern		_free
global		_ft_cat

section		.data
buf:
	.ptr	db  "           "
	.size	equ 512

section		.text
_ft_cat:
	cmp		rdi, 0			; fd == 0
	je		.stdin			;

.file:
	mov		rdx, buf.size	; read arg buf.size
	jmp		.init			;

.stdin:
	mov		rdx, 1			; buf.size = 1

.init:
	lea		rsi, [rel buf.ptr]	;
	push	rdx				;

.loop:
	push	rdi				;
	mov		rax, MACH_SYSCALL(READ)	;
	syscall					;
	cmp		rax, 0			; rax <= 0
	jng		.end			; 	return
	pop		rdi				;
	pop		rdx				;
	push	rdx				;
	push	rdi				;
	mov		rdi, 1			;
	mov		rdx, rax		;
	mov		rax, MACH_SYSCALL(WRITE) ;
	syscall					;
	pop		rdi				;
	pop		rdx				;
	push	rdx				;
	jmp		.loop			;

.end:
	leave
	ret

