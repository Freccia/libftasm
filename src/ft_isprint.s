; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_isprint.s                                       :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: lfabbro <lfabbro@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/02/01 16:07:28 by lfabbro           #+#    #+#              ;
;    Updated: 2018/02/01 16:18:41 by lfabbro          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

global		_ft_isprint

section		.text

_ft_isprint:
	mov		rax, 0

.isprint:
	cmp		rdi, 32
	jl		.end
	cmp		rdi, 126
	jg		.end

.true:
	mov		rax, 1

.end:
	ret
