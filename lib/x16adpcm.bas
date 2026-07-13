' =====================================================================
' x16adpcm.bas -- XBasic wrappers for the x16_library IMA ADPCM decode module.
' Auto-generated from audio/adpcm.asm header comments. INCLUDE to use it;
' the library code links automatically (X16_USE_ADPCM).
' =====================================================================
asm
X16_USE_ADPCM = 1
end asm

SUB x16_adpcm_init () SHARED STATIC
    asm
    jsr adpcm_init
    end asm
END SUB

FUNCTION x16_adpcm_nibble AS WORD (the AS BYTE) SHARED STATIC
    asm
    lda {the}
    jsr adpcm_nibble
    sta {x16_adpcm_nibble}
    stx {x16_adpcm_nibble}+1
    end asm
END FUNCTION

SUB x16_adpcm_block (source AS WORD, destination AS WORD, source2 AS WORD) SHARED STATIC
    asm
    lda {source}
    sta X16_P0
    lda {source}+1
    sta X16_P1
    lda {destination}
    sta X16_P2
    lda {destination}+1
    sta X16_P3
    lda {source2}
    sta X16_P4
    lda {source2}+1
    sta X16_P5
    jsr adpcm_block
    end asm
END SUB
