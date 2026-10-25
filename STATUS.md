---
localization: complete
translation_en: complete
translation_fr: complete
settings_audit: not_applicable
mod:          Funny Creatures Renew (unofficial)
packageId:    nelim.funnycreatures
repo:         Rimworld-Funny-Creatures-Renew
visibility:   public
detached:     yes
workflow_stage: shootGallery[1.0.0]
audit_revision: 1f60dac
licence:      silent
licence_at:   "Four places searched for a refusal rather than a permission (ATTRIBUTION.md). The Workshop page was re-read on 2026-09-28: description unchanged, no repository or licence wording, 1.3 only, last updated 30 October 2021. Its comments load by script and could not be read. No permission is inferred."
upstream_mod_remotes: N/A
dependencies: "none required; four optional integrations, all guarded patches (see Dependencies and integrations)"
showcase:     complete
build:        not_applicable
xml_audit:    complete
automated_tests: complete
pickle_scenarios: "written 2026-09-28: 12 features in Tests/Pickle/. Played 2026-09-28/29 (lines in docs/runs/README.md): tools EN and FR 16 passed / 13 skipped, core-only 3 of 3, avec-facultatifs EN 23 passed / 2 skipped (older tree), incompat-original EN 2 of 2 on 0034ce2 (first green pass 4, 2026-10-12). No @wip. 13 scenarios still skipped in the tools passes (they need optional mods). Plan and passes: TESTING.md and Tests/Pickle/README.md"
functional_tests: unverified
tested_on: "RimWorld 1.6 (headless WSL, Pickle 4.9.1): tools EN/FR 69a9e1a, core-only EN 69a9e1a, avec-facultatifs EN 75a8a29, incompat-original EN 0034ce2, engine features 13 to 17 EN 65d4e31. One line per run: docs/runs/README.md"
workshop:     "prepublished 0.1.0, private (Steam creates every item private). About/PublishedFileId.txt = 3811290892, found untracked on 2026-10-02 (dated 2026-10-01 14:40) and committed that day with CHANGELOG [0.1.0]. Not tested, not public: stage stays done. The original is Workshop 2640466629"
evidence: "Pickle proofs, on disk only, minified (278 KB, git-ignored): Tests/Pickle/Evidence/{tools-fr-69a9e1a,avec-facultatifs-fr-ddca0f1,avec-facultatifs-en-75a8a29,incompat-original-en-0034ce2,engine-en-65d4e31,core-only-en-b832dfe}, each with RELEASE.md (deletion condition). Inbox/ and Parked/ empty; avec-facultatifs-fr-ddca0f1 added 2026-10-25. Static checks regenerated on demand, not kept. One line per run: docs/runs/README.md"
remaining:
  - unverified: "(playTests) pass 4 (incompat-original) is green since 0034ce2 (2 of 2, 2026-10-12, line 0034 of docs/runs/README.md); pass 4 has no @review capture. Pass 1/2 FR for the optional-mod scenarios: not played"
  - unverified: "(playTests) ticket 5334 (avec-facultatifs FR, ddca0f1) read 2026-10-25: 40 passed, 5 failed = core-only features 09 and 11 played in the wrong set (not a defect), 2 skipped; line 5334 of docs/runs/README.md. Pass 1/2 FR of the optional-mod scenarios and FR rendering of the animal texts: proved. Not replayed FR: the 13 optional-mod scenarios of tools passes"
  - unverified: "(shootGallery) shotlist rewritten 2026-10-25 (section Shotlist below, header Tests/Pickle/Mod/Pickle/Features/18-the-gallery.feature): 7 shots plus an optional info card, series score 4. Scenarios 1 and 4 written and filed 2026-10-25: ticket 20261025-190030-978-61dd, tree e7bac9e, map wsl-deps.gallery.map, evidence Tests/Pickle/Inbox/gallery-1-4-e7bac9e. Keep Mod/ and Tests/Pickle untouched until RUN_DONE. Read summary.json and junit.xml, open both captures, give the verdict against the shotlist. Docs to fix after the run: the map header and README say -DepMap gallery, the request needs -DepMap wsl-deps.gallery.map. The other scenarios (2, 3, 5, 6, 7, optional 8) follow the verdict"
  - verified: "@review captures: the only one is manual--the-two-animals--step0, kept in three reports (tools-en, tools-fr, avec-facultatifs-en). All three opened 2026-10-13: both animals drawn and told apart, no raw key, no missing texture; FR UI labels render (Toxicomanie, Animaux, Faune)"
  - verified: "(playTests) Python tests replayed 2026-10-25 on Windows (uv run --with lxml, RIMWORLD_DIR set to the Steam folder): Tests/test_mod.py 25 passed, Tests/test_pickle_suite.py 12 passed, Check-DefInjected.ps1 20 keys 0 errors. The 2026-10-12 map failure is gone (pass 4 stages the original by Workshop id)"
  - verified: "(playTests) scenarios D, E to K, M and O are automated (features 13 to 17, 16 of 16 passed on 65d4e31, owner decision 2026-10-13). Pass 5 (core-only) is optional, not a required pass (owner, 2026-10-25); its green run core-only-en-b832dfe stays as extra proof"
  - unverified: "(done -> tested) existing-save migration: loading a save made with the original mod. No such save exists; stays listed as unverified, not a gate"
  - unverified: "(prepublished) PUBLICATION.md is drafted (2026-09-28) but nothing in it is final: the gallery is not produced, the mature-content answer waits for it, the description is not yet the single Markdown source that About.xml is generated from, and the rollback target is chosen only once a good run exists. About.xml has no IF I GO QUIET, AI-GENERATED or THANKS block yet"
  - unverified: "FR/EN in-game rendering of the translated text: raw keys, fallback, clipping or wrapping on the affected inspect strings, descriptions and tool/lifeStage labels, in both languages"
  - unverified: "(playTests) AUDIT.md 7.a names TEST_SCENARIOS.md; this mod keeps its scenarios A to U in TESTING.md, as the sibling mods do (AUDIT.md 'Les passes se declarent dans le TESTING.md'). Wording to confirm with the Audit session, no rename done"
  - unverified: "(test hardening, 8.m review 2026-10-15, none blocks) done 2026-10-18: Dogs mate checked against the installed mod, name check covers Dogs mate (25 tests pass with lxml + Workshop path). Left as designed: test_mod.py Dessicated skips N/S/E (Pickle 17 covers it); FunnyCreaturesSteps.cs negative crossbreeding steps pass on an absent list (intended without the optional mod)"
  - unverified: "(playTests) Tests/test_mod.py and Tests/test_pickle_suite.py are listed in scripts/LOCAL_SCRIPTS.md with a justification; Virginie validates the table at the end"
