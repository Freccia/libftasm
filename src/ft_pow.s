; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_pow.s                                           :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: lfabbro <lfabbro@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/02/03 16:10:27 by lfabbro           #+#    #+#              ;
;    Updated: 2018/02/05 18:31:30 by lfabbro          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

global		_ft_ipow
global		_ft_upow
section		.text

_ft_ipow:
	push		rbp				;
	mov			rbp, rsp		;
	xor			rax, rax		;
	cmp			edi, 0			; (n == 0)
	je			.end			; 	return 0
	mov			eax, 1			;
	cmp			edi, 1			; (n = 1)
	je			.end			; 	return 1
	cmp			esi, 0			; (pow == 0)
	je			.end			; 	return 1
	cmp			edi, 0			; (n < 0)
	jl			.error			; 	return -1
	cmp			esi, 0			; (pow < 0)
	jl			.error			; 	return -1

.loop:
	cmp			esi, 0			; (pow == 0)
	je			.end			;	return tot = n ^ pow
	mov			ebx, eax		;
	mul			edi				;
	cmp			eax, ebx		; (eax < ebx) check for overflow
	jl			.error			;	return -1
	dec			esi				;
	jmp			.loop			;

.end:
	pop			rbp				;
	ret							;

.error:
	mov			eax, -1			;
	pop			rbp				;
	ret							;

_ft_upow:
	push		rbp				;
	mov			rbp, rsp		;
	xor			rax, rax		;
	cmp			edi, 0			; (n == 0)
	je			.end			; 	return 0
	mov			eax, 1			;
	cmp			edi, 1			; (n = 1)
	je			.end			; 	return 1
	cmp			esi, 0			; (pow == 0)
	je			.end			; 	return 1
	cmp			edi, 0			; (n < 0)
	jl			.error			; 	return -1
	cmp			esi, 0			; (pow < 0)
	jl			.error			; 	return -1

.loop:
	cmp			esi, 0			; (pow == 0)
	je			.end			;	return tot = n ^ pow
	mul			edi				;
	xor			rbx, rbx		;
	mov			rbx, rax		;
	shr			rbx, 32			;
	and			ebx, 0xffffffff ; check for overflow
	cmp			ebx, 0			;
	jne			.error			;
	dec			esi				;
	jmp			.loop			;

.end:
	pop			rbp				;
	ret							;

.error:
	mov			eax, 0			;
	pop			rbp				;
	ret							;
