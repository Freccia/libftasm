; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strdup.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: lfabbro <lfabbro@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/02/02 12:52:43 by lfabbro           #+#    #+#              ;
;    Updated: 2018/02/02 15:58:05 by lfabbro          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

extern		_malloc
extern		_ft_strlen
global		_ft_strdup
section		.text

_ft_strdup:
	cmp			rdi, 0		; str == NULL
	je			.error		; return -> NULL

	push		rdi			; save str in the stack
	call		_ft_strlen	;
	cmp			rax, 0		; len <= 0
	jng			.error		; return -> NULL

	inc			rax			; len + 1 (ending zero)
	mov			rdi, rax	; load argument lenght for malloc
	push		rax			; save len in the stack
	call		_malloc		;
	cmp			rax, 0		; ptr == NULL
	je			.end		; return -> NULL

	mov			rdi, rax	; load argument for movsb
	pop			rcx			; retreive len from the stack
	pop			rsi			; retreive str from the stack
	cld						; reset direction flag
	rep movsb				; iterate copy rsi[rcx] -> rdi[rcx]
	jmp			.end		;

.error:
	mov			rax, 0		; return NULL

.end:
	ret
