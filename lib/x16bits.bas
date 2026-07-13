' =====================================================================
' x16bits.bas -- XBasic wrappers for the x16_library bit / nibble helpers module.
' Auto-generated from util/bits.asm header comments. INCLUDE to use it;
' the library code links automatically (X16_USE_BITS).
' =====================================================================
asm
X16_USE_BITS = 1
end asm

FUNCTION x16_catnib AS BYTE (high AS BYTE, low AS BYTE) SHARED STATIC
    asm
    ldx {low}
    lda {high}
    jsr catnib
    sta {x16_catnib}
    end asm
END FUNCTION

SUB x16_bit_put (address AS WORD, mask AS BYTE) SHARED STATIC
    asm
    lda {address}
    sta X16_P0
    lda {address}+1
    sta X16_P1
    lda {mask}
    jsr bit_put
    end asm
END SUB

SUB x16_bit_test (address AS WORD, mask AS BYTE) SHARED STATIC
    asm
    lda {address}
    sta X16_P0
    lda {address}+1
    sta X16_P1
    lda {mask}
    jsr bit_test
    end asm
END SUB
