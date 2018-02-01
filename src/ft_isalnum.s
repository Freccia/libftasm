; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_isalnum.s                                       :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: lfabbro <lfabbro@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/02/01 15:09:52 by lfabbro           #+#    #+#              ;
;    Updated: 2018/02/01 16:02:41 by lfabbro          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

extern		_ft_isalpha
extern		_ft_isdigit
global		_ft_isalnum

section		.text

_ft_isalnum:
	xor		rax, rax
	xor		rbx, rbx

.isalnum:
	call	_ft_isdigit
	mov		rbx, rax
	push	rbx
	call	_ft_isalpha
	pop		rbx
	or		rax, rbx

.end:
	ret