social_preview_sha256: cea77506187882ce5ffa9a96d3c09cbe6b3acd5cf6e663d51232b4de56c00827
code_review_sha: 281289d86a12cf53517afcd45092ccea5c75c10c
session:      local_15177fcc-4975-4f84-abde-09c0335fcf1a
updated: "2026-10-25: playTests closed (passes 1 to 4 green, features 13 to 17 played, ticket 5334 FR read, Python tests and code review 8.m done, Preview validated by Virginie). Stage shootGallery[1.0.0]. Pass 5 core-only optional"
protocols_read_sha: 65f1477c389ca6e741af05b7745aa30f6b26b595
---
# Funny Creatures Renew (unofficial): status

Current state only. Run lines: `docs/runs/README.md`. Older dated sections: `docs/runs/status-journal-2026-09-to-10.md`.

## Translation audit

French in `Mod/Languages/French/DefInjected` (20 owned fields, no Keyed, no plurals, no gender agreement: texts do not follow pawn). Virginie reviewed 2026-10-11, revision `7ef4deb`, `FRENCH_REVIEW.md` generated from `8794640`: validated, corrections applied before (mégathérium for megasloth, wool sentence). Re-read and validated by Virginie 2026-10-18, `FRENCH_REVIEW.md` from `c3cade8` (ChatGPT review applied: Meffalo.description wording, English def typos). `translation_fr` `complete`. In-game rendering (raw keys, clipping) stays `unverified` until `playTests`.

## Reaudit 2026-10-11

