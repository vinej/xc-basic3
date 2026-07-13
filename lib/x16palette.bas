' =====================================================================
' x16palette.bas -- XBasic wrappers for the x16_library palette module.
' Auto-generated from video/palette.asm header comments. INCLUDE to use it;
' the library code links automatically (X16_USE_PALETTE).
' =====================================================================
asm
X16_USE_PALETTE = 1
end asm

SUB x16_pal_load (source AS WORD, first AS BYTE, entry AS BYTE) SHARED STATIC
    asm
    lda {source}
    sta X16_P0
    lda {source}+1
    sta X16_P1
    ldx {entry}
    lda {first}
    jsr pal_load
    end asm
END SUB

SUB x16_pal_set (idx AS BYTE, greenblue AS BYTE, red AS BYTE) SHARED STATIC
    asm
    ldx {idx}
    lda {greenblue}
    ldy {red}
    jsr pal_set
    end asm
END SUB
