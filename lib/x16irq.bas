' =====================================================================
' x16irq.bas -- XBasic wrappers for the x16_library IRQ / VSYNC frame lock module.
' Auto-generated from system/irq.asm header comments. INCLUDE to use it;
' the library code links automatically (X16_USE_IRQ).
' =====================================================================
asm
X16_USE_IRQ = 1
end asm

SUB x16_irq_install () SHARED STATIC
    asm
    jsr irq_install
    end asm
END SUB

SUB x16_irq_remove () SHARED STATIC
    asm
    jsr irq_remove
    end asm
END SUB

SUB x16_irq_line_install (handler AS BYTE, handler2 AS BYTE, scanline AS WORD) SHARED STATIC
    asm
    lda {scanline}
    sta X16_P0
    lda {scanline}+1
    sta X16_P1
    ldx {handler2}
    lda {handler}
    jsr irq_line_install
    end asm
END SUB

SUB x16_irq_sprcol_install (handler AS BYTE, handler2 AS BYTE, x AS BYTE) SHARED STATIC
    asm
    ldx {handler2}
    lda {handler}
    lda {x}
    jsr irq_sprcol_install
    end asm
END SUB

FUNCTION x16_sprite_collisions AS BYTE () SHARED STATIC
    asm
    jsr sprite_collisions
    sta {x16_sprite_collisions}
    end asm
END FUNCTION

SUB x16_vsync_wait () SHARED STATIC
    asm
    jsr vsync_wait
    end asm
END SUB
