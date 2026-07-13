' =====================================================================
' x16tile.bas -- XBasic wrappers for the x16_library tilemap layers module.
' Auto-generated from video/tile.asm header comments. INCLUDE to use it;
' the library code links automatically (X16_USE_TILE).
' =====================================================================
asm
X16_USE_TILE = 1
end asm

SUB x16_layer_set_config (layer AS BYTE, config AS BYTE, layer2 AS BYTE, vram AS BYTE, layer3 AS BYTE, base AS BYTE) SHARED STATIC
    asm
    ldx {layer}
    ldx {layer2}
    ldx {layer3}
    lda {config}
    lda {vram}
    lda {base}
    jsr layer_set_config
    end asm
END SUB

SUB x16_tile_put (column AS BYTE, row AS BYTE, screen_ AS BYTE, attribute AS BYTE) SHARED STATIC
    asm
    lda {screen_}
    sta X16_P0
    lda {attribute}
    sta X16_P1
    ldy {row}
    ldx {column}
    jsr tile_put
    end asm
END SUB

FUNCTION x16_tile_get AS WORD (column AS BYTE, row AS BYTE) SHARED STATIC
    asm
    ldy {row}
    ldx {column}
    jsr tile_get
    sta {x16_tile_get}
    stx {x16_tile_get}+1
    end asm
END FUNCTION
