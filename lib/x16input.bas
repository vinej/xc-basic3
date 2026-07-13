' =====================================================================
' x16input.bas -- XBasic wrappers for the x16_library joystick / mouse / keyboard module.
' Auto-generated from input/input.asm header comments. INCLUDE to use it;
' the library code links automatically (X16_USE_INPUT).
' =====================================================================
asm
X16_USE_INPUT = 1
end asm

SUB x16_joy_scan () SHARED STATIC
    asm
    jsr joy_scan
    end asm
END SUB

SUB x16_mouse_show (y AS BYTE) SHARED STATIC
    asm
    ldx {y}
    jsr mouse_show
    end asm
END SUB

SUB x16_mouse_get () SHARED STATIC
    asm
    jsr mouse_get
    end asm
END SUB

FUNCTION x16_key_get AS BYTE () SHARED STATIC
    asm
    jsr key_get
    sta {x16_key_get}
    end asm
END FUNCTION

FUNCTION x16_key_wait AS BYTE () SHARED STATIC
    asm
    jsr key_wait
    sta {x16_key_wait}
    end asm
END FUNCTION

FUNCTION x16_key_peek AS BYTE () SHARED STATIC
    asm
    jsr key_peek
    sta {x16_key_peek}
    end asm
END FUNCTION
