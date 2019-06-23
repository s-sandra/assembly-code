// add_more.s
	.text
	.align 2
	.global add_more_asm

add_more_asm:
	// r0 is operator, r1 is operand1, r2 is operand2
	// + is 43 ASCII, - is 45, & is 38, | is 124, ^ is 94
	
	cmp r0, #43 		// the "+" char
	beq plus			// if it's equal, then go to plus block. 
						// if it's not equal, then it might be a minus. Go to minus block.
	
	minus:
		cmp r0, #45 	// the "-" char
		bne and			// if it's not equal, then it might be and. Go to and block.
		sub r0, r1, r2	// if it is equal, then subtract and go to done.
		b done
		
	plus:
		add r0, r1, r2 	// adds r1 and r2 and places result in r0
		b done 			// goes to done block.
		
	and:
		cmp r0, #38		// the "&" char
		bne or			// if it's not equal, maybe it's an or. Go to or block.
		and r0, r1, r2
		b done
		
	or:
		cmp r0, #124 	// the "|" char
		bne xor			// if it's not equal, maybe it's an xor. Go to xor block
		orr r0, r1, r2
		b done
	
	xor:
		cmp r0, #94		// the "^" char
		bne default		// if the operator is invalid, returns 305419896.
		eor r0, r1, r2
		b done
		
	done:
		mov pc, lr      // returns by changing pc to lr.
		
	retval:
		.word 0x12345678 // 305419896 in hex, as a word.
		
	default:
		ldr r0, retval
		b done
