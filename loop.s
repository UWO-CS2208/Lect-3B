		EOL = 10

		.global main
main:
	save 	%sp, -96, %sp
	clr 	%l0			! initialize x to zero
	
loop:					! the do-while loop:
	sub 	%l0, 1, %o0		! (x-1)
	sub 	%l0, 7, %o1		! (x-7)
	call	.mul			! multiply them
	nop

	sub	%l0, 11, %o1		! divide by (x-11)
	call	.div
	nop

	call 	writeInt		! print y (already in %o0)
	nop

	call 	writeChar		! print a newline character
	mov 	EOL, %o0		!  (filled delay slot)

	add	%l0, 1, %l0		! increment x
	subcc	%l0, 10, %g0		! compare x to 10
	ble	loop			! if x <= 10 loop back
	nop

	ret				! otherwise done
	restore	
