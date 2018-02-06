	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 12
	.intel_syntax noprefix
	.globl	_pointer
	.p2align	4, 0x90
_pointer:                               ## @pointer
	.cfi_startproc
## BB#0:
	push	rbp
Lcfi0:
	.cfi_def_cfa_offset 16
Lcfi1:
	.cfi_offset rbp, -16
	mov	rbp, rsp
Lcfi2:
	.cfi_def_cfa_register rbp
	mov	qword ptr [rbp - 8], rdi
	mov	rdi, qword ptr [rbp - 8]
	mov	al, byte ptr [rdi]
	mov	byte ptr [rbp - 9], al
	movsx	eax, byte ptr [rbp - 9]
	pop	rbp
	ret
	.cfi_endproc


.subsections_via_symbols
