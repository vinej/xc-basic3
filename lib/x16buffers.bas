' =====================================================================
' x16buffers.bas -- XBasic wrappers for the x16_library ring buffers / stacks module.
' Auto-generated from util/buffers.asm header comments. INCLUDE to use it;
' the library code links automatically (X16_USE_BUFFERS).
' =====================================================================
asm
X16_USE_BUFFERS = 1
end asm

FUNCTION x16_rb_init AS BYTE (byte_ AS BYTE) SHARED STATIC
    asm
    lda {byte_}
    jsr rb_init
    sta {x16_rb_init}
    end asm
END FUNCTION

FUNCTION x16_stk_init AS BYTE (byte_ AS BYTE) SHARED STATIC
    asm
    lda {byte_}
    jsr stk_init
    sta {x16_stk_init}
    end asm
END FUNCTION
