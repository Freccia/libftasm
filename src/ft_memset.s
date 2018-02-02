; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_memset.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: lfabbro <lfabbro@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/02/02 11:44:06 by lfabbro           #+#    #+#              ;
;    Updated: 2018/02/02 12:34:12 by lfabbro          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

global		_ft_memset
section		.text

_ft_memset:
	cld						; clear direction flag, we go down-up
	mov			rax, rsi	; load value to set
	mov			rsi, rdi	; save rdi to later return
	mov			rcx, rdx	; load number of iterations
	rep stosb				; iterate copy rsi -> rdi[rcx]
	mov			rax, rsi	; return value is initial rdi

.end:
	ret
