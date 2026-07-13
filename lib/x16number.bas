' =====================================================================
' x16number.bas -- XBasic wrappers for the x16_library number <-> ASCII module.
' Auto-generated from util/number.asm header comments. INCLUDE to use it;
' the library code links automatically (X16_USE_NUMBER).
' =====================================================================
asm
X16_USE_NUMBER = 1
end asm

FUNCTION x16_u16_to_dec AS WORD (value AS WORD) SHARED STATIC
    asm
    lda {value}
    sta X16_P0
    lda {value}+1
    sta X16_P1
    jsr u16_to_dec
    sta {x16_u16_to_dec}
    stx {x16_u16_to_dec}+1
    end asm
END FUNCTION

FUNCTION x16_u16_to_hex AS WORD (value AS WORD) SHARED STATIC
    asm
    lda {value}
    sta X16_P0
    lda {value}+1
    sta X16_P1
    jsr u16_to_hex
    sta {x16_u16_to_hex}
    stx {x16_u16_to_hex}+1
    end asm
END FUNCTION

FUNCTION x16_dec_to_u16 AS BYTE (string_ AS WORD, length AS BYTE) SHARED STATIC
    asm
    lda {string_}
    sta X16_P0
    lda {string_}+1
    sta X16_P1
    lda {length}
    sta X16_P2
    jsr dec_to_u16
    lda #0
    rol
    sta {x16_dec_to_u16}
    end asm
END FUNCTION
