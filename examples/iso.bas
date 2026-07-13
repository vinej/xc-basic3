INCLUDE "x16lib.bas"
DIM f AS WORD
f = 2362
CALL x16psgfreq(0, f)
CALL x16cls()
END
asm
    INCDIR "C:/quartus/projects/x16_library/src_dasm"
    INCLUDE "x16_code.asm"
end asm
