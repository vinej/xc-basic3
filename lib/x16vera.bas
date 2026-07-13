' =====================================================================
' x16vera.bas -- XBasic wrappers for the x16_library VERA module.
' INCLUDE to use it; the library code links automatically (X16_USE_VERA).
' =====================================================================
asm
X16_USE_VERA = 1
end asm

' Point data port 0 at a VRAM address. addrhi packs the bank bit plus
' (increment << 4): e.g. VRAM $13000 with VERA_INC_1 -> alo=$00, amid=$30,
' ahi=$11 (bank 1 | 1<<4).
SUB x16_vera_set_addr0 (alo AS BYTE, amid AS BYTE, ahi AS BYTE) SHARED STATIC
    asm
    lda {alo}
    ldx {amid}
    ldy {ahi}
    jsr vera_set_addr0
    end asm
END SUB

SUB x16_vera_set_addr1 (alo AS BYTE, amid AS BYTE, ahi AS BYTE) SHARED STATIC
    asm
    lda {alo}
    ldx {amid}
    ldy {ahi}
    jsr vera_set_addr1
    end asm
END SUB

' Write `value` to the current port `count` times (fast run). Point the
' port with x16_vera_set_addr0 first.
SUB x16_vera_fill (value AS BYTE, count AS WORD) SHARED STATIC
    asm
    ldx {count}
    ldy {count}+1
    lda {value}
    jsr vera_fill
    end asm
END SUB
