; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_toupper.s                                       :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: lfabbro <lfabbro@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/02/01 16:15:12 by lfabbro           #+#    #+#              ;
;    Updated: 2018/02/01 17:00:20 by lfabbro          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

global		_ft_toupper
section		.text

_ft_toupper:
	mov		rax, rdi

.islower:
	cmp		rax, 97
	jl		.end
	cmp		rax, 122
	jg		.end

.true:
	sub		rax, 32

.end:
	ret

