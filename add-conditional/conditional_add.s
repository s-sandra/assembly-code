// add_more.s
	.text
	.align 2
	.global add_more_asm

add_more_asm:
	// r0 is operator, r1 is operand1, r2 is operand2, returns in r3.
	// + is 43 ASCII, - is 45, & is 38, | is 124, ^ is 94
	
	retval:
		.word 0x12345678 // 305419896 in hex, as a word.
		
	ldr r3, retval 		// if the operator is invalid, returns 305419896.
	
	cmp r0, #43 		// the "+" char
	addeq r3, r1, r2	// if it's equal, then add.		
	cmp r0, #45 		// the "-" char
	subeq r3, r1, r2	// if it is equal, then subtract.
	cmp r0, #38			// the "&" char
	andeq r3, r1, r2	// if it is equal, then and.
	cmp r0, #124 		// the "|" char
	orreq r3, r1, r2	// it it is equal, then or.
	cmp r0, #94		    // the "^" char
	eoreq r3, r1, r2	// if it is equal, then xor.
	mov r0, r3
	mov pc, lr      	// returns by changing pc to lr.
