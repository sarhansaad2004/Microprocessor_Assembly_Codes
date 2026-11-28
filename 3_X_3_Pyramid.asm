
;hw2 - increasing 12 pattern
;12
;12 12
;12 12 12
;CX = 3

.model small
.stack 100h

.data
.code

main proc
    mov ax, @data
    mov ds, ax

    mov bl, 1       ; Global Condition

    outer_loop:     ; Creates new line
    mov cx, bx

        inner_loop: ; Per Character Print
        mov dl, '1' ; Char load
        mov ah, 2   ; Char print
        int 21h

        mov dl, '2' ; Char load
        mov ah, 2   ; Char print
        int 21h

        mov dl, ' ' ; Space print
        mov ah, 2
        int 21h

        loop inner_loop ; cx != 0 loop continue

        mov ah, 2
        mov dl, 13   ; 13 = Carriage Return
        int 21h
        mov dl, 10   ; 10 = Line Feed
        int 21h

        inc bl
        cmp bl, 4
        jne outer_loop

    exit:
    mov ah, 4ch
    int 21h

    main endp
end main
