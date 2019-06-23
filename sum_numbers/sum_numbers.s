// sum_numbers.s
	.text
	.align 2
	.global sum_numbers

sum_numbers:
	mov r1, r0	// stores the number parameter
	mov r0, #0	// stores the sum
	loop:
		add r0, r1, r0	// adds current number to current sum
		subs r1, r1, #1 // subtracts 1 from current number
		bne loop		// loops until r1 is 0.
	done:
		mov pc, lr
