; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_memmove.s                                       :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: lfabbro <lfabbro@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/02/03 14:14:30 by lfabbro           #+#    #+#              ;
;    Updated: 2018/02/03 14:20:49 by lfabbro          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

global		_ft_memmove
section		.text

_ft_memmove:
	push		rbp			; save stack base pointer
	mov			rbp, rsp	;
	mov			rax, rdi	; save to return
	mov			rcx, rdx	; load iteration number
	cmp			rdi, rsi	; if (rdi > rsi)
	jg			.down_up	;

.up_down:
	cld						; clear direction flag
	rep			movsb		; copy
	jmp			.end		;

.down_up:
	std						; set direction flag
	rep			movsb		; copy

.end:
	pop			rbp			;
	ret						;
