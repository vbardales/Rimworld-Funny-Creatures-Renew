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
| static-1 | 2026-09-28 | outside the game | `ed32e2b` | not applicable | 9 of 9 / 9 / 0, plus 20 DefInjected keys / 0 errors, plus 5 contrast measures over 4.5:1 | `Tests/test_mod.py`, the shared `Check-DefInjected.ps1`, `Art/check-contrast.py`. Not a game run: no RimWorld process was started. Preview and 32 px icon opened directly | `evidence/static/2026-09-28-ed32e2b/` |

No game run exists yet: the Pickle suite has not been written (`STATUS.md`).
