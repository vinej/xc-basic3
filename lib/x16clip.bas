' =====================================================================
' x16clip.bas -- XBasic wrappers for the x16_library line clipping module.
' Auto-generated from util/clip.asm header comments. INCLUDE to use it;
' the library code links automatically (X16_USE_CLIP).
' =====================================================================
asm
X16_USE_CLIP = 1
end asm

SUB x16_clip_set (xmin AS WORD, ymin AS WORD, xmax AS WORD, ymax AS WORD) SHARED STATIC
    asm
    lda {xmin}
    sta X16_P0
    lda {xmin}+1
    sta X16_P1
    lda {ymin}
    sta X16_P2
    lda {ymin}+1
    sta X16_P3
    lda {xmax}
    sta X16_P4
    lda {xmax}+1
    sta X16_P5
    lda {ymax}
    sta X16_P6
    lda {ymax}+1
    sta X16_P7
    jsr clip_set
    end asm
END SUB

FUNCTION x16_clip_line AS BYTE () SHARED STATIC
    asm
    jsr clip_line
    lda #0
    rol
    sta {x16_clip_line}
    end asm
END FUNCTION
