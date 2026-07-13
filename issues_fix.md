# issues_fix.md — upstream bugfixes cherry-picked into `debug-info`

This branch is based on upstream tag
[`v3.2.0-beta`](https://github.com/neilsf/xc-basic3/releases/tag/v3.2.0-beta)
(commit `af1a5d9`). After that tag, upstream merged the X16 work into
`develop`/`main` and kept fixing bugs. On 2026-07-13 we audited the delta
(`af1a5d9..upstream/develop`) and cherry-picked the fixes below onto
`debug-info`, so this branch = `v3.2.0-beta` + debug-info/x16_library patches
+ these upstream bugfixes.

## Cherry-picked fixes (in application order)

| Commit here | Upstream | Issue | Fix | Files |
|---|---|---|---|---|
| `edbe664` | `186a166` | [#236](https://github.com/neilsf/xc-basic3/issues/236) | String stack corruption | `lib/io/_screen.asm`, `lib/string/_fn.asm` |
| `f02493a` | `39bfc41` | [#234](https://github.com/neilsf/xc-basic3/issues/234) | Wrong line numbers in error/warning messages on Windows with LF-only sources (`count(…, newline)` counted `"\r\n"`; now counts `'\n'`) | `source/compiler/compiler.d` |
| `c06131c` | `d088637` | [#236](https://github.com/neilsf/xc-basic3/issues/236) | `VAL()` left its argument on the string stack | `lib/string/_fn.asm` |
| `f572753` | `dd68d62` | [#238](https://github.com/neilsf/xc-basic3/issues/238) | **Wrong sign in LONG division result** (`NUCLEUS_DIV24` sign flag clobbered) | `lib/core/arith/_long.asm` |
| `10df727` | `117690e` | — | Compile error when targeting X16 (graphics VERA lib) | `lib/grx/_vera.asm` |
| `b01eed1` | `635b187` | — | X16 fixes: move SPRITEHIT/SPRITEBGHIT/SCAN declarations out of the common header (X16 has its own), screen/VERA/string lib corrections | `lib/headers.bas`, `lib/headers_x16.bas`, `lib/io/_screen.asm`, `lib/io/_vera.asm`, `lib/string/string.asm` |
| `72013f9` | `b8dbd92` | [#267](https://github.com/neilsf/xc-basic3/issues/267) | Missing `TI()` function on X16 | `lib/sys/sys.asm`, `lib/headers_x16.bas` (declaration came with `635b187`) |

### Deliberately NOT cherry-picked

- `34a839e` (#268, set appropriate `PROCESSOR` type) — this branch already
  fixes the same problem differently (`c3f9d75`: X16 emits `PROCESSOR 65c02`
  and the runtime libs' `PROCESSOR` directives are target-aware). Applying
  both would conflict.
- Everything else in `af1a5d9..develop` (grammar changes, PET/MEGA65 work,
  new features like DATA labels #261, KEY #270, unused-sub elision #274) —
  out of scope for a minimal, verified debug branch. Candidates for a future
  rebase onto `develop`.

### Conflict resolution notes

- `635b187` conflicted trivially in `lib/headers.bas` (same line, different
  EOL normalization). Resolved by keeping the line once and letting the
  commit's real change (deleting the 7 trailing Sprites/Graphics
  declarations) apply.

## Verification (2026-07-13, Windows, X16 target)

- `dub build` clean (one pre-existing D deprecation warning in
  `variable.d`), exe installed to `bin/Windows/xcbasic3.exe`.
- `examples/demo.bas` and the debugger repo's `bounce.bas` compile to PRG.
- **#234 confirmed fixed**: downcast warnings now report the correct lines
  (`bounce.bas:135/136`, the `/256` downcasts) on LF-only files under
  Windows; before, the line numbers were wrong.
- Full DAP regression (`X16_XCBasicDebugger/test/dap_smoke.py`, real Box16):
  breakpoints, step, continue, globals, typed formatting, PETSCII strings,
  `setVariable`, hover evaluate — all PASS.
- #238 (LONG division sign) is the upstream asm patch applied verbatim; not
  separately exercised at runtime here (no negative-LONG division in the
  example programs).

## Known bugs still present (upstream open, not fixed anywhere)

- [#285](https://github.com/neilsf/xc-basic3/issues/285) — `SHARED` SUB
  defined behind *nested* INCLUDEs fails with "Routine must be defined as
  its prototype". Workaround: include the module that defines the SUB
  directly from the main program (what the bundled `x16*.bas` modules do).
- [#263](https://github.com/neilsf/xc-basic3/issues/263) — assembly error
  using a string with `SELECT CASE` inside a FUNCTION.
- [#246](https://github.com/neilsf/xc-basic3/issues/246) — `@` (address-of)
  fails on a TYPE field whose name matches a function.
- [#288](https://github.com/neilsf/xc-basic3/issues/288) — optimizer's quick
  comparison-and-branch macros never fire (performance only).

## Additional defects found by code inspection (not in the upstream tracker)

- `source/statement/sprite_stmt.d`, `scroll_stmt.d`, `sound_stmt.d`:
  constant arguments are converted with `to!ubyte(...)` *before* the range
  check, so e.g. `SPRITE 300 ON` crashes the compiler with an unhandled
  `ConvOverflowException` instead of the intended error message (and the
  subsequent `< 0` test on a `ubyte` is dead code).
- `source/compiler/number.d`: an integer literal larger than 2^31−1 throws
  an unhandled `ConvException` (compiler crash, no diagnostic).
- Expression width semantics: arithmetic runs at the operands' width; the
  cast to the assignment target's type happens *after*. So
  `longVar = 623 * 256` multiplies in 16 bits and silently wraps. Compute
  wide values in steps (`x = 623 : x = x * 256`). This is a language-level
  semantic shared with upstream, not fixed by any known commit.
