// find_largest.s
	.text
	.align 2
	.global find_largest_asm

find_largest_asm:
	// r0 contains address to array of integers
	// r1 contains length of array of integers
	ldr r2, [r0]			// r2 stores largest number. Loads contents of first element into r3.
	loop:
		ldr r3, [r0], #4	// Loads contents of array element into r3, and then increments.
		cmp r2, r3			// compare largest number to current element.
		blt setLargest		// if largest number is less than current element, change largest.
		b decrement
	setLargest:
		mov r2, r3
		b decrement
	decrement:
		subs r1, r1, #1		// r1 stores array len. Subtracts 1 from index.
							// subs is subtract immediate. r1 sets status flags relative to 0.
		bgt loop			// loops only when r1 is greater than 0.
	done:
		mov r0, r2
		mov pc, lr
