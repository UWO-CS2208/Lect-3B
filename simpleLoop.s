		EOL = 10

		.global main

main:
	save 	%sp, -96, %sp
	clr 	%l0			! initialize to zero

loop:
	add	%l0, 1, %l0		! increment by 1

	mov 	%l0, %o0		!	(filled delay slot)	
	call	writeInt		! print counter to console
	nop

	mov	EOL, %o0		!	(filled delay slot)
	call	writeChar		! print newline
	nop

	subcc	%l0, 10, %g0		! compare to 10
	ble	loop
	nop

	ret
	restore
