// add_more.s
	.text
	.align 2
	.global increment_asm

increment_asm:
	// r0 is the address of the integer.
	ldr r2, [r0] // load the contents of r0 into r2
	add r2, r2, #1
	str r2, [r0] // stores r2 incremented into address at r0
	mov pc, lr
