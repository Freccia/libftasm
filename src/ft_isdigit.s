; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_isdigit.s                                       :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: lfabbro <lfabbro@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/02/01 15:01:26 by lfabbro           #+#    #+#              ;
;    Updated: 2018/02/01 15:51:49 by lfabbro          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

global	_ft_isdigit

section	.text

_ft_isdigit:
	mov		rax, 0

.isdigit:
	cmp		rdi, 48
	jl		.end
	cmp		rdi, 57
	jg		.end

.true:
	mov		rax, 1

.end:
	ret
