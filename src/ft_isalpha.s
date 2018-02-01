; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_isalpha.s                                       :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: lfabbro <lfabbro@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/02/01 12:18:12 by lfabbro           #+#    #+#              ;
;    Updated: 2018/02/01 15:51:53 by lfabbro          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

global	_ft_isalpha

section	.text

_ft_isalpha:
	mov		rax, 0

.isupper:
	cmp		rdi, 65
	jl		.end
	cmp		rdi, 90
	jle		.true

.islower:
	cmp		rdi, 97
	jl		.end
	cmp		rdi, 122
	jg		.end

.true:
	mov		rax, 1

.end:
	ret
