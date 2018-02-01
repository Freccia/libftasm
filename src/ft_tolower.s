; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_tolower.s                                       :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: lfabbro <lfabbro@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/02/01 16:15:12 by lfabbro           #+#    #+#              ;
;    Updated: 2018/02/01 17:00:24 by lfabbro          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

global		_ft_tolower
section		.text

_ft_tolower:
	mov		rax, rdi

.islower:
	cmp		rax, 65
	jl		.end
	cmp		rax, 90
	jg		.end

.true:
	add		rax, 32

.end:
	ret

