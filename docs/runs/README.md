# Runs: one line per run, and what evidence is kept

The root `AGENTS.md` ("Test evidence") asks for the history as **one text line per run in this folder,
never as folders**. A Pickle report is tens of megabytes and does not belong in a public repository, so
the record is split in two:

| What | Where | In git |
| --- | --- | --- |
| **Evidence**: the report, the captures, the films, `Player.log` | `Tests/Pickle/Evidence/<run>/` for a game run, `evidence/static/<date>-<sha>/` for the checks outside the game | **No.** Both are ignored |
| **History**: one line per run | the table below | Yes |

What to keep inside the evidence, and what to delete once a newer report replaces it, is written in
`../../TESTING.md`, "Evidence to keep". The evidence is a working copy that survives on this machine
only.

## What a line must say

Written from the report, and only what was read: the run and its date; the pass (`setName`, language);
the commit it ran from; **`exitReason` first**, then scenarios played of written, passed and failed (a
run killed in flight leaves a `summary.json` that looks like a result); what each failure turned out to
be (the mod, the suite, the environment, or not yet known); which `@review` captures were opened and
what they actually show; and where the evidence is. A line says what a run did, not what `TESTING.md`
says about coverage.

## The runs

| Run | Date | Pass | Staged from | `exitReason` | Played / passed / failed | What it was, and what was opened | Evidence |
| --- | --- | --- | --- | --- | --- | --- | --- |
| static-1 | 2026-09-28 | outside the game | `ed32e2b` | not applicable | 9 of 9 / 9 / 0, plus 20 DefInjected keys / 0 errors, plus 5 contrast measures over 4.5:1 | `Tests/test_mod.py`, the shared `Check-DefInjected.ps1`, `Art/check-contrast.py`. Not a game run: no RimWorld process was started. Preview and 32 px icon opened directly | deleted the same day, superseded by static-2 |
| static-2 | 2026-09-28 | outside the game | `0b29ed3` | not applicable | 23 of 23 / 23 / 0 in `test_mod.py`; 12 of 12 / 12 / 0 in `test_pickle_suite.py`; 20 DefInjected keys / 0 errors | The three patches applied to the real Core definitions with lxml, with and without each mod; every Pickle feature line matched to exactly one step of Pickle 4.9.1. Not a game run | `evidence/static/2026-09-28-0b29ed3/` |
| filed | 2026-09-28 | tools, EN and FR; avec-facultatifs; incompat-original; core-only | `0b29ed3` label, tree staged at play time = `9b94a1c` (frozen since) | not played | five requests, `20260928-140049-077-87fb`, `-685-c0cf`, `-140050-161-28b4`, `-652-1c89`, `-140051-287-ce95` | Filed at 14:00 behind 55 others. Nothing has been played; a line per run is added when each is read | `Tests/Pickle/Evidence/<pass>-0b29ed3/` when it comes |

No game run exists yet: the suite is written and five requests are filed (`STATUS.md`).
| 87fb | 2026-09-28 | tools, EN | `0b29ed3` label, `9b94a1c` tree | read from the run message and `summary.md`, not yet from the report | 29 written: 12 passed / 4 failed / 13 skipped (the 13 need optional mods this pass does not load) | Failures: the wildness step names a def that is ThingDef and PawnKindDef (suite, fixed with a custom race step); `funnycreatures/MeffaloPack` textures missing, drawn because Meffalo is a pack animal (mod, transparent placeholder textures added, art still to do); boomsloth kill burned nobody while the boomalope control did (cause not known, wait raised to 90 ticks and film removed to see). No capture opened yet | `Tests/Pickle/Evidence/tools-en-0b29ed3/` |
| c0cf | 2026-09-28 | tools, FR | `0b29ed3` label, `9b94a1c` tree | read from the run message, not yet from the report | 29 written: 12 passed / 4 failed / 13 skipped | The same four failures and 13 skips as 87fb: none depends on the language. Fixes are in `3ec0752`, to be replayed | `Tests/Pickle/Evidence/tools-fr-0b29ed3/` |
| 28b4 | 2026-09-28 | avec-facultatifs, EN | `0b29ed3` label, tree staged after `3ec0752` (so with the fixes) | read from the run message, not yet from the report | 25 written: 23 passed / 0 failed / 2 skipped | The 2 skipped need the original mod loaded together (pass 4). Scenario lists compared with tools-en: the 25 here are the 11 animal scenarios + the 11 optional-mod ones + 3 of the load pass; the four tools-en failures now PASS on the fixed tree (wildness, drawn with MeffaloPack, boomsloth burn with 90 ticks, meffalo calf control), so the 30-tick wait was likely too short. The tools passes still hold the without-optionals scenarios and need a replay on the fixed tree. No capture opened yet | `Tests/Pickle/Evidence/avec-facultatifs-en-0b29ed3/` |
| 1c89 | 2026-09-28 | incompat-original, EN | `0b29ed3` label | read from the run message and Player.log, not the report | 2 written: 1 passed / 1 failed | Both mods loaded. The failure is my assumption, not the mod: the game wrote NO "Adding duplicate" line for the shared defs; the log holds instead the original's three 1.3-form errors (`<wildness>` x2, `deathActionWorkerClass`). Scenario rewritten to assert those; to replay | `Tests/Pickle/Evidence/incompat-original-en-0b29ed3/` |
| ce95 | 2026-09-28 | core-only, EN | `0b29ed3` label | read from the run message, not the report | 3 written: 3 passed / 0 failed / 0 skipped | Played on the tree before the wildness step was replaced (11 changed since); replayed below | `Tests/Pickle/Evidence/core-only-en-0b29ed3/` |
| filed | 2026-09-28 | tools EN and FR; incompat-original; core-only | `69a9e1a` | not played | four requests, `20260928-192631-380-7a90`, `-816-4671`, `-192632-159-6af5`, `-499-1ddd` | The replay on the corrected tree: wildness step, MeffaloPack textures, 90-tick wait, pass-4 scenario. Pass 3 is not replayed: 28b4 already ran the fixed tree and 10 is not in it | `Tests/Pickle/Evidence/<pass>-<lang>-69a9e1a/` when it comes |
