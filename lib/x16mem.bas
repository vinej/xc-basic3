' =====================================================================
' x16mem.bas -- XBasic wrappers for the x16_library KERNAL block memory ops module.
' Auto-generated from storage/mem.asm header comments. INCLUDE to use it;
' the library code links automatically (X16_USE_MEM).
' =====================================================================
asm
X16_USE_MEM = 1
end asm

SUB x16_mem_fill (target AS WORD, byte_ AS WORD, value AS BYTE) SHARED STATIC
    asm
    lda {target}
    sta X16_P0
    lda {target}+1
    sta X16_P1
    lda {byte_}
    sta X16_P2
    lda {byte_}+1
    sta X16_P3
    lda {value}
    jsr mem_fill
    end asm
END SUB

SUB x16_mem_copy (source AS WORD, target AS WORD, byte_ AS WORD) SHARED STATIC
    asm
    lda {source}
    sta X16_P0
    lda {source}+1
    sta X16_P1
    lda {target}
    sta X16_P2
    lda {target}+1
    sta X16_P3
    lda {byte_}
    sta X16_P4
    lda {byte_}+1
    sta X16_P5
    jsr mem_copy
    end asm
END SUB

FUNCTION x16_mem_crc AS WORD (address AS WORD, byte_ AS WORD) SHARED STATIC
    asm
    lda {address}
    sta X16_P0
    lda {address}+1
    sta X16_P1
    lda {byte_}
    sta X16_P2
    lda {byte_}+1
    sta X16_P3
    jsr mem_crc
    sta {x16_mem_crc}
    stx {x16_mem_crc}+1
    end asm
END FUNCTION

SUB x16_mem_decompress (compressed AS WORD, output AS WORD) SHARED STATIC
    asm
    lda {compressed}
    sta X16_P0
    lda {compressed}+1
    sta X16_P1
    lda {output}
    sta X16_P2
    lda {output}+1
    sta X16_P3
    jsr mem_decompress
    end asm
END SUB
