' =====================================================================
' x16ym.bas -- XBasic wrappers for the x16_library YM2151 FM sound module.
' Hand-tuned (the library's ym comments carry carry-flag semantics the
' auto-generator can't infer). INCLUDE to use it; links via X16_USE_YM.
' =====================================================================
asm
X16_USE_YM = 1
end asm

' Reset the chip and load the default patch set. Returns 1 on failure
' (no YM present), 0 on success.
FUNCTION x16_ym_init AS BYTE () SHARED STATIC
    asm
    jsr ym_init
    lda #0
    rol
    sta {x16_ym_init}
    end asm
END FUNCTION

' Load a ROM instrument patch (0-162) on a channel. Returns 1 on failure.
FUNCTION x16_ym_patch AS BYTE (channel AS BYTE, patch AS BYTE) SHARED STATIC
    asm
    sec
    lda {channel}
    ldx {patch}
    jsr ym_patch
    lda #0
    rol
    sta {x16_ym_patch}
    end asm
END FUNCTION

' Attenuation: 0 = the patch's own volume, higher = quieter.
SUB x16_ym_vol (channel AS BYTE, attenuation AS BYTE) SHARED STATIC
    asm
    lda {channel}
    ldx {attenuation}
    jsr ym_vol
    end asm
END SUB

' pan: 0 off, 1 left, 2 right, 3 both.
SUB x16_ym_pan (channel AS BYTE, pan AS BYTE) SHARED STATIC
    asm
    lda {channel}
    ldx {pan}
    jsr ym_pan
    end asm
END SUB

' Play a packed note = (octave << 4) | 1..12, or 0 to release.
SUB x16_ym_note_bas (channel AS BYTE, note AS BYTE) SHARED STATIC
    asm
    clc
    lda {channel}
    ldx {note}
    jsr ym_note_bas
    end asm
END SUB

SUB x16_ym_release_note (channel AS BYTE) SHARED STATIC
    asm
    lda {channel}
    jsr ym_release_note
    end asm
END SUB

' Play a note by raw KC (key code) and KF (key fraction).
SUB x16_ym_note (channel AS BYTE, kc AS BYTE, kf AS BYTE) SHARED STATIC
    asm
    ldy {kf}
    lda {channel}
    ldx {kc}
    jsr ym_note
    end asm
END SUB

' Write/poke a raw register (A = value, X = register).
SUB x16_ym_poke (value AS BYTE, register AS BYTE) SHARED STATIC
    asm
    lda {value}
    ldx {register}
    jsr ym_poke
    end asm
END SUB
