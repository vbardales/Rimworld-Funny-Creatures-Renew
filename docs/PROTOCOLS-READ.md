# Protocols read, and in which version

A record for this mod's session, so that a document is not read again unless it moved. Written
2026-09-28 after a full pass (the owner's request, and step 5 of `WELCOME.md`). The rule for using it:
**compare the version below with `git log -1` of the file (and its hash when git does not track it);
re-read only when it differs**, and only the "Re-read when" part unless the file is short.

Where the versions come from:

- The protocol documents (`AGENTS.md`, `AUDIT.md`, `PUBLISHING.md`, `TRANSLATIONS.md`,
  `STYLE_RIMWORLD.md`, `MOD_SETTINGS.md`, `WORKSHOP_COMMENTS.md`, `scripts/SEARCHING.md`) live in the
  protocols repository, not in the monorepo, so `git log` from the monorepo would answer with the commit
  that removed them. From `Documents\rimworld`:
  `git --git-dir=../rimworld-protocols.git --work-tree=. log -1 --format='%h %ad' --date=short -- <file>`.
- The tool repositories (`PickleTools`, `Rimworld-Release-Admin`, `Rimworld-Ticket-Dispatcher`) are
  repositories of their own: `git -C <folder> log -1`.
- This repository's own files: the commit that last touched them.
- **A document marked "modified" was read as it stood on disk, ahead of its last commit.** Its hash is
  given; a later commit that changes nothing else is not a reason to re-read it.

## What was read

| Document | Version read | Useful? | What matters for this mod | Re-read when |
|---|---|---|---|---|
| `AGENTS.md` | `3a1d2cb` 2026-09-24 | yes | the ordered gates (settings, then translations, then `preTest`); the evidence rules (latest report per scenario for the current revision, one text line per run in `docs/runs/`, never a folder, list before deleting); CI-only publishing | its hash `36631e73` moves; it is 46 lines |
| `AUDIT.md` | `c5ca0c0` 2026-09-26, **modified**, sha `449431a0`, mtime 2026-09-28 11:14 | **essential** | the chain and every gate; the absolute rules on RimWorld (never launch it, one deposit per pass); Pickle rules (passes, one pass per declared incompatibility asserting the symptom, `@requires`, `exitReason` first, evidence copies); `tested` needs no `@wip`, every conditional scenario played, no manual test left; "On ne teste pas le jeu"; the session title | its hash moves. It is long: read the Pickle bullets, steps 8 to 11 and the interpretation rules |
| `PUBLISHING.md` | `95c6dfd` 2026-09-28, then **modified by this mod's session**: a section on animal mods | yes, in parts | "Départ depuis le projet d'origine" (used, see below); the `(unofficial)` opening and suffix; the description order (`prepublished`); the packageId rule of 2026-09-27 (no `renew` in a new packageId); `Mod/` is uploaded unfiltered; the gallery folder; thanks comments; CI publishing | its hash `e16589ee` moves, or before `PUBLICATION.md` or a change note is written |
| `TRANSLATIONS.md` | `f5c2d9d` 2026-09-25 | little now | the gate is passed (`localization`, `translation_en`, `translation_fr` complete). Counts and plurals do not apply: no counted text | a player-facing text, a Def or a language file changes |
| `STYLE_RIMWORLD.md` | `7311308` 2026-09-25, **modified**, sha `2c6db323`, mtime 2026-09-27 21:24 | **little** | "ModIcon: control, not generation" and the file limits are applied. Image generation and the overlay palette do not apply: the images are done. Its convention names the un-lettered illustration `Art/Preview.png`; this repository calls it `Art/Preview-source.png` and its render scripts read that name | `Preview.png` or `ModIcon.png` is touched |
| `MOD_SETTINGS.md` | `b83933b` 2026-09-23 | yes, once | the `settings_audit` values and the `not_applicable` proof (no page, no shortcut); already recorded | options, persistence, UI or a shortcut are added |
| `WORKSHOP_COMMENTS.md` | `dea856b` 2026-09-28, **modified**, sha `6950daa5` | **not yet** | thanks comments belong to `prepublished`. Nothing in the register covers this mod: the original's page (2640466629) has no row, and Pickle and RimLogging would get this mod added to their `Covers` | before `PUBLICATION.md` is written |
| `scripts/SEARCHING.md` | `372c447` 2026-09-23, **modified**, sha `013075b0` | **no** | corpus search. The one search needed (does the original have a repository, who else defines these def names) was bounded and done with `gh` and the mod's own archive | a corpus-wide search is considered; the "keep an interactive machine interactive" rule always applies |
| `PickleTools/README.md` | `c771bef` 2026-09-25 | some | the table of shared step tools, for when the suite is written | a step is needed that Pickle lacks |
| `PickleTools/Headless/README.md` | `ed4e73a` 2026-09-26 | yes, in part | filter terms, one mod several passes, `-DepMap` incl. the `!` DLC lines, `-EvidenceDir`, the exit codes, the trailing newline a pass map needs | the launcher or the filters change. Read only "Choosing what to run", "One mod, several passes", "A pass without a DLC" |
| `PickleTools/docs/steps.md` | `96eda0f` 2026-09-28 | **no** | the steps of the PickleTools companions only; Pickle's own steps are in Pickle's catalogue. Nothing here is used yet | a PickleTools step is considered |
| `Rimworld-Release-Admin/docs/OPERATIONS.md` | `3c03f51` 2026-09-26 | from `prepublished` on | dry-run of the exact SHA, `publish` with the 40-character SHA, only the owner approves `steam-production`, tag and release created by the CI | before any workflow, tag, release or dry-run. Skip the credentials section |
| `Rimworld-Ticket-Dispatcher/docs/WELCOME.md` | `77ca9d7` 2026-09-27 | **essential** | deposit a request, never launch; one small ticket per fix, a full pass per validation; a request carries no SHA, so write it in `-Label`; the `desktop.ini` and `.ico` warning for `Mod/`; re-read the docs and note the versions | its hash `08b440a0` moves |
| `Rimworld-Ticket-Dispatcher/docs/SUBMIT.md` | `d07b2b8` 2026-09-26 | some | every option of `Submit-PickleRun.ps1`, the launcher exit codes | an option beyond `-Filter`, `-Language`, `-DepMap`, `-EvidenceDir` is needed |
| `STATUS.md` | `954e247`, then this session | mine | the source of truth for the stage and the remaining work | every stage change |
| `README.md` | `ed32e2b` | mine | | a def or a public claim changes |
| `CHANGELOG.md` | `954e247` | mine | `[1.0.0]` unreleased; **no `[0.1.0]` section, by design**: no `PublishedFileId.txt` exists, so no prepublication has happened | a prepublication or a publication |
| `ATTRIBUTION.md` | `954e247`, then this session | mine | the upstream-repository search and the other copy of the content were added 2026-09-28; both copies (root and `Mod/`) are byte-identical | a source is added |
| `TESTING.md` | `954e247`, then this session | mine | scenario L rewritten; the passes, the automation plan, the gates for `tested` and the evidence rules added | a scenario or a pass changes |
| `Mod/About/About.xml` | `ed32e2b` | mine | the description ends with the GitHub link; `incompatibleWith` lists the original | a description change |
| `docs/runs/` | this session | mine | one line so far, a static run | after each run |

**Read after the first pass, on 2026-09-28, to write the Pickle suite and the patches:**

| Document | Version read | Useful? | What matters for this mod | Re-read when |
|---|---|---|---|---|
| `PickleTools/Authoring/README.md` | `8d3ca6d` 2026-09-26 | **essential** | the layout of a suite, the pass matrix, the waits and their three timeouts, `ctx.Get` throwing, restart rules, "Read evidence before changing STATUS.md" | its hash `e620df7e` moves |
| `PickleTools/LoadAudit/README.md` | read 2026-09-28 | yes | the two load-audit steps, what they attribute to a mod and what they do not, that a warning about the test companion is blamed on the mod under test | the tool changes |
| `PickleTools/Headless/README.md` | `ed4e73a` 2026-09-26, read in full this time | yes | `path:` maps, `!` lines, the map that must end with a newline, `-Then`, the exit codes | the launcher changes |
| Pickle 4.9.1 itself | `RimWorks.Pickle.dll` sha256 `183e0d9e4885…` | **essential** | its 205 step expressions, read from the decompiled assemblies (there is no `Docs/` in the Workshop copy): kept in `Tests/Pickle/pickle-steps.txt` | Pickle changes; the offline check names the hash |

**Two things the documents say and the installed Pickle contradicts:** `an error matching {string} was logged` is named in `AUDIT.md`
and `Headless/README.md` and does not exist in 4.9.1 (another mod found the same on 2026-09-25); and the pawn and def steps have
limits that the guides do not state, written in `Tests/Pickle/README.md`.

**A trap of this machine, not of a document:** files written with the editor's write tool have CRLF line endings, and the WSL staging
reads the pass maps with a bash `read`, which keeps the `` in the Workshop id. The maps and features are converted to LF and
`.gitattributes` forces LF for them. Checked with `tr -cd '' | wc -c`: `grep -c $''` silently matches every line here.

**Named by the owner and not present in this repository:** `LICENSE`, `PUBLICATION.md`, `BACKLOG.md`,
`NOTES.md`, `BUGS.md`, `Tests/Pickle/`. Not created to fill a list. `LICENSE` is not expected: the
source states none and nothing of this repository's own is offered under one (see `ATTRIBUTION.md`).
`PUBLICATION.md` is required by `prepublished` and is still to be written. `Tests/Pickle/` is the
missing piece for `done`. The other two have no content to hold. The monorepo's `BACKLOG.md` was not
read, as asked.

**Not in the owner's list, and not read:** `PickleTools/Authoring/README.md` and Pickle's own step
catalogue. Both are the way in for writing the Pickle suite, which has not started.

## What this pass found

1. **`AUDIT.md` moved after the stage was set.** The stage `done`, set on 2026-09-13, predates a
   criterion of the current `AUDIT.md`: the Pickle (Gherkin) tests must be written, with their scope
   justified, before `done`. None exists here. The stage is `preTest` because of it, not because
   anything regressed.
2. **Scenario L tested the game.** It asked the player to open the mod list and expect the game's own
   incompatibility warning. `AUDIT.md` ("On ne teste pas le jeu") excludes that; the scenario now checks
   the declaration in the sources and one pass that looks at whether the incompatibility is still true.
3. **The recorded hash inventory was stale.** It disagreed with `About.xml` after the commit of
   2026-09-20. Regenerated, and now kept on disk only.
4. **A third-party pack defines the same defNames** and is not declared incompatible. Recorded in
   `STATUS.md` as an open decision.
5. **The `renew` rule for a new packageId (2026-09-27)** applies to a mod that is not yet published, and
   this one is not. Recorded in `STATUS.md` as an owner decision; nothing was renamed.
