# Verification results — 2026-09-13

Revision: `3ee276100def7a82a3569c14762c6798559339be` plus the local corrections and
pre-existing working-tree changes documented in STATUS.md. No commit or publication was made.
Exact tested distribution and test/render sources: [audited-files.json](audited-files.json), SHA-256.
Game data and reflection target: local RimWorld **1.6.4871 rev590**.

| Check | Observed result | Evidence |
| --- | --- | --- |
| Automated static/regression suite | PASS, 9 tests | automated-results.txt; test_mod.py |
| XML syntax and typed defName uniqueness | PASS, 7 XML files, 10 distinct typed definitions | Included in automated suite |
| Native EN and FR coverage | PASS, all 20 source-owned fields covered, no empty/duplicate/obsolete French entries | Coverage derived independently from source XML |
| Engine DefInjected paths | PASS, 20 keys, 0 errors, no unverified targets | definjected-results.txt |
| Preview decode/dimensions/size | PASS, 896 x 504, 592,045 bytes | Automated image checks and browser render |
| Text/background contrast | PASS, minimum 4.936:1; badge 9.562:1 | contrast-results.txt; ../Art/preview-contrast.json |
| Visual inspection | PASS, 896 x 504 and 268 px thumbnail opened directly; title, suffix, tag and version readable; no cropping/overlap | ../Art/preview-thumbnail.png |
| Actual browser fonts | Segoe UI Semibold and Segoe UI, no fallback | ../Art/preview-render.json |
| Functional scenarios A-Q | UNVERIFIED, not executed in game | ../TESTING.md |
| Custom C# build/unit tests | NOT APPLICABLE, no custom compiled code | Source/distribution inventory |
| Settings and RIMMSQOL integration | NOT APPLICABLE, no settings requirement, empty page or shortcut | STATUS.md settings audit and absence regression check |

Execution used the bundled Python at
`C:/Users/nelim/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/python.exe`
for `Tests/test_mod.py` and `Art/check-contrast.py`. The renderer used Node.js, bundled Playwright
through NODE_PATH, and installed Chrome. See TESTING.md for portable commands.

The shared `../scripts/Check-DefInjected.ps1` was run with `-TransMod <repository>/Mod` against
the installed assemblies. Checker SHA-256:
`6242fc37f0b43c61967979f7837db65d80e12bf8a019a4822d58c6532f6a2c6f`.
It indexed 11,594 Core/DLC/mod definitions and applied 29 game-data patch operations during
indexing; the mod itself ships no patches. The checker is a shared workflow dependency, not
shipped game content. The repository Python suite can run independently of that script.

During correction, the first injection check rejected two numeric life-stage paths; these were
changed to the native `meffalo_calf` handle and the full check rerun successfully. Conservative
contrast checks initially found the secondary text below 4.5:1 over its full layout rectangle;
the veil and secondary ink were adjusted, rerendered and remeasured to the final passing result.
The measured background includes the actual rendered image and veil and excludes text shadows,
so shadow effects are not being used to inflate the contrast figures.

These checks validate source/packaging contracts and injection paths, not live animal behavior,
packed audio loading, corpse fallback rendering, translation layout in RimWorld or save migration.
No game process was launched or controlled, and no game-log pass is claimed. `done` is therefore
the highest justified workflow stage; `tested` awaits the recorded functional scenarios.
