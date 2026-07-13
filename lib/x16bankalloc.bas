' =====================================================================
' x16bankalloc.bas -- XBasic wrappers for the x16_library banked RAM allocator module.
' Auto-generated from storage/bankalloc.asm header comments. INCLUDE to use it;
' the library code links automatically (X16_USE_BANKALLOC).
' =====================================================================
asm
X16_USE_BANKALLOC = 1
end asm

SUB x16_bank_alloc_init (first AS BYTE, last AS BYTE) SHARED STATIC
    asm
    ldx {last}
    lda {first}
    jsr bank_alloc_init
    end asm
END SUB

FUNCTION x16_bank_alloc AS BYTE () SHARED STATIC
    asm
    jsr bank_alloc
    lda #0
    rol
    sta {x16_bank_alloc}
    end asm
END FUNCTION

SUB x16_bank_free (bank AS BYTE) SHARED STATIC
    asm
    lda {bank}
    jsr bank_free
    end asm
END SUB

FUNCTION x16_bank_reserve AS BYTE (bank AS BYTE) SHARED STATIC
    asm
    lda {bank}
    jsr bank_reserve
    lda #0
    rol
    sta {x16_bank_reserve}
    end asm
END FUNCTION
