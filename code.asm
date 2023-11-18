ORG 0x00 ; Start of program
GOTO START ; Jump to start of program
ORG 0x04 ; Interrupt vector location

; Define variables
LOOP_COUNTER EQU 0x20
COUNT EQU 0x21

START:
; Initialize ports and registers
CLRF STATUS ; Clear STATUS register
BSF STATUS, RP0 ; Switch to Bank1
CLRF TRISB ; Set PORTB as output
BCF STATUS, RP0 ; Switch back to Bank0

MOVLW 0x0A ; Load W with 10 (loop count)
MOVWF LOOP_COUNTER ; Move W to loop counter

MAIN_LOOP:
CALL COUNTDOWN ; Call countdown routine
DECFSZ LOOP_COUNTER, F ; Decrement loop counter, skip next if 0
GOTO MAIN_LOOP ; Repeat main loop

COUNTDOWN:
MOVLW D'30' ; Load W with 30
MOVWF COUNT ; Move W to count

COUNT_LOOP:
; Your delay routine goes here
CALL DELAY ; Call delay routine
DECFSZ COUNT, F ; Decrement count, skip next if 0
GOTO COUNT_LOOP ; Repeat count loop
RETURN ; Return from countdown

DELAY:
; Implement a delay routine here
NOP ; No operation 
RETURN ; Return from delay

END ; End of program
