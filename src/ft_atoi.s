; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_atoi.s                                          :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: lfabbro <lfabbro@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/02/05 19:22:45 by lfabbro           #+#    #+#              ;
;    Updated: 2018/02/06 14:53:43 by lfabbro          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

global		_ft_atoi
section		.text

_ft_atoi:
	push	rbp				;
	mov		rbp, rsp		;
	xor		rax, rax		; init
	xor		rdx, rdx		; init
	mov		ebx, 1			; sign
	mov		ecx, 10			; base
	dec		rdi				;

.loop:
	inc		rdi				;
	cmp		rdi, 0			;
	je		.end			;
	cmp		byte [rdi], 32	; (*rdi == ' ')
	je		.loop			;
	cmp		byte [rdi], 9	; (*rdi == '\t')
	je		.loop			;
	cmp		byte [rdi], 10	; (*rdi == '\n')
	je		.loop			;
	cmp		byte [rdi], 11	; (*rdi == '\v')
	je		.loop			;
	cmp		byte [rdi], 12	; (*rdi == '\f')
	je		.loop			;
	cmp		byte [rdi], 13	; (*rdi == '\r')
	je		.loop			;

.number:
	cmp		byte [rdi], 43	; (*rdi == '+')
	je		.inc			;	++rdi
	cmp		byte [rdi], 45	; (*rdi == '-')
	je		.neg			;	++rdi

.number_loop:
	cmp		byte [rdi], 48	; (s[i] < '0')
	jl		.end			;
	cmp		byte [rdi], 57	; (s[i] > '9')
	jg		.end			;
	mul		ecx				; n * 10
	push	rax				;
	movzx	eax, byte [rdi]	; s[i]
	sub		eax, 48			;
	div		ecx				; 	% 10 (stored in edx)
	pop		rax
	add		eax, edx		; (n*10) + (s[i] - '0') % 10
	inc		rdi				;
	jmp		.number_loop	;

.end:
	mul		ebx				; eax * sign
	pop		rbp				;
	ret						;

.inc:
	inc		rdi				;
	jmp		.number_loop	;

.neg:
	mov		ebx, -1			;
	inc		rdi				;
	jmp		.number_loop	;
