' =====================================================================
' x16math.bas -- XBasic wrappers for the x16_library rnd / sin / cos / atan2 / lerp module.
' Auto-generated from util/math.asm header comments. INCLUDE to use it;
' the library code links automatically (X16_USE_MATH).
' =====================================================================
asm
X16_USE_MATH = 1
end asm

FUNCTION x16_rnd_seed AS WORD (low AS BYTE, high AS BYTE) SHARED STATIC
    asm
    ldx {high}
    lda {low}
    jsr rnd_seed
    sta {x16_rnd_seed}
    stx {x16_rnd_seed}+1
    end asm
END FUNCTION

FUNCTION x16_atan2 AS BYTE (dx AS BYTE, dy AS BYTE) SHARED STATIC
    asm
    ldx {dy}
    lda {dx}
    jsr atan2
    sta {x16_atan2}
    end asm
END FUNCTION

FUNCTION x16_lerp8 AS BYTE (a AS BYTE, b AS BYTE, t AS BYTE) SHARED STATIC
    asm
    lda {a}
    sta X16_P0
    lda {b}
    sta X16_P1
    lda {t}
    jsr lerp8
    sta {x16_lerp8}
    end asm
END FUNCTION
