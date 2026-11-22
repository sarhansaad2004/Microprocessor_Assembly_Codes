
; input 4 numbers
; smallest number
; largest number

.model small
.stack 100h

.data
number db 13,10, "Input 4 numbers: $"
smallest_msg db 13,10, "Smallest Number is: $"
largest_msg db 13,10, "Largest Number is: $"

smallest db ?
largest db ?

.code

main proc
    mov ax, @data
    mov ds, ax

    ; input message print
    lea dx, number
    mov ah, 9h
    int 21h

    ; user input
    mov ah, 1h
    int 21h
    mov bl, al        ; 1st number

    mov ah, 1h
    int 21h
    mov bh, al        ; 2nd number

    mov ah, 1h
    int 21h
    mov cl, al        ; 3rd number

    mov ah, 1h
    int 21h
    mov ch, al        ; 4th number

    ; Comparison between 1st and 2nd
    mov al, bl
    cmp al, bh
    jle small1
    mov al, bh

    small1:

    ; Comparison between smallest and 3rd
    cmp al, cl
    jle small2
    mov al, cl

    small2:

    ; Comparison between smallest and 4th
    cmp al, ch
    jle small3
    mov al, ch

    small3:

    mov smallest, al

    ; Comparison between 1st and 2nd
    mov al, bl
    cmp al, bh
    jge large1
    mov al, bh

    large1:

    ; Comparison between largest and 3rd
    cmp al, cl
    jge large2
    mov al, cl

    large2:

    ; Comparison between largest and 4th
    cmp al, ch
    jge large3
    mov al, ch

    large3:

    mov largest, al

    ; smallest message print
    lea dx, smallest_msg
    mov ah, 9h
    int 21h

    ; print smallest value
    mov dl, smallest
    mov ah, 2h
    int 21h

    ; largest message print
    lea dx, largest_msg
    mov ah, 9h
    int 21h

    ; print largest value
    mov dl, largest
    mov ah, 2h
    int 21h
    jmp exit

    exit:
    mov ah, 4ch
    int 21h

    main endp
end main
