	.file	"hw-rt0.c"
	.code16gcc
	.text
	.globl	_start
	.type	_start, @function
_start:
.LFB0:
	.cfi_startproc
#APP
# 3 "hw-rt0.c" 1
	mov  $__END_STACK__ , %sp
# 0 "" 2
# 4 "hw-rt0.c" 1
	call main
# 0 "" 2
# 5 "hw-rt0.c" 1
	halt:
# 0 "" 2
# 6 "hw-rt0.c" 1
	hlt
# 0 "" 2
# 7 "hw-rt0.c" 1
	jmp halt
# 0 "" 2
#NO_APP
	nop
	ud2
	.cfi_endproc
.LFE0:
	.size	_start, .-_start
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
