---
localization: complete
translation_en: complete
translation_fr: partial
settings_audit: not_applicable
mod:          Funny Creatures Renew (unofficial)
packageId:    nelim.funnycreatures
repo:         Rimworld-Funny-Creatures-Renew
visibility:   public
detached:     yes
workflow_stage: playTests[1.0.0]
audit_revision: 1f60dac
licence:      silent
licence_at:   "Four places searched for a refusal rather than a permission (ATTRIBUTION.md). The Workshop page was re-read on 2026-09-28: description unchanged, no repository or licence wording, 1.3 only, last updated 30 October 2021. Its comments load by script and could not be read. No permission is inferred."
upstream_mod_remotes: N/A
dependencies: none
showcase:     complete
build:        not_applicable
xml_audit:    complete
automated_tests: complete
pickle_scenarios: "written 2026-09-28: 12 features in Tests/Pickle/. Played 2026-09-28/29 (lines in docs/runs/README.md): tools EN and FR 16 passed / 13 skipped, core-only 3 of 3, avec-facultatifs EN 23 passed / 2 skipped (older tree), incompat-original never green (1 of 2 on 0b29ed3, then could not stage). No @wip. 13 scenarios still skipped in the tools passes (they need optional mods), 10-the-original-mod not green, no @review capture opened. Plan and passes: TESTING.md and Tests/Pickle/README.md"
functional_tests: unverified
tested_on:
workshop:     "prepublished 0.1.0, private (Steam creates every item private). About/PublishedFileId.txt = 3811290892, found untracked on 2026-10-02 (dated 2026-10-01 14:40) and committed that day with CHANGELOG [0.1.0]. Not tested, not public: stage stays done. The original is Workshop 2640466629"
evidence: "Static checks, on disk only: evidence/static/. Pickle reports kept after the 2026-10-02 cleanup (14 MB, summary/junit/Player.log/captures only): Tests/Pickle/Evidence/{tools-en,tools-fr,core-only-en}-69a9e1a, avec-facultatifs-en-0b29ed3 and incompat-original-en-0b29ed3 (git-ignored). What to keep and what to delete: TESTING.md, Evidence to keep. One line per run: docs/runs/README.md"
remaining:
  - unverified: "(done -> tested) pass 3 (avec-facultatifs) must be replayed on the final tree: its only report (28b4) predates 69a9e1a. Pass 4 (incompat-original, scenario 10) has never been green: 0b29ed3 failed on a wrong assumption (rewritten, not replayed), 6af5 could not stage because _mods-sources/FunnyCreatures is gone. Pass 1/2 FR for the optional-mod scenarios: not played"
  - unverified: "(done -> tested) the @review captures of every pass have not been opened; no green run proves what an image shows"
  - unverified: "(done -> tested) Tests/test_mod.py and Tests/test_pickle_suite.py were not fully replayed on 2026-10-02: Windows has no Python, WSL has none of lxml or a game folder. Last full green: 0b29ed3 (23 and 12)"
  - feature: "(Dogs mate (Continued), Mlie.DogsMate 2441132298, PUBLISHING.md rule of 2026-10-01) not treated. The muffalo is in its group Bison (pawnKinds Bison, Muffalo): the meffalo probably belongs there. Boomsloth: group to read from the megasloth's entry. Either patch it (guarded, optional) or write in this file why not. Not done by the audit, which creates nothing"
  - unverified: "(done -> tested) the lines of TESTING.md marked proposed await the owner: scenarios D, E to K, M and O as not applicable, and pass 5 (core-only)"
  - unverified: "(done -> tested) existing-save migration: loading a save made with the original mod. No such save exists; stays listed as unverified, not a gate"
  - unverified: "(prepublished) PUBLICATION.md is drafted (2026-09-28) but nothing in it is final: the gallery is not produced, the mature-content answer waits for it, the description is not yet the single Markdown source that About.xml is generated from, and the rollback target is chosen only once a good run exists. About.xml has no IF I GO QUIET, AI-GENERATED or THANKS block yet"
  - unverified: "French review by Virginie (TRANSLATIONS.md 2026-09-30). FRENCH_REVIEW.md regenerated 2026-10-02 (heading now names the mod, revision 954e247), all 20 keys resolved; translation_fr stays partial until she has read it"
  - unverified: "FR/EN in-game rendering of the translated text: raw keys, fallback, clipping or wrapping on the affected inspect strings, descriptions and tool/lifeStage labels, in both languages"
  - defect: "(playTests) writeTests 7.a asks for TEST_SCENARIOS.md; the scenarios A to Q live in TESTING.md. Rename or point, to be settled with the Audit session"
  - unverified: "(playTests 8.m) code review: code_review_sha absent. Review from 0.1.0 once the code is stable and played, then store the 40-character sha"
  - unverified: "(playTests) Tests/test_mod.py and Tests/test_pickle_suite.py are listed in scripts/LOCAL_SCRIPTS.md with a justification; Virginie validates the table at the end"
session:      local_15177fcc-4975-4f84-abde-09c0335fcf1a
updated: "2026-10-11: reaudit on the 2026-10-09 vocabulary. done became playTests[1.0.0]. Journal folded into docs/runs/status-journal-2026-09-to-10.md. _tools/Generate-FrenchReview.ps1 replaced by the shared scripts/Make-FrenchReview.ps1"
protocols_read_sha: e520c40709f1a348a71e4409673c97e5f6baee93
---

# Funny Creatures Renew (unofficial): status

Current state only. Run lines: `docs/runs/README.md`. Older dated sections: `docs/runs/status-journal-2026-09-to-10.md`.

## Reaudit 2026-10-11

- **Stage.** `done` maps to `playTests` (AUDIT.md, correspondence table). Target version `1.0.0`: `CHANGELOG.md` keeps
  `[1.0.0] unreleased` above `[0.1.0]` (the prepublication, item 3811290892, private). The `stage` field is removed.
- **Exit criteria of `writeTests` (AUDIT.md 7.a to 7.i), re-read.** Pickle suite written, scope justified, automated and
  XML tests written, `localization` and `translation_en` complete. Not met: `translation_fr` is `partial` until Virginie
  reads `FRENCH_REVIEW.md` (6.g, 7.g), and the scenario file is called `TESTING.md`, not `TEST_SCENARIOS.md` (7.a). The
  2026-10-02 audit held `done`; under the new chain these two keep `playTests` open until settled.
- **`playTests` still to do** (8.a to 8.m): replay pass 3 (avec-facultatifs) on the final tree, play pass 4 (incompat-original,
  never green), open the `@review` captures, deploy, then the code review (8.m). Pickle tickets: one per not-yet-green scenario,
  small, none for the green ones (AUDIT.md, "Ordre des passes"). No ticket is queued yet.
- **Dogs mate** (PUBLISHING.md, animals): not treated, kept in `remaining`.
- **Closing pass.** `_tools/Generate-FrenchReview.ps1` deleted, `FRENCH_REVIEW.md` regenerated with the shared script
  (it now fills the lifeStages rows and adds the "Review line (Virginie only)" table). `Art/`: the three old render files
  removed (the shared renderer reads `Art/Preview.config.json`), `Art/Gallery/0-preview.png` is the byte copy of
  `Mod/About/Preview.png`.
- RimWorld was not launched, nothing was deposited.
