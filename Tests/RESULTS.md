# Verification results — 2026-09-28

Revision: `ed32e2b51ab5fe9e47bb3bad83705dad386bdaff`, working tree clean for tracked files before this
audit's documentation edits (none of them touches `Mod/Defs`, `Mod/Languages`, `Mod/Textures` or the
images). Game data and reflection target: local RimWorld **1.6.4871 rev590**, read from disk.
**No game process was launched or controlled, and no game-log pass is claimed.**

The raw outputs are kept **on disk only**, in `evidence/static/2026-09-28-ed32e2b/` (git-ignored, see
`TESTING.md`, "Evidence to keep"). This file is the short record that stays in git.

| Check | Observed result | Evidence file (on disk) |
| --- | --- | --- |
| Automated static/regression suite | PASS, 9 tests, `python Tests/test_mod.py -v` | `automated-results.txt` |
| XML syntax and typed defName uniqueness | PASS, 7 XML files, 10 distinct typed definitions | inside the suite above |
| Native EN and FR coverage | PASS, all 20 source-owned fields covered, no empty, duplicate or obsolete French entry | inside the suite above |
| Engine DefInjected paths | PASS, 20 keys, 0 errors; 11,594 definitions indexed, 29 patch operations applied while indexing (the mod ships none). Checker sha256 `6242fc37f0b4…` | `definjected-results.txt` |
| Preview decode, dimensions, size | PASS, 896 x 504, 592,045 bytes, sha256 `9a84c62359d7…` | suite above |
| Preview text/background contrast | PASS, minimum 4.936:1 (tag), title 5.894, suffix 7.210, summary 5.035, badge 9.562; threshold 4.5:1. The Preview is unchanged since its 2026-09-13 render, so the render-time measurement still applies | `contrast-results.txt` |
| Preview inspection | PASS, the 896 x 504 file opened directly on 2026-09-28: title, suffix, tag and version readable, no clipping or overlap | not kept |
| ModIcon inspection | Format PASS (128 x 128, 12,519 bytes). Readability at 32 px: **head reads, the accompanying animals merge**; see `STATUS.md`, owner question | not kept |
| Hash inventory of the delivered files | 23 files hashed. The inventory recorded on 2026-09-13 disagreed on `Mod/About/About.xml` (changed by commit `ed32e2b`, the maintainer's name) and was regenerated | `audited-files.json` |
| Functional scenarios A-Q | UNVERIFIED, not executed in a game | `../TESTING.md` |
| Pickle (Gherkin) suite | NOT WRITTEN, see `STATUS.md` | none |
| Custom C# build / unit tests | NOT APPLICABLE, no custom compiled code | source inventory |
| Settings and RIMMSQOL integration | NOT APPLICABLE, no settings requirement, no page, no shortcut; absence re-checked by source search and `test_settings_absence_contract` | inside the suite above |

Execution used the bundled Python at
`C:/Users/nelim/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/python.exe` for
`Tests/test_mod.py` and `Art/check-contrast.py`. The shared `../scripts/Check-DefInjected.ps1` was run
with `-TransMod <repository>/Mod` against the installed assemblies; it is a workflow dependency, not
shipped game content.

## What these checks do not establish

They validate source and packaging contracts and injection paths. They do not show live animal
behaviour, packed audio loading, corpse fallback rendering, translation layout in RimWorld, or save
migration. `done` is not reached on their strength: the Pickle suite the workflow asks to have written
does not exist yet.

## History kept out of this file

The 2026-09-13 results (same suite, 9 tests, 20 keys) described revision `3ee2761` plus uncommitted
work. They were replaced, not appended: a report about a superseded revision proves nothing about the
current one. One line per run is in `../docs/runs/README.md`.
