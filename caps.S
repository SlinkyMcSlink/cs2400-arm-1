			;		ARM Programming Assignment #1: Capitalizer
			;
			;		Write a program that goes through the characters in chars,
			;		and Capitalizes every lower-case letter that it finds..
			;		Write the number of capitalizations the program performed
			;		In the caps "fill" memory provided.
			
			;		Your code here
			
chars		DCD		'a', 'B', '5', 'q', '0', 'O', '1', 's', 'b', 'i', 'G'
caps			FILL		4
			
			ADR		R0, chars      ; puts the address of the first character into R!
			MOV		R1, #0         ; Puts 0 into R1, this is the offset
			MOV		R2, #0         ; Puts 0 into R2, this if for the count of chars changed to caps
			MOV		R4 , #0        ; counts array
loop
			LDR		R3, [R0, R1]   ; Loads the data from the address held in R0 plus the offset into R3
			MOV		R1, #4         ; Changes offest to 4
			CMP		R3, #96        ; compares R3 to 96
			BLT		mid
pause
			BGT		capsIt         ; If great branch to Caps It
			ADD		R4, R4, #4     ; adds 4 to the array counter
			CMP		R4, #48        ; compare to array counter
			BLT		alreadyCaps    ; if less branch to add count
			B		exit           ; else branch to exit ending loop
			
capsIt
			SUB		R3, R3, #32    ; subtract 32, capsing the letter
			STR		R3, [R0]		; stores result to memory
			ADD		R0, R0, R1     ; adds offset to address held at R0 going to next element in array
			ADD		R4, R4, #4     ; adds 4 to array counter (array size)
			B		loop			; go back to loop
			
capCount
			ADD		R2, R2, #1     ; Updates counter
			B		pause		; Returns to pause
			
mid
			CMP		R3, #64
			BGT		capCount
			B		pause
alreadyCaps
			STR		R3, [R0]       ; stores current in memory
			ADD		R0, R0, R1     ; adds offset to addres in R0
			B		loop 		; returns to loop
			
			
exit
			STR		R2, [R0]
			END		; End program
