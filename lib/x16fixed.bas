' =====================================================================
' x16fixed.bas -- XBasic wrappers for the x16_library 16-bit / 8.8 multiply module.
' Auto-generated from util/fixed.asm header comments. INCLUDE to use it;
' the library code links automatically (X16_USE_FIXED).
' =====================================================================
asm
X16_USE_FIXED = 1
end asm

SUB x16_umul16 (a AS WORD, b AS WORD) SHARED STATIC
    asm
    lda {a}
    sta X16_P0
    lda {a}+1
    sta X16_P1
    lda {b}
    sta X16_P2
    lda {b}+1
    sta X16_P3
    jsr umul16
    end asm
END SUB

FUNCTION x16_mul88 AS WORD (a AS WORD, b AS WORD) SHARED STATIC
    asm
    lda {a}
    sta X16_P0
    lda {a}+1
    sta X16_P1
    lda {b}
    sta X16_P2
    lda {b}+1
    sta X16_P3
    jsr mul88
    lda X16_P0
    sta {x16_mul88}
    lda X16_P1
    sta {x16_mul88}+1
    end asm
END FUNCTION
