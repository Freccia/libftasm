; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_isascii.s                                       :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: lfabbro <lfabbro@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/02/01 16:03:00 by lfabbro           #+#    #+#              ;
;    Updated: 2018/02/01 16:07:51 by lfabbro          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

global		_ft_isascii

section		.text

_ft_isascii:
	mov		rax, 0

.isascii:
	cmp		rdi, 0
	jl		.end
	cmp		rdi, 127
	jg		.end

.true:
	mov		rax, 1

.end:
	ret
