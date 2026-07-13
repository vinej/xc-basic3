' =====================================================================
' x16load.bas -- XBasic wrappers for the x16_library file load / save module.
' Auto-generated from storage/load.asm header comments. INCLUDE to use it;
' the library code links automatically (X16_USE_LOAD).
' =====================================================================
asm
X16_USE_LOAD = 1
end asm

SUB x16_fs_setname (filename AS WORD, length AS BYTE) SHARED STATIC
    asm
    lda {filename}
    sta X16_P0
    lda {filename}+1
    sta X16_P1
    lda {length}
    jsr fs_setname
    end asm
END SUB

FUNCTION x16_fs_load AS BYTE (filename AS LONG, device AS BYTE, secondary AS BYTE, destination AS WORD) SHARED STATIC
    asm
    lda {filename}
    sta X16_P0
    lda {filename}+1
    sta X16_P1
    lda {filename}+2
    sta X16_P2
    lda {device}
    sta X16_P3
    lda {secondary}
    sta X16_P4
    lda {destination}
    sta X16_P5
    lda {destination}+1
    sta X16_P6
    jsr fs_load
    lda #0
    rol
    sta {x16_fs_load}
    end asm
END FUNCTION

FUNCTION x16_fs_save AS BYTE (filename AS LONG, device AS BYTE, start AS WORD) SHARED STATIC
    asm
    lda {filename}
    sta X16_P0
    lda {filename}+1
    sta X16_P1
    lda {filename}+2
    sta X16_P2
    lda {device}
    sta X16_P3
    lda {start}
    sta X16_P5
    lda {start}+1
    sta X16_P6
    jsr fs_save
    lda #0
    rol
    sta {x16_fs_save}
    end asm
END FUNCTION

SUB x16_fs_vload (filename AS LONG, device AS BYTE, vram AS BYTE, vram2 AS WORD) SHARED STATIC
    asm
    lda {filename}
    sta X16_P0
    lda {filename}+1
    sta X16_P1
    lda {filename}+2
    sta X16_P2
    lda {device}
    sta X16_P3
    lda {vram}
    sta X16_P4
    lda {vram2}
    sta X16_P5
    lda {vram2}+1
    sta X16_P6
    jsr fs_vload
    end asm
END SUB
