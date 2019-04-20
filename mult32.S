		
		
numbers	DCD		0xA0BCFF0D, 0xFFF0ADEA
result	FILL		8
carry	FILL		4
		
		MOV		R0, #0
		MOV		R1, #0
		MOV		R3, #0
		ADR		R2, numbers
		LDR		R2, [R2]
		ADR		R4, numbers
		ADD		R4, R4, #4
		LDR		R4, [R4]
loop
		TST		R4, #1
		ADDSNE	R0, R0, R2
		TST		R4, #1
		ADCNE	R1, R1, R3
		LSLS		R2, R2, #1
		LSL		R3, R3, #1
		ADC		R3, R3, #0
		LSRS		R4, R4, #1
		BNE		loop
		B		endit
		
endit
		ADR		R3, result
		ADR		R3, carry
		STR		R0, [R3]
		STR		R1, [R3]
