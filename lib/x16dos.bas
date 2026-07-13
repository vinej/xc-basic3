' =====================================================================
' x16dos.bas -- XBasic wrappers for the x16_library DOS commands module.
' Auto-generated from storage/dos.asm header comments. INCLUDE to use it;
' the library code links automatically (X16_USE_DOS).
' =====================================================================
asm
X16_USE_DOS = 1
end asm

FUNCTION x16_dos_cmd AS BYTE (command AS BYTE, command2 AS BYTE, length AS BYTE) SHARED STATIC
    asm
    ldy {length}
    ldx {command2}
    lda {command}
    jsr dos_cmd
    sta {x16_dos_cmd}
    end asm
END FUNCTION

SUB x16_dos_status () SHARED STATIC
    asm
    jsr dos_status
    end asm
END SUB
