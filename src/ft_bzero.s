; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_bzero.s                                         :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: lfabbro <lfabbro@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/01/31 17:36:15 by lfabbro           #+#    #+#              ;
;    Updated: 2018/02/01 15:02:40 by lfabbro          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

; rsi = n   && rdi == ptr

;void	ft_bzero(void *ptr, int n);

global _ft_bzero
section .text

_ft_bzero:

.loop:
	cmp		rsi, 0
	jle		.end
	mov		byte [rdi + rsi - 1], 0
	dec		rsi
	jmp		.loop

.end:
	ret
