' =====================================================================
' x16psg.bas -- XBasic wrappers for the x16_library PSG sound module.
' Auto-generated from audio/psg.asm header comments. INCLUDE to use it;
' the library code links automatically (X16_USE_PSG).
' =====================================================================
asm
X16_USE_PSG = 1
end asm

SUB x16_psg_init () SHARED STATIC
    asm
    jsr psg_init
    end asm
END SUB

SUB x16_psg_set_freq (voice_ AS BYTE, frequency AS WORD) SHARED STATIC
    asm
    lda {frequency}
    sta X16_P0
    lda {frequency}+1
    sta X16_P1
    ldx {voice_}
    jsr psg_set_freq
    end asm
END SUB

SUB x16_psg_set_vol (voice_ AS BYTE, volume_ AS BYTE, pan AS BYTE) SHARED STATIC
    asm
    ldy {pan}
    ldx {voice_}
    lda {volume_}
    jsr psg_set_vol
    end asm
END SUB

SUB x16_psg_set_wave (voice_ AS BYTE, waveform AS BYTE, pulse AS BYTE) SHARED STATIC
    asm
    ldy {pulse}
    ldx {voice_}
    lda {waveform}
    jsr psg_set_wave
    end asm
END SUB

SUB x16_psg_note_off (voice_ AS BYTE) SHARED STATIC
    asm
    ldx {voice_}
    jsr psg_note_off
    end asm
END SUB

SUB x16_psg_env_start (voice_ AS BYTE, peak AS BYTE, attack AS BYTE, sustain AS BYTE, release AS BYTE) SHARED STATIC
    asm
    lda {peak}
    sta X16_P0
    lda {attack}
    sta X16_P1
    lda {sustain}
    sta X16_P2
    lda {release}
    sta X16_P3
    lda {voice_}
    jsr psg_env_start
    end asm
END SUB

SUB x16_psg_env_release (voice_ AS BYTE, voice_2 AS BYTE) SHARED STATIC
    asm
    lda {voice_}
    lda {voice_2}
    jsr psg_env_release
    end asm
END SUB

SUB x16_psg_env_tick () SHARED STATIC
    asm
    jsr psg_env_tick
    end asm
END SUB
