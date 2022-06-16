ORG 0H
MOV P1, #0FFH
MOV P2, #00H

BACK: 
	MOV P2, #00000011B
    JB P1.0,LEFT_ON
	JB P1.1,LEFT_OFF_RIGHT_ON
	MOV P2,#0
	SJMP BACK
	
	LEFT_ON:
		JB P1.1,LEFT_ON_RIGHT_ON
		CLR P2.0
		SETB P2.1
		ACALL DELAY
		SJMP BACK
		
	LEFT_OFF_RIGHT_ON: 
		SETB P2.0
		CLR P2.1
		ACALL DELAY
		SJMP BACK
		
	LEFT_ON_RIGHT_ON:
		SETB P2.0
		SETB P2.1
		ACALL DELAY
		SJMP BACK
		
	DELAY:
		MOV R0,#255
		HERE:DJNZ R0, HERE
		RET
		
END
		
	  