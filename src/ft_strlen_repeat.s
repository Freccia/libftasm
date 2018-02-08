; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strlen.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: lfabbro <lfabbro@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/02/02 11:22:17 by lfabbro           #+#    #+#              ;
;    Updated: 2018/02/08 01:49:02 by lfabbro          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

global		_ft_strlen
section		.text

_ft_strlen:
	xor		rax, rax
	xor		rcx, rcx
	cmp		rdi, 0
	je		.end
	not		rcx
	repne	scasb
	not		rcx
	dec		rcx
	mov		rax, rcx

.end:
	ret
