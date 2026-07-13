' =====================================================================
' x16sprite.bas -- XBasic wrappers for the x16_library sprites module.
' Auto-generated from sprite/sprite.asm header comments. INCLUDE to use it;
' the library code links automatically (X16_USE_SPRITE).
' =====================================================================
asm
X16_USE_SPRITE = 1
end asm

SUB x16_sprite_pos (sprite_ AS BYTE, x AS WORD, y AS WORD) SHARED STATIC
    asm
    lda {x}
    sta X16_P0
    lda {x}+1
    sta X16_P1
    lda {y}
    sta X16_P2
    lda {y}+1
    sta X16_P3
    ldx {sprite_}
    jsr sprite_pos
    end asm
END SUB

SUB x16_sprite_get_pos (sprite_ AS BYTE) SHARED STATIC
    asm
    ldx {sprite_}
    jsr sprite_get_pos
    end asm
END SUB

SUB x16_sprite_image (sprite_ AS BYTE, addr AS LONG, sprite_mode_4bpp AS BYTE) SHARED STATIC
    asm
    lda {addr}
    sta X16_P0
    lda {addr}+1
    sta X16_P1
    lda {addr}+2
    sta X16_P2
    ldx {sprite_}
    lda {sprite_mode_4bpp}
    jsr sprite_image
    end asm
END SUB

SUB x16_sprite_flags (sprite_ AS BYTE, collision AS BYTE) SHARED STATIC
    asm
    ldx {sprite_}
    lda {collision}
    jsr sprite_flags
    end asm
END SUB

SUB x16_sprite_z (sprite_ AS BYTE, sprite_z_disabled AS BYTE) SHARED STATIC
    asm
    ldx {sprite_}
    lda {sprite_z_disabled}
    jsr sprite_z
    end asm
END SUB

SUB x16_sprite_size (sprite_ AS BYTE, width AS BYTE, height AS BYTE, palette AS BYTE) SHARED STATIC
    asm
    lda {palette}
    sta X16_P0
    ldy {height}
    ldx {sprite_}
    lda {width}
    jsr sprite_size
    end asm
END SUB

SUB x16_sprite_init_all () SHARED STATIC
    asm
    jsr sprite_init_all
    end asm
END SUB

SUB x16_sprites_on () SHARED STATIC
    asm
    jsr sprites_on
    end asm
END SUB

SUB x16_sprites_off () SHARED STATIC
    asm
    jsr sprites_off
    end asm
END SUB
