	.file	"hw-print.c"
	.code16gcc
	.text
	.globl	print_char
	.type	print_char, @function
print_char:
.LFB0:
	.cfi_startproc
#APP
# 3 "hw-print.c" 1
	push %ax
# 0 "" 2
# 4 "hw-print.c" 1
	push %bx
# 0 "" 2
# 6 "hw-print.c" 1
	movw %cx, %ax
# 0 "" 2
# 7 "hw-print.c" 1
	movb $0xe, %ah
# 0 "" 2
# 8 "hw-print.c" 1
	int $0x10
# 0 "" 2
# 10 "hw-print.c" 1
	pop %bx
# 0 "" 2
# 11 "hw-print.c" 1
	pop %ax
# 0 "" 2
# 13 "hw-print.c" 1
	ret
# 0 "" 2
#NO_APP
	nop
	ud2
	.cfi_endproc
.LFE0:
	.size	print_char, .-print_char
	.globl	printhw
	.type	printhw, @function
printhw:
.LFB1:
	.cfi_startproc
	movl	%ecx, %edi
	movl	$0, %esi
	movl	%esi, %eax
	addl	%edi, %eax
	movzbl	(%eax), %ebx
	jmp	.L3
.L4:
	movsbl	%bl, %eax
	movl	%eax, %ecx
	call	print_char
	addl	$1, %esi
	movl	%esi, %eax
	addl	%edi, %eax
	movzbl	(%eax), %ebx
.L3:
	testb	%bl, %bl
	jne	.L4
	movsbl	%bl, %eax
	ud2
	.cfi_endproc
.LFE1:
	.size	printhw, .-printhw
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
