; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strcat.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: lfabbro <lfabbro@student.42.fr>            +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/01/31 19:00:46 by lfabbro           #+#    #+#              ;
;    Updated: 2018/02/01 15:02:36 by lfabbro          ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

global	_ft_strcat
section .text

_ft_strcat:
	cld
	mov		rax, rdi

.loop_dst:
	cmp		byte [rdi], 0
	je		.loop_copy
	inc		rdi
	jmp		.loop_dst

.loop_copy:
	cmp		byte [rsi], 0
	je		.end
	movsb
	jmp		.loop_copy

.end:
	mov		byte [rdi], 0
	ret

;	mov		rdx, 0
;	mov		rcx, 0
;
;.loop_dst:
;	cmp		dword [rdi + rcx], 0
;	je		.loop_src
;	inc		rcx
;	jmp		.loop_dst
;
;.loop_src:
;	cmp		dword [rsi + rdx], 0
;	je		.end
;	mov		eax, dword [rsi + rdx]
;	mov		dword [rdi + rcx], eax
;	inc		rdx
;	inc		rcx
;	jmp		.loop_src
;
;.end:
;	mov		byte [rdi + rcx], 0
;	mov		rax, rdi
;	ret
