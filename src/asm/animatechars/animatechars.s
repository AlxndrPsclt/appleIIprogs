; Chapter 5 Exercise 3
; Console Output - ASCII table (forward order)

.segment "CODE"

Home = $FC58   ; Replace EQU with simple assignments
COUT = $FDED
CTR  = $06     ; This might be better as a zero-page address

; Start the program
Start:
    jsr Home     ; clear screen
    lda #$00     ; load accumulator with zero
    sta CTR      ; store the accumulator to address CTR

Loop:
    lda CTR      ; load memory address CTR to accumulator
    jsr COUT     ; console output contents of accumulator
    inc CTR      ; increment CTR
    beq End      ; if zero, jump to end
    jmp Loop     ; otherwise loop

End:
    rts          ; Return from subroutine
