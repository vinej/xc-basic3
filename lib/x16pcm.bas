' =====================================================================
' x16pcm.bas -- XBasic wrappers for the x16_library PCM audio FIFO module.
' Auto-generated from audio/pcm.asm header comments. INCLUDE to use it;
' the library code links automatically (X16_USE_PCM).
' =====================================================================
asm
X16_USE_PCM = 1
end asm

SUB x16_pcm_ctrl (control AS BYTE, sample AS BYTE) SHARED STATIC
    asm
    lda {control}
    lda {sample}
    jsr pcm_ctrl
    end asm
END SUB

FUNCTION x16_pcm_full AS BYTE () SHARED STATIC
    asm
    jsr pcm_full
    lda #0
    rol
    sta {x16_pcm_full}
    end asm
END FUNCTION

SUB x16_pcm_put (sample AS BYTE) SHARED STATIC
    asm
    lda {sample}
    jsr pcm_put
    end asm
END SUB

SUB x16_pcm_write (source AS WORD, byte_ AS WORD) SHARED STATIC
    asm
    lda {source}
    sta X16_P0
    lda {source}+1
    sta X16_P1
    lda {byte_}
    sta X16_P2
    lda {byte_}+1
    sta X16_P3
    jsr pcm_write
    end asm
END SUB

SUB x16_pcm_stream_start (sample AS WORD, byte_ AS WORD, sample2 AS BYTE) SHARED STATIC
    asm
    lda {sample}
    sta X16_P0
    lda {sample}+1
    sta X16_P1
    lda {byte_}
    sta X16_P2
    lda {byte_}+1
    sta X16_P3
    lda {sample2}
    jsr pcm_stream_start
    end asm
END SUB

SUB x16_pcm_stream_start_bank (offset AS WORD, byte_ AS LONG, the AS BYTE, sample AS BYTE) SHARED STATIC
    asm
    lda {offset}
    sta X16_P0
    lda {offset}+1
    sta X16_P1
    lda {byte_}
    sta X16_P2
    lda {byte_}+1
    sta X16_P3
    lda {byte_}+2
    sta X16_P4
    lda {the}
    sta X16_P5
    lda {sample}
    jsr pcm_stream_start_bank
    end asm
END SUB

SUB x16_pcm_stream_stop () SHARED STATIC
    asm
    jsr pcm_stream_stop
    end asm
END SUB

FUNCTION x16_pcm_stream_active AS BYTE () SHARED STATIC
    asm
    jsr pcm_stream_active
    sta {x16_pcm_stream_active}
    end asm
END FUNCTION

SUB x16_pcm_stream_isr () SHARED STATIC
    asm
    jsr pcm_stream_isr
    end asm
END SUB
