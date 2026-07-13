' =====================================================================
' x16screen.bas -- XBasic wrappers for the x16_library text screen / KERNAL console module.
' Auto-generated from video/screen.asm header comments. INCLUDE to use it;
' the library code links automatically (X16_USE_SCREEN).
' =====================================================================
asm
X16_USE_SCREEN = 1
end asm

SUB x16_screen_reset () SHARED STATIC
    asm
    jsr screen_reset
    end asm
END SUB

SUB x16_screen_cls () SHARED STATIC
    asm
    jsr screen_cls
    end asm
END SUB

SUB x16_screen_chrout (character AS BYTE) SHARED STATIC
    asm
    lda {character}
    jsr screen_chrout
    end asm
END SUB

SUB x16_screen_locate (row AS BYTE, column AS BYTE) SHARED STATIC
    asm
    ldy {column}
    ldx {row}
    jsr screen_locate
    end asm
END SUB

SUB x16_screen_puts (address AS BYTE, address2 AS BYTE) SHARED STATIC
    asm
    ldx {address2}
    lda {address}
    jsr screen_puts
    end asm
END SUB
