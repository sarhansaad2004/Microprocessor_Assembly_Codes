
;hw1 - and5, or7, xor2, not0

; logical task (and or xor not)
; 0101b
; 0111b
;and : 0101b = '5'
;or: 0111b = 7 = '7'
;xor: 0010b = 2 = '2'
;not: 11111111b = 0 = '0'
;AND Result = '5'
;OR Result = '7'
;XOR Result = '2'
;NOT Result = '0'

.model small
.stack 100h

.data

and_msg db "AND Result: $" 
or_msg db 13,10,"OR Result: $"
xor_msg db 13,10, "XOR Result: $"
not_msg db 13,10, "NOT Result: $"

.code

main proc
    mov ax, @data
    mov ds, ax

    ; and msg print
    lea dx, and_msg
    mov ah, 9h
    int 21h

    ; and operation
    mov bl, 0101b ; bl= 0101b
    and bl, 0111b ; bl= 0101b and 0111b = 5
    mov dl, bl     ; dl= 5
    add dl, 30h    ; dl= '5' ascii convert
    mov ah, 2h     ; char print command
    int 21h

    ; or msg print
    lea dx, or_msg
    mov ah, 9h
    int 21h

    ; or operation
    mov bl, 0101b ; bl= 0101b
    or bl, 0111b  ; bl= 0101b or 0111b = 7
    mov dl, bl    ; dl= 7
    add dl, 30h   ; dl= '7' ascii convert
    mov ah, 2h    ; char print command
    int 21h

    ; xor msg print
    lea dx, xor_msg
    mov ah, 9h
    int 21h

    ; xor operation
    mov bl, 0101b ; bl= 0101b
    xor bl, 0111b ; bl= 0101b xor 0111b = 2
    mov dl, bl    ; dl= 2
    add dl, 30h   ; dl= '2' ascii convert
    mov ah, 2h    ; char print command
    int 21h

    ; not msg print
    lea dx, not_msg
    mov ah, 9h
    int 21h

    ; not operation
    mov bl, 11111111b ; bl= 11111111b
    not bl            ; bl= 00000000b
    mov dl, bl        ; dl= 0
    add dl, 30h       ; dl= '0' ascii convert
    mov ah, 2h        ; char print command
    int 21h

exit:
    mov ah, 4ch
    int 21h

    main endp
end main
