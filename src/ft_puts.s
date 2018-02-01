; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_puts.s                                          :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: lfabbro <lfabbro@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/02/01 16:32:29 by lfabbro           #+#    #+#              ;
;    Updated: 2018/02/01 18:38:20 by lfabbro          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

%define MACH_SYSCALL(nb)	0x2000000 | nb
%define STDOUT				1
%define WRITE				4

global		_ft_puts

section		.data
newline		db 10

section		.text

_ft_puts:
	xor		rdx, rdx
	mov		rsi, rdi

.slen:
	cmp		byte [rsi + rdx], 0
	je		.write
	inc		rdx
	jmp		.slen

.write:
	mov		rdi, STDOUT
	mov		rax, MACH_SYSCALL(WRITE)
	syscall
	pop		rax

.write_nl:
	lea		rsi, [rel newline]
	mov		rdx, 1
	mov		rdi, STDOUT
	mov		rax, MACH_SYSCALL(WRITE)
	syscall
	
.end:
	pop		rax
	inc		rax
	leave
	ret
