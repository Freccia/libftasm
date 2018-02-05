; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_isnbr.s                                         :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: lfabbro <lfabbro@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/02/05 18:38:55 by lfabbro           #+#    #+#              ;
;    Updated: 2018/02/05 19:51:10 by lfabbro          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

global		_ft_isnbr
section		.text

_ft_isnbr:
	push	rbp				;
	mov		rbp, rsp		;
	xor		rax, rax		;
	dec		rdi				;

.loop:
	inc		rdi				;
	cmp		rdi, 0			;
	je		.end			;
	cmp		byte [rdi], 32	; (*rdi == ' ')
	je		.loop			;
	cmp		byte [rdi], 10	; (*rdi == '\n')
	je		.loop			;
	cmp		byte [rdi], 9	; (*rdi == '\t')
	je		.loop			;
	cmp		byte [rdi], 11	; (*rdi == '\v')
	je		.loop			;
	cmp		byte [rdi], 13	; (*rdi == '\r')
	je		.loop			;

	cmp		byte [rdi], 43		; (*rdi == '+')
	je		.inc			;	++rdi
	cmp		byte [rdi], 45		; (*rdi == '-')
	je		.inc			;	++rdi

.isn:
	cmp		byte [rdi], 48		; (*rdi < '0')
	jl		.end			;	false
	cmp		byte [rdi], 57		; (*rdi > '9')
	jg		.end			;	false
	mov		rax, 1			; true

.end:
	pop		rbp				;
	ret						;

.inc:
	inc		rdi				;
	jmp		.isn			;