- **Stage: `playTests[1.0.0]` until 2026-10-25, then `shootGallery[1.0.0]`** since Virginie validated French review (2026-10-11). Old `done` mapped to `playTests` by indicative table, but gates 3.a and 4.f failed until Dogs mate (one of four animal integrations, ANIMALS.md) treated same day. Target version `1.0.0`: `CHANGELOG.md` keeps `[1.0.0] unreleased` above `[0.1.0]` (prepublication, item 3811290892, private). `stage` field removed.
- **Gates re-read on disk.** 1: repository public, remote set, README, ATTRIBUTION, CHANGELOG, licence `silent` with unofficial wording. 2: `Art/ModIcon-source.png`, `Mod/About/ModIcon.png` 128 x 128 (12 KB, below 20 to 30 KB window: owner's own resize, kept), `Art/Preview-source.png`, Preview 896 x 504. Not rechecked today: palette and 268 px tests of 2.e (`scripts/Measure-Palette.sh`). 3: no build, no C#. 5: `settings_audit: not_applicable` holds (no page, no shortcut, no C#).
- **Dependencies and integrations (4.g), 2026-10-11.** No hard dependency (`modDependencies` empty, `loadAfter` Ludeon packages only, `loadBefore` ADS 2, `incompatibleWith` original and Storytime pack). No DLC used. Four animal mods, each guarded optional patch in `Mod/Patches/`: A Dog Said... Animal Prosthetics 2, [XND] Nocturnal Animals (Continued), Better Crossbreeding, **Dogs mate (Continued)** (new: meffalo joins its group Bison with muffalo, boomsloth joins its group Boomalope; mod has no megasloth group, so no megasloth pairing there).
- **Python tests replayed 2026-10-12** under WSL (36 run, 32 passed, 3 skipped, 1 failed: missing original archive, see remaining). Dogs mate test green.
- **Pass 3 played 2026-10-11** on `75a8a29` (request 9995): 23 passed, 0 failed, 2 skipped (need original), `exitReason` passed; `@review` capture opened. **`playTests` still to do** (8.a to 8.m): pass 4 now green (0034ce2, 2 of 2, 2026-10-12: found on disk 2026-10-13, line 0034 of docs/runs/README.md), still to do: code review (8.m). No ticket queued.
- **Closing pass.** `_tools/` deleted, `.build/` renamed `build/` (ignored; `Directory.Build.props` repointed). `FRENCH_REVIEW.md` regenerated with shared script. `Art/`: old render files removed; `Art/Gallery/0-preview.png` is byte copy of `Mod/About/Preview.png`.
- **Social preview (10.f), 2026-10-12:** uploaded through Chrome on Virginie's word ("fais le social preview"); `og:image` downloaded: 634,643 bytes, sha256 equal to `Mod/About/Preview.png`, recorded in `social_preview_sha256`. Virginie approved preview (render by Audit workflow session).
- RimWorld not launched, nothing deposited.
- **Code review (8.m), 2026-10-15,** `Mod/`, `Tests/Pickle/Source/`, `Tests/*.py` from first commit (no tag): no defect. XML, About fields, four patch guards, 1.6 race forms, French DefInjected keys (20 of 20 resolve, `Check-DefInjected.ps1`) clean. One text defect fixed: About.xml said three optional patches, now four with Dogs mate line (description text only, 8.m exception). Four test-hardening points listed in `remaining`. `code_review_sha` is commit of that fix.- **Preview revalidated, 2026-10-25:** Virginie validated the Preview regenerated from her new `Art/Preview.config.json` (panel/icon schema, badge bottom-right), commit `7793a71`. GitHub social preview not yet re-uploaded: `social_preview_sha256` stale until she asks.
- **Code review (8.m), 2026-10-25,** `8bd40802..281289d` (Opus sub-agent, three description-text edits in Mod/, one French line, one test): no defect. `code_review_sha` moved to 281289d. Left outside the diff: older English wording in descriptions ("Also;", "nice feeling pelt"), not a defect.

## Shotlist (2026-10-25, full header in Tests/Pickle/Gallery/18-the-gallery.feature)

Story "The herd that was not on the map": one day, Nelim only (no other colonist), same outfit all day (trousers, corset, ochre jacket, bun, no hat), 07, 08, 09, 11, 15, 15, 19, clear. Series (k): wide opening 1, mediums 2 4 5 6, tight 3, quiet closing 7, one face-on animal in 4.

| # | a time | b decor | c living | d pawns | e instant (how) | f composition | g, j subject and 268 px | est | main risk |
|---|---|---|---|---|---|---|---|---|---|
| 1 | pen, 07, 60 ticks + walk | daylily, laying boxes | meffalo at gate | Nelim ochre jacket, smirk | before they meet (forced walk, paused) | wide, zoom 11, off-centre | Nelim and a big animal at a gate | 4 | walk-and-pause on an animal not played |
| 2 | pen, 08 | short straw | meffalo calf, boomsloth calf, adult | Nelim small, smile | calves mid-trot (forced walks, paused) | medium, zoom 7 to 8, corner | two calves, one is a fuse | 4 | calves too small |
| 3 | water-garden, 09 | ducks, pond | meffalo | none | mid-stride on the bank (forced walk) | tight, zoom 5 | the dark coat by the water | 4 | geyser steam in frame |
| 4 | bare-clearing, 11 | bare earth | boomsloth face-on, meffalo behind | none | boomsloth mid-stride toward camera | medium, zoom 5 | two animals meet | 4 | facing on a paused capture |
| 5 | bare-clearing, 15 | bare earth | boomsloth facing her | Nelim, BrowRaised, turned to it | she has just turned back (walk, faces) | wider, zoom 6 | distance and a fuse | 4 | Nelim facing wrong |
| 6 | same minute as 5 | bare earth | boomsloth killed | Nelim unhurt, 7 cells | flame at its widest (kill, N ticks) | frame of 5 | Boom | 4 | missed flame frame |
| 7 | pen, 19 | StickLantern lit, daylily | meffalo lying, calf asleep | Nelim, smile | she has just stopped (walk, paused) | frame of 1, dusk | quiet pen, sleeping fuse | 4 | lying pose paused |
| 8 | optional card on window-backdrop-for-height | n/a | n/a | n/a | n/a | cropped, no subtitle | info card, wildness 97 | not scored | info-card step on an animal |

Series score 4 (every cell filled, no missing step: NPT confirmed on 2026-10-25 forced walk, `faces`, `lies at`, pause, info card; none is played on a capture of this mod). Director pass (Opus) kept: 07 not 06, pen in the morning then water then clearing then pen, third place `water-garden`, `bare-clearing` instead of `emerald-clearing`, closer zoom for calves, the boomsloth calf asleep at dusk, a face-on animal in 4. Not kept: grazing and drinking (steps unproven), Nelim crouched in 4 (no step), door held open (gate dropped, Nelim stops at it). Estimates become verdicts after the run.
