' =====================================================================
' x16gfx.bas -- XBasic wrappers for the x16_library 320x240 bitmap graphics module.
' Auto-generated from gfx/bitmap.asm header comments. INCLUDE to use it;
' the library code links automatically (X16_USE_BITMAP).
' =====================================================================
asm
X16_USE_BITMAP = 1
end asm

SUB x16_gfx_init (colour AS BYTE) SHARED STATIC
    asm
    lda {colour}
    jsr gfx_init
    end asm
END SUB

SUB x16_gfx_pset (x AS WORD, y AS BYTE, colour AS BYTE) SHARED STATIC
    asm
    lda {x}
    sta X16_P0
    lda {x}+1
    sta X16_P1
    lda {y}
    sta X16_P2
    lda {colour}
    sta X16_P3
    jsr gfx_pset
    end asm
END SUB

SUB x16_gfx_hline (x AS WORD, y AS BYTE, colour AS BYTE, length AS WORD) SHARED STATIC
    asm
    lda {x}
    sta X16_P0
    lda {x}+1
    sta X16_P1
    lda {y}
    sta X16_P2
    lda {colour}
    sta X16_P3
    lda {length}
    sta X16_P4
    lda {length}+1
    sta X16_P5
    jsr gfx_hline
    end asm
END SUB

SUB x16_gfx_vline (x AS WORD, y AS BYTE, colour AS BYTE, length AS BYTE) SHARED STATIC
    asm
    lda {x}
    sta X16_P0
    lda {x}+1
    sta X16_P1
    lda {y}
    sta X16_P2
    lda {colour}
    sta X16_P3
    lda {length}
    sta X16_P4
    jsr gfx_vline
    end asm
END SUB

SUB x16_gfx_rect (x AS WORD, y AS BYTE, colour AS BYTE, width AS WORD, height AS BYTE) SHARED STATIC
    asm
    lda {x}
    sta X16_P0
    lda {x}+1
    sta X16_P1
    lda {y}
    sta X16_P2
    lda {colour}
    sta X16_P3
    lda {width}
    sta X16_P4
    lda {width}+1
    sta X16_P5
    lda {height}
    sta X16_P6
    jsr gfx_rect
    end asm
END SUB

SUB x16_gfx_frame () SHARED STATIC
    asm
    jsr gfx_frame
    end asm
END SUB

SUB x16_gfx_line (x0 AS WORD, y0 AS BYTE, x1 AS WORD, y1 AS BYTE, colour AS BYTE) SHARED STATIC
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
    jsr gfx_line
    end asm
END SUB

SUB x16_gfx_circle (centre AS LONG, colour AS BYTE, radius AS BYTE) SHARED STATIC
    asm
    lda {centre}
    sta X16_P0
    lda {centre}+1
    sta X16_P1
    lda {centre}+2
    sta X16_P2
    lda {colour}
    sta X16_P3
    lda {radius}
    sta X16_P4
    jsr gfx_circle
    end asm
END SUB

SUB x16_gfx_disc () SHARED STATIC
    asm
    jsr gfx_disc
    end asm
END SUB

SUB x16_gfx_char (screen_ AS BYTE, x AS WORD, y AS BYTE, colour AS BYTE, string_ AS BYTE, string_2 AS BYTE) SHARED STATIC
    asm
    lda {x}
    sta X16_P0
    lda {x}+1
    sta X16_P1
    lda {y}
    sta X16_P2
    lda {colour}
    sta X16_P3
    ldx {string_2}
    lda {screen_}
    lda {string_}
    jsr gfx_char
    end asm
END SUB

FUNCTION x16_gfx_flood AS BYTE (seed AS LONG, fill AS BYTE) SHARED STATIC
    asm
    lda {seed}
    sta X16_P0
    lda {seed}+1
    sta X16_P1
    lda {seed}+2
    sta X16_P2
    lda {fill}
    sta X16_P3
    jsr gfx_flood
    lda #0
    rol
    sta {x16_gfx_flood}
    end asm
END FUNCTION
