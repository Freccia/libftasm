; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strlen.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: lfabbro <lfabbro@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/02/02 11:22:17 by lfabbro           #+#    #+#              ;
;    Updated: 2018/02/02 11:36:41 by lfabbro          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

global		_ft_strlen
section		.text

_ft_strlen:
	xor		rax, rax

.slen:
	cmp		byte [rdi + rax], 0
	je		.end
	inc		rax
	jmp		.slen

.end:
	ret
