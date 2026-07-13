' =====================================================================
' x16bank.bas -- XBasic wrappers for the x16_library banked RAM access module.
' Auto-generated from storage/bank.asm header comments. INCLUDE to use it;
' the library code links automatically (X16_USE_BANK).
' =====================================================================
asm
X16_USE_BANK = 1
end asm

SUB x16_mem_to_bank (source AS WORD, destination AS BYTE, destination2 AS WORD, byte_ AS WORD, source2 AS BYTE, source3 AS WORD, destination3 AS WORD, byte_2 AS WORD) SHARED STATIC
    asm
    lda {source}
    sta X16_P0
    lda {source}+1
    sta X16_P1
    lda {destination}
    sta X16_P2
    lda {destination2}
    sta X16_P3
    lda {destination2}+1
    sta X16_P4
    lda {byte_}
    sta X16_P5
    lda {byte_}+1
    sta X16_P6
    lda {source2}
    sta X16_P0
    lda {source3}
    sta X16_P1
    lda {source3}+1
    sta X16_P2
    lda {destination3}
    sta X16_P3
    lda {destination3}+1
    sta X16_P4
    lda {byte_2}
    sta X16_P5
    lda {byte_2}+1
    sta X16_P6
    jsr mem_to_bank
    end asm
END SUB

SUB x16_bank_copy_far (source AS BYTE, source2 AS WORD, destination AS BYTE, destination2 AS WORD, byte_ AS WORD) SHARED STATIC
    asm
    lda {source}
    sta X16_P0
    lda {source2}
    sta X16_P1
    lda {source2}+1
    sta X16_P2
    lda {destination}
    sta X16_P3
    lda {destination2}
    sta X16_P4
    lda {destination2}+1
    sta X16_P5
    lda {byte_}
    sta X16_P6
    lda {byte_}+1
    sta X16_P7
    jsr bank_copy_far
    end asm
END SUB
