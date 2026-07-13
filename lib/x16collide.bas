' =====================================================================
' x16collide.bas -- XBasic wrappers for the x16_library AABB collision module.
' Auto-generated from util/collide.asm header comments. INCLUDE to use it;
' the library code links automatically (X16_USE_COLLIDE).
' =====================================================================
asm
X16_USE_COLLIDE = 1
end asm

FUNCTION x16_collide8 AS BYTE (ax AS BYTE, ay AS BYTE, aw AS BYTE, ah AS BYTE, bx AS BYTE, by AS BYTE, bw AS BYTE, bh AS BYTE) SHARED STATIC
    asm
    lda {ax}
    sta X16_P0
    lda {ay}
    sta X16_P1
    lda {aw}
    sta X16_P2
    lda {ah}
    sta X16_P3
    lda {bx}
    sta X16_P4
    lda {by}
    sta X16_P5
    lda {bw}
    sta X16_P6
    lda {bh}
    sta X16_P7
    jsr collide8
    lda #0
    rol
    sta {x16_collide8}
    end asm
END FUNCTION

FUNCTION x16_collide16 AS BYTE () SHARED STATIC
    asm
    jsr collide16
    lda #0
    rol
    sta {x16_collide16}
    end asm
END FUNCTION
