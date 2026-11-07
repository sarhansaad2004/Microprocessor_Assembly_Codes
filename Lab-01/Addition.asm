
.MODEL SMALL
.STACK 100H

.DATA

.CODE

MAIN PROC

    ; Initialize Data Segment
    MOV AX, @DATA
    MOV DS, AX

    ; Initialize values
    MOV AX, 0
    MOV DX, 9

    ; Subtraction
    SUB DX, AX

    ; Convert result to ASCII
    ADD DL, '0'

    ; Display result
    MOV AH, 2H
    INT 21H

    ; Exit program
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
