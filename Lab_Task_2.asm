
;multiplicand = 4
;multiplier = 2 
;product=8

;dividend = 9 
;divisor=5 | 0
;quotient =1
;reminder =4

.model small
.stack 100h

.data

multiplicand db "Enter Multiplicand: $"
multiplier db 13,10, "Enter Multiplier: $"
product_msg db 13,10, "Your Product: $"

dividend db 13,10, "Enter Dividend: $"
divisor db 13,10, "Enter Divisor: $"
quotient db 13,10, "Your Quotient: $"
remainder db 13,10, "Your Reminder: $"
error db 13,10, "Undefined!!! $"

.code

main proc

    mov ax, @data
    mov ds, ax

    ;ascii loves pattern
    ;case insensitive, indentation =! not mind
    ;acsii and pattern = mind
    ;str print, lea= load effective address

    lea dx, multiplicand ;str load
    mov ah,9h ;string print
    int 21h ;interrupt

    ; multiplicand user input
    mov ah,1 ; user input
    int 21h ; interrupt
    sub al, 30h ;decimal convert
    mov bl, al ;bl= multiplicand

    lea dx, multiplier ;str load
    mov ah,9h ;string print
    int 21h ;interrupt

    ; multiplier user input
    mov ah,1 ; user input
    int 21h ; interrupt
    sub al, 30h ;decimal convert
    mov bh, al ;bh= multiplier

    ;multiplication
    mov al, bl ;multiplicand
    mul bh ;multiplier
    mov cl, al ;product store

    ;product er message print
    lea dx, product_msg ;str load
    mov ah,9h ;string print
    int 21h ;interrupt

    mov dl, cl ;product
    add dl, '0' ;ascii convert
    mov ah, 2 ;character print
    int 21h

    lea dx, dividend ;str load
    mov ah,9h ;string print
    int 21h ;interrupt

    ; dividend user input
    mov ah,1 ; user input
    int 21h ; interrupt
    sub al, 30h ;decimal convert
    mov bl, al ;bl= dividend

    lea dx, divisor ;str load
    mov ah,9h ;string print
    int 21h ;interrupt

    ; divisor user input
    mov ah,1 ; user input
    int 21h ; interrupt
    sub al, 30h ;decimal convert
    mov bh, al ;bh= divisor

    ;corner case
    cmp bh,0
    je undefine ; jump if equal

    ;division
    mov al, bl ;dividend
    mov ah, 0
    div bh ;divisor

    mov cl, al ;quotient store
    mov ch, ah ;remainder store

    ;quotient er message print
    lea dx, quotient ;str load
    mov ah,9h ;string print
    int 21h ;interrupt

    mov dl, cl ;al = quotient
    add dl, '0' ;ascii convert
    mov ah, 2 ;character print
    int 21h

    ; Print Remainder
    lea dx, remainder ;str load
    mov ah, 9h ;string print
    int 21h

    mov dl, ch
    add dl, '0'
    mov ah, 2
    int 21h

    jmp exit

    undefine: ;segment
    lea dx, error ;str load
    mov ah,9h ;string print
    int 21h

exit:
    mov ah, 4ch ; ah = 4c (h for hex suffix)
    int 21h

main endp
end main
