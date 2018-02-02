; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_cat.s                                           :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: lfabbro <lfabbro@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/02/02 16:08:04 by lfabbro           #+#    #+#              ;
;    Updated: 2018/02/02 23:09:08 by lfabbro          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

%define MACH_SYSCALL(nb)	0x2000000 | nb
%define STDOUT				1
%define READ				3
%define WRITE				4
%define BUFSIZE				512

global		_ft_cat

section		.data
buf:
	.ptr	resb BUFSIZE

section		.text
_ft_cat:
	lea		rsi, [rel buf.ptr]	; loading buffer address

.loop:
	push	rdi				; rdi == fd
	mov		rdx, BUFSIZE	; reading BUFSIZE bytes
	mov		rax, MACH_SYSCALL(READ)	;
	syscall					;
	cmp		rax, 0			; (rax <= 0)
	jng		.end			; 	return
	mov		rdi, STDOUT		; write on stdout
	mov		rdx, rax		; write rax (read) bytes
	mov		rax, MACH_SYSCALL(WRITE) ;
	syscall					;
	pop		rdi				; rdi = fd
	jmp		.loop			;

.end:
	leave
	ret

