; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_memcpy.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: lfabbro <lfabbro@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/02/02 12:35:27 by lfabbro           #+#    #+#              ;
;    Updated: 2018/02/02 12:46:05 by lfabbro          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

global		_ft_memcpy
section		.text

_ft_memcpy:
	cld						; clear direction flag, we go down-up
	mov			rax, rdi	; save to return
	mov			rcx, rdx	; load number of iterations
	rep movsb				; iterate copy rsi[rcx] -> rdi[rcx]

.end:
	ret
