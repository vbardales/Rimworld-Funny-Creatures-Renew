# Verification results: 2026-09-28, revision 0b29ed3

Revision: `0b29ed3` (`0b29ed3d…`), the tree clean for tracked files when the checks ran. Game data and reflection target: local
RimWorld **1.6.4871 rev590**, read from disk. **No game process was launched or controlled, and no game-log pass is claimed.**

The raw outputs are kept **on disk only**, in `evidence/static/2026-09-28-0b29ed3/` (git-ignored, see `TESTING.md`, "Evidence to
keep"). This file is the short record that stays in git. The results of `ed32e2b` (the audit of the same day) were replaced, not
appended: a report about a superseded revision proves nothing about the current one.

| Check | Observed result | Evidence file (on disk) |
| --- | --- | --- |
| Distribution and regression suite | PASS, 23 tests, `python Tests/test_mod.py -v`: XML and typed defName uniqueness (7 XML files, 10 typed definitions), French coverage of the 20 owned fields, the port repairs, production, metadata, packaging, images, Core references | `automated-results.txt` |
| The three optional patches, applied | PASS, inside the 23. The real files are applied to the real Core definitions with lxml (the game's XPath 1.0 semantics), with and without each mod, and on a list and an extension that already exist. The always-true XPath predicate was put back once and the test failed on it | `automated-results.txt` |
| Patch class names against the compiled assemblies | PASS, `DZY.CrossBreeding` read in Better Crossbreeding's own assembly, `ExtendedRaceProperties` in Nocturnal Animals'; ADS 2's categories and Nocturnal's Megasloth entry read from the installed mods | `automated-results.txt` |
| Pickle suite, offline | PASS, 12 tests, `python Tests/test_pickle_suite.py`: every feature line matches **exactly one** step of the installed Pickle 4.9.1 (205 expressions, plus the load audit's two and the assembly's), no `@wip`, tags known, maps well-formed and ending in a newline, staged folders exist and declare the id written, `@requires` ids staged by their map, def names exist. The undefined-step detector was shown to fail on `an error matching ...` | `pickle-suite-results.txt` |
| Step assembly | BUILT, `dotnet build Tests/Pickle/Source/FunnyCreatures.PickleSteps.csproj -c Release`, no warning. **Not executed**: a step that compiles has not run | not kept, the DLL is git-ignored |
| Engine DefInjected paths | PASS, 20 keys, 0 errors; checker sha256 `6242fc37f0b4…` | `definjected-results.txt` |
| Preview | PASS, 896 x 504, 592,045 bytes; contrast minimum 4.936:1 (threshold 4.5:1); unchanged since its 2026-09-13 render | `contrast-results.txt` |
| ModIcon | Format PASS (128 x 128, 12,519 bytes). Readability at 32 px: **the head reads, the accompanying animals merge**, owner question in `STATUS.md` | not kept |
| Hash inventory of the delivered and test files | 42 files hashed | `audited-files.json` |
| Functional scenarios A-T | UNVERIFIED, not executed in a game. Five requests filed, see `STATUS.md` | none |
| Custom C# build / unit tests of the mod | NOT APPLICABLE, no custom compiled code in `Mod/` | source inventory |
| Settings and RIMMSQOL integration | NOT APPLICABLE, no page and no shortcut; absence re-checked | inside the 23 |

Execution used the bundled Python at
`C:/Users/nelim/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/python.exe` (3.12, with lxml). The shared
`../scripts/Check-DefInjected.ps1` was run with `-TransMod <repository>/Mod` against the installed assemblies.

## What these checks do not establish

They validate source and packaging contracts, the effect of the patches on the definitions, and the consistency of the Pickle suite
with the steps that exist. They do not show live animal behaviour, that any step does what it says, that the cells chosen on Pickle's
test colony are free, packed audio loading, corpse rendering, translation layout in RimWorld, or save migration.

## History kept out of this file

One line per run is in `../docs/runs/README.md`.
