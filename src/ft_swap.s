; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_swap.s                                          :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: lfabbro <lfabbro@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/02/05 19:01:20 by lfabbro           #+#    #+#              ;
;    Updated: 2018/02/05 19:14:25 by lfabbro          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

global		_ft_swap
section		.text

_ft_swap:
	push	rbp				;
	mov		rbp, rsp		;
	xor		ebx, ebx		;
	xor		edx, edx		;
	mov		ebx, [rdi]		;
	mov		edx, [rsi]		;
	mov		[rdi], edx		;
	mov		[rsi], ebx		;

.end:
	pop		rbp				;
	ret						;
