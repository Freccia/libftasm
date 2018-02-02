; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_puts.s                                          :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: lfabbro <lfabbro@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/02/01 16:32:29 by lfabbro           #+#    #+#              ;
;    Updated: 2018/02/02 11:40:28 by lfabbro          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

%define MACH_SYSCALL(nb)	0x2000000 | nb
%define STDOUT				1
%define WRITE				4

extern		_ft_strlen
global		_ft_puts

section		.data
newline		db 10

section		.text

_ft_puts:
	xor		rdx, rdx
	mov		rsi, rdi

.ft_strlen:
	call	_ft_strlen
	mov		rdx, rax

.write:
	mov		rdi, STDOUT
	mov		rax, MACH_SYSCALL(WRITE)
	syscall
	push	rax

.write_nl:
	lea		rsi, [rel newline]
	mov		rdx, 1
	mov		rdi, STDOUT
	mov		rax, MACH_SYSCALL(WRITE)
	syscall
	
.end:
	pop		rax
	inc		rax
	ret
