%define a               QWORD [rbp+8]
%define b               QWORD [rbp+16]
%define result          QWORD [rbp+24]
%define ctrlWord        WORD  [rbp-2]
%define tmp             DWORD [rbp-6]

segment .text
    global _power

_power:
    push rbp
    mov rbp, rsp
    sub rsp, 6
    push rbx

    fstcw ctrlWord
    or ctrlWord, 110000000000b
    fldcw ctrlWord

    fld b
    fld a
    fyl2x

    fist tmp

    fild tmp
    fsub
    f2xm1
    fld1
    fadd
    fild tmp
    fxch
    fscale

    mov rbx, result
    fst QWORD [rbx]

    pop rbx
    mov rsp, rbp
    pop rbp
    ret
