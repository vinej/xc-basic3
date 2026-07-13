' =====================================================================
' x16verafx.bas -- XBasic wrappers for the x16_library VERA FX (mult/fill/line/affine) module.
' Auto-generated from gfx/verafx.asm header comments. INCLUDE to use it;
' the library code links automatically (X16_USE_VERAFX).
' =====================================================================
asm
X16_USE_VERAFX = 1
end asm

SUB x16_fx_off () SHARED STATIC
    asm
    jsr fx_off
    end asm
END SUB

SUB x16_fx_mult (a AS WORD, b AS WORD) SHARED STATIC
    asm
    lda {a}
    sta X16_P0
    lda {a}+1
    sta X16_P1
    lda {b}
    sta X16_P2
    lda {b}+1
    sta X16_P3
    jsr fx_mult
    end asm
END SUB

SUB x16_fx_fill (byte_ AS BYTE, destination AS LONG, byte_2 AS WORD) SHARED STATIC
    asm
    lda {destination}
    sta X16_P0
    lda {destination}+1
    sta X16_P1
    lda {destination}+2
    sta X16_P2
    lda {byte_2}
    sta X16_P3
    lda {byte_2}+1
    sta X16_P4
    lda {byte_}
    jsr fx_fill
    end asm
END SUB

SUB x16_fx_clear (address AS LONG, byte_ AS WORD) SHARED STATIC
    asm
    lda {address}
    sta X16_P0
    lda {address}+1
    sta X16_P1
    lda {address}+2
    sta X16_P2
    lda {byte_}
    sta X16_P3
    lda {byte_}+1
    sta X16_P4
    jsr fx_clear
    end asm
END SUB

SUB x16_fx_copy (source AS LONG, destination AS LONG, byte_ AS WORD) SHARED STATIC
    asm
    lda {source}
    sta X16_P0
    lda {source}+1
    sta X16_P1
    lda {source}+2
    sta X16_P2
    lda {destination}
    sta X16_P3
    lda {destination}+1
    sta X16_P4
    lda {destination}+2
    sta X16_P5
    lda {byte_}
    sta X16_P6
    lda {byte_}+1
    sta X16_P7
    jsr fx_copy
    end asm
END SUB

SUB x16_fx_affine_on (tile AS LONG, tile2 AS LONG, map AS BYTE, bit AS BYTE) SHARED STATIC
    asm
    lda {tile}
    sta X16_P0
    lda {tile}+1
    sta X16_P1
    lda {tile}+2
    sta X16_P2
    lda {tile2}
    sta X16_P3
    lda {tile2}+1
    sta X16_P4
    lda {tile2}+2
    sta X16_P5
    lda {map}
    sta X16_P6
    lda {bit}
    sta X16_P7
    jsr fx_affine_on
    end asm
END SUB

SUB x16_fx_affine_ray (starting AS WORD, starting2 AS WORD, dx AS WORD, dy AS WORD) SHARED STATIC
    asm
    lda {starting}
    sta X16_P0
    lda {starting}+1
    sta X16_P1
    lda {starting2}
    sta X16_P2
    lda {starting2}+1
    sta X16_P3
    lda {dx}
    sta X16_P4
    lda {dx}+1
    sta X16_P5
    lda {dy}
    sta X16_P6
    lda {dy}+1
    sta X16_P7
    jsr fx_affine_ray
    end asm
END SUB

SUB x16_fx_affine_span (texel AS WORD) SHARED STATIC
    asm
    lda {texel}
    sta X16_P0
    lda {texel}+1
    sta X16_P1
    jsr fx_affine_span
    end asm
END SUB

SUB x16_fx_line (x0 AS WORD, y0 AS BYTE, x1 AS WORD, y1 AS BYTE, colour AS BYTE) SHARED STATIC
    asm
    lda {x0}
    sta X16_P0
    lda {x0}+1
    sta X16_P1
    lda {y0}
    sta X16_P2
    lda {x1}
    sta X16_P3
    lda {x1}+1
    sta X16_P4
    lda {y1}
    sta X16_P5
    lda {colour}
    sta X16_P6
    jsr fx_line
    end asm
END SUB

SUB x16_fx_triangle () SHARED STATIC
    asm
    jsr fx_triangle
    end asm
END SUB
