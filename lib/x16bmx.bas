' =====================================================================
' x16bmx.bas -- XBasic wrappers for the x16_library BMX bitmap files module.
' Auto-generated from storage/bmx.asm header comments. INCLUDE to use it;
' the library code links automatically (X16_USE_BMX).
' =====================================================================
asm
X16_USE_BMX = 1
end asm

FUNCTION x16_bmx_load AS BYTE (filename AS WORD, length AS BYTE, device AS BYTE, vram AS BYTE, vram2 AS WORD) SHARED STATIC
    asm
    lda {filename}
    sta X16_P0
    lda {filename}+1
    sta X16_P1
    lda {length}
    sta X16_P2
    lda {device}
    sta X16_P3
    lda {vram}
    sta X16_P4
    lda {vram2}
    sta X16_P5
    lda {vram2}+1
    sta X16_P6
    jsr bmx_load
    lda #0
    rol
    sta {x16_bmx_load}
    end asm
END FUNCTION

FUNCTION x16_bmx_save AS BYTE (filename AS WORD, length AS BYTE, device AS BYTE, vram AS BYTE, vram2 AS WORD) SHARED STATIC
    asm
    lda {filename}
    sta X16_P0
    lda {filename}+1
    sta X16_P1
    lda {length}
    sta X16_P2
    lda {device}
    sta X16_P3
    lda {vram}
    sta X16_P4
    lda {vram2}
    sta X16_P5
    lda {vram2}+1
    sta X16_P6
    jsr bmx_save
    lda #0
    rol
    sta {x16_bmx_save}
    end asm
END FUNCTION
