	IF TARGET == x16
	PROCESSOR 65c02
	ELSE
	PROCESSOR 6502
	ENDIF
	
	IF TARGET == c64 || TARGET == c128 || TARGET == mega65
	INCLUDE "sfx/_sid.asm"
	ENDIF
	
	IF TARGET & vic20
	INCLUDE "sfx/_vic.asm"
	ENDIF
	
	IF TARGET & c264
	INCLUDE "sfx/_ted.asm"
	ENDIF

	IF TARGET == x16
	INCLUDE "sfx/_vera.asm"
	ENDIF
	
	