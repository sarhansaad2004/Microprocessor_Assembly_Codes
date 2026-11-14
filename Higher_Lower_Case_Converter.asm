
;hw2 - enter higher: Z Lower =z , sathe automatic ashbe Enter lower = a, higher = A (duita aksathe merge koraa)

; Enter Higher Case : Z
; This is your Lower Case : z
; Enter Lower Case : a
; This is your Higher Case : A

.model small
.stack 100h

.data

higher db 13,10,"Enter Higher Case: $"
lower db 13,10,"This is your lower case: $"
lower_input db 13,10,"Enter Lower Case: $"
higher_output db 13,10,"This is your Higher case: $"

.code

main proc
    mov ax, @data
    mov ds , ax

    ; higher string print
    lea dx ,higher
    mov ah, 9h
    int 21h

    ; higher user input
    mov ah, 1h ; user input
    int 21h    ; interrupt
    ; al
    mov bl, al
    mov ah, 2h ; input ascii print

    ; lower message print
    lea dx ,lower
    mov ah, 9h
    int 21h

    ; lower case convert
    add bl, 32 ; bl= z converted
    mov dl, bl ; dl= z
    mov ah, 2h  ; output ascii print , char output
    int 21h    ; interrupt

    ; lower string print
    lea dx ,lower_input
    mov ah, 9h
    int 21h

    ; lower user input
    mov ah, 1h ; user input
    int 21h    ; interrupt
    ; al
    mov bl, al
    mov ah, 2h ; input ascii print

    ; higher message print
    lea dx ,higher_output
    mov ah, 9h
    int 21h

    ; higher case convert
    sub bl, 32 ; bl= A converted
    mov dl, bl ; dl= A
    mov ah, 2h  ; output ascii print , char output
    int 21h    ; interrupt

    jmp exit

exit:
    mov ah, 4ch
    int 21h

    main endp
end main
