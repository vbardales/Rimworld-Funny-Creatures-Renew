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
workflow_stage: playTests[1.0.0]
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
evidence: "Static checks, on disk only: evidence/static/. Pickle reports kept after the 2026-10-02 cleanup (14 MB, summary/junit/Player.log/captures only): Tests/Pickle/Evidence/{tools-en,tools-fr,core-only-en}-69a9e1a, avec-facultatifs-en-75a8a29 incompat-original-en-0034ce2 and engine-en-65d4e31 (git-ignored). What to keep and what to delete: TESTING.md, Evidence to keep. One line per run: docs/runs/README.md"
remaining:
  - unverified: "(playTests) pass 4 (incompat-original) is green since 0034ce2 (2 of 2, 2026-10-12, line 0034 of docs/runs/README.md); pass 4 has no @review capture. Pass 1/2 FR for the optional-mod scenarios: not played"
  - verified: "@review captures: the only one is manual--the-two-animals--step0, kept in three reports (tools-en, tools-fr, avec-facultatifs-en). All three opened 2026-10-13: both animals drawn and told apart, no raw key, no missing texture; FR UI labels render (Toxicomanie, Animaux, Faune)"
  - unverified: "(done -> tested) Python tests replayed 2026-10-12 under WSL (python3 + lxml 5.2.1, RIMWORLD_DIR set to the Steam folder): 36 run, 32 passed, 3 skipped, 1 failed. The failure is the map check of wsl-deps.incompat-original.map: _mods-sources/FunnyCreatures is gone (same cause as pass 4)"
  - unverified: "(done -> tested) the lines of TESTING.md marked proposed await the owner: scenarios D, E to K, M and O as not applicable, and pass 5 (core-only)"
  - unverified: "(done -> tested) existing-save migration: loading a save made with the original mod. No such save exists; stays listed as unverified, not a gate"
  - unverified: "(prepublished) PUBLICATION.md is drafted (2026-09-28) but nothing in it is final: the gallery is not produced, the mature-content answer waits for it, the description is not yet the single Markdown source that About.xml is generated from, and the rollback target is chosen only once a good run exists. About.xml has no IF I GO QUIET, AI-GENERATED or THANKS block yet"
  - unverified: "FR/EN in-game rendering of the translated text: raw keys, fallback, clipping or wrapping on the affected inspect strings, descriptions and tool/lifeStage labels, in both languages"
  - unverified: "(playTests) AUDIT.md 7.a names TEST_SCENARIOS.md; this mod keeps its scenarios A to U in TESTING.md, as the sibling mods do (AUDIT.md 'Les passes se declarent dans le TESTING.md'). Wording to confirm with the Audit session, no rename done"
  - unverified: "(playTests 8.m) code review: code_review_sha absent. Review from 0.1.0 once the code is stable and played, then store the 40-character sha"
  - unverified: "(playTests) Tests/test_mod.py and Tests/test_pickle_suite.py are listed in scripts/LOCAL_SCRIPTS.md with a justification; Virginie validates the table at the end"
social_preview_sha256: cea77506187882ce5ffa9a96d3c09cbe6b3acd5cf6e663d51232b4de56c00827
session:      local_15177fcc-4975-4f84-abde-09c0335fcf1a
updated: "2026-10-11: reaudit on the 2026-10-09 vocabulary. Dogs mate patched, French review validated by Virginie, stage playTests[1.0.0]. Journal folded into docs/runs/status-journal-2026-09-to-10.md. _tools and .build cleaned"
protocols_read_sha: e8f5738ee2228246ab626d3fd9ba5f9e1faf7cbf
---

# Funny Creatures Renew (unofficial): status

Current state only. Run lines: `docs/runs/README.md`. Older dated sections: `docs/runs/status-journal-2026-09-to-10.md`.

## Translation audit

French lives in `Mod/Languages/French/DefInjected` (20 owned fields, no Keyed, no plurals, no gender agreement: the texts do not follow a pawn). Reviewed by Virginie on 2026-10-11, revision `7ef4deb`, `FRENCH_REVIEW.md` generated from `8794640`: validated, corrections applied before (mégathérium for the megasloth, wool sentence). `translation_fr` is `complete`. In-game rendering (raw keys, clipping) stays `unverified` until `playTests`.

## Reaudit 2026-10-11

- **Stage: `playTests[1.0.0]`** since Virginie validated the French review (2026-10-11). The old `done` mapped to `playTests` by the indicative table, but gates 3.a and 4.f failed until Dogs mate (one of the four animal integrations, ANIMALS.md) was treated the same day. Target version `1.0.0`: `CHANGELOG.md` keeps `[1.0.0] unreleased` above `[0.1.0]` (prepublication, item 3811290892, private). The `stage` field is removed.
- **Gates re-read on disk.** 1: repository public, remote set, README, ATTRIBUTION, CHANGELOG, licence `silent` with the
  unofficial wording. 2: `Art/ModIcon-source.png`, `Mod/About/ModIcon.png` 128 x 128 (12 KB, below the 20 to 30 KB
  window: the owner's own resize, kept), `Art/Preview-source.png`, Preview 896 x 504. Not rechecked today: the palette
  and 268 px tests of 2.e (`scripts/Measure-Palette.sh`). 3: no build, no C#. 5: `settings_audit: not_applicable` holds
  (no page, no shortcut, no C#).
- **Dependencies and integrations (4.g), 2026-10-11.** No hard dependency (`modDependencies` empty, `loadAfter` Ludeon
  packages only, `loadBefore` ADS 2, `incompatibleWith` the original and the Storytime pack). No DLC used. The four animal
  mods, each a guarded optional patch in `Mod/Patches/`: A Dog Said... Animal Prosthetics 2, [XND] Nocturnal Animals
  (Continued), Better Crossbreeding, and **Dogs mate (Continued)** (new: the meffalo joins its group Bison with the
  muffalo, the boomsloth joins its group Boomalope; that mod has no megasloth group, so no megasloth pairing there).
- **Python tests replayed 2026-10-12** under WSL (36 run, 32 passed, 3 skipped, 1 failed: missing original archive, see remaining). Dogs mate test green.
- **Pass 3 played 2026-10-11** on `75a8a29` (request 9995): 23 passed, 0 failed, 2 skipped (need the original), `exitReason` passed; the `@review` capture opened. **`playTests` still to do** (8.a to 8.m): pass 4 is now green (0034ce2, 2 of 2, 2026-10-12: found on disk 2026-10-13, line 0034 of docs/runs/README.md),
  still to do: the code review (8.m). No ticket is queued.
- **Closing pass.** `_tools/` deleted, `.build/` renamed `build/` (ignored; `Directory.Build.props` repointed).
  `FRENCH_REVIEW.md` regenerated with the shared script. `Art/`: the old render files removed; `Art/Gallery/0-preview.png`
  is the byte copy of `Mod/About/Preview.png`.
- **Social preview (10.f), 2026-10-12:** uploaded through Chrome on Virginie's word ("fais le social preview"); `og:image` downloaded: 634,643 bytes, sha256 equal to `Mod/About/Preview.png`, recorded in `social_preview_sha256`. Preview approved by Virginie (render by the Audit workflow session).
- RimWorld was not launched, nothing was deposited.
