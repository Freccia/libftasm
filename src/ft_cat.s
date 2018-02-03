; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_cat.s                                           :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: lfabbro <lfabbro@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/02/02 16:08:04 by lfabbro           #+#    #+#              ;
;    Updated: 2018/02/03 01:08:03 by lfabbro          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

%define MACH_SYSCALL(nb)	0x2000000 | nb
%define STDOUT				1
%define READ				3
%define WRITE				4
%define BUFSIZE				512

global		_ft_cat

section		.bss
buf:		resb BUFSIZE

section		.text
_ft_cat:
	push	rbp				;
	mov		rbp, rsp		;
	lea		rsi, [rel buf]	; loading buffer address

.loop:
	push	rdi				; rdi == fd
	mov		rdx, BUFSIZE	; reading BUFSIZE bytes

	mov		rax, MACH_SYSCALL(READ)	;
	syscall					;
	jc		.err			;

	push	rax				;
	mov		rdi, STDOUT		; write on stdout
	mov		rdx, rax		; write rax (read) bytes

	mov		rax, MACH_SYSCALL(WRITE) ;
	syscall					;
	jc		.err1			;

	pop		rax				;
	pop		rdi				; rdi = fd
	cmp		rax, 0			;
	jg		.loop			;

.end:
	mov		rsp, rbp		;
	pop		rbp				;
	ret						;

.err1:
	pop		rax				;
.err:
	mov		rax, -1			;
	jmp		.end			;

