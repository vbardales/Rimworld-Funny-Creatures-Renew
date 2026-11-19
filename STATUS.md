---
localization: complete
translation_en: complete
translation_fr: complete
settings_audit: not_applicable
ecosystem_line: 1.0
mod:          Funny Creatures Renew (unofficial)
packageId:    nelim.funnycreatures
repo:         Rimworld-Funny-Creatures-Renew
visibility:   public
detached:     yes
workflow_stage: localize[1.0.0]
audit_revision: 1f60dac
licence:      silent
licence_at:   "Four places searched for a refusal rather than a permission (ATTRIBUTION.md). The Workshop page was re-read on 2026-09-28: description unchanged, no repository or licence wording, 1.3 only, last updated 30 October 2021. Its comments load by script and could not be read. No permission is inferred."
upstream_mod_remotes: N/A
dependencies: "none required; four optional integrations, all guarded patches (see Dependencies and integrations)"
showcase:     complete
build:        not_applicable
xml_audit:    complete
automated_tests: complete
pickle_scenarios: "written 2026-09-28: 12 features in Tests/Pickle/. Played 2026-09-28/29 (lines in Docs/runs/pickle.md): tools EN and FR 16 passed / 13 skipped, core-only 3 of 3, avec-facultatifs EN 23 passed / 2 skipped (older tree), incompat-original EN 2 of 2 on 0034ce2 (first green pass 4, 2026-10-12). No @wip. 13 scenarios still skipped in the tools passes (they need optional mods). Plan and passes: TESTING.md and Tests/Pickle/README.md"
functional_tests: unverified
tested_on: "RimWorld 1.6 (headless WSL, Pickle 4.9.1): tools EN/FR 69a9e1a, core-only EN 69a9e1a, avec-facultatifs EN 75a8a29, incompat-original EN 0034ce2, engine features 13 to 17 EN 65d4e31. One line per run: Docs/runs/pickle.md"
workshop:     "prepublished 0.1.0, private (Steam creates every item private). About/PublishedFileId.txt = 3811290892, found untracked on 2026-10-02 (dated 2026-10-01 14:40) and committed that day with CHANGELOG [0.1.0]. Not tested, not public: stage stays done. The original is Workshop 2640466629"
evidence: "Pickle proofs, on disk only, minified (278 KB, git-ignored): Tests/Pickle/Evidence/{tools-fr-69a9e1a,avec-facultatifs-fr-ddca0f1,avec-facultatifs-en-75a8a29,incompat-original-en-0034ce2,engine-en-65d4e31,core-only-en-b832dfe}, each with RELEASE.md (deletion condition). Inbox/ and Parked/ empty; avec-facultatifs-fr-ddca0f1 added 2026-10-25. Static checks regenerated on demand, not kept. One line per run: Docs/runs/pickle.md"
remaining:
  - defect: "(localize 6.g, 6.h, 6.i) replay 2026-11-19: Virginie's last French validation is 2026-10-18 (revision c3cade8); the French changed on 2026-11-14 (1a24126 chemfuel, f7c7861 Boomsloth becomes boomtherium, 79a7052 PawnKindDef label) after three ChatGPT reviews, and the Translation audit section does not record them. Write the section (reviews, refusals in Docs/review-refusals.md, names in Docs/review-names.md, revision 79a7052), then Virginie re-validates TRANSLATION_REVIEW.md. Gallery (shots 1, 5, 6, 7 REDO) resumes after"
  - unverified: "(playTests) pass 4 (incompat-original) is green since 0034ce2 (2 of 2, 2026-10-12, line 0034 of Docs/runs/pickle.md); pass 4 has no @review capture. Pass 1/2 FR for the optional-mod scenarios: not played"
  - unverified: "(playTests) ticket 5334 (avec-facultatifs FR, ddca0f1) read 2026-10-25: 40 passed, 5 failed = core-only features 09 and 11 played in the wrong set (not a defect), 2 skipped; line 5334 of Docs/runs/pickle.md. Pass 1/2 FR of the optional-mod scenarios and FR rendering of the animal texts: proved. Not replayed FR: the 13 optional-mod scenarios of tools passes"
  - unverified: "(shootGallery) recompose shots 1, 5, 6, 7 (REDO after run d1ae 2026-11-19), rewrite their scenarios, Check-ShotlistVsScenario, one ticket; section Gallery state below. Resumes after localize closes. Evidence prune NOT applied (it minifies gallery captures; owner held). social_preview_sha256 stale until she asks for the re-upload"
  - verified: "(playTests 7.d) @requires of 18-the-gallery.feature added 2026-11-03 after RUN_DONE c569, Check-Steps no REQUIRES line"
  - verified: "(resume 2026-11-03, step 7b) Preview re-rendered 2026-11-09 from config 76348cf with the icon bottom-left (`node ../scripts/Render-Preview.cjs bottom-left`, corner is a command argument, not a config key), echo no longer overlaps the copy; validated by Virginie 2026-11-09 (\"je valide cette préview\"), committed. social_preview_sha256 stale until she asks for the re-upload"
  - unverified: "(TM request 2026-11-03) evidence move: Evidence/ and evidence/ are one folder (case-insensitive), Kept/ absent, nothing to move. Prune-Evidence dry run: gallery-1-4-44176f2 GREEN, -Apply would minify captures to JPEG 1280 px q70 (loses gallery source): NOT applied, owner to decide"
  - verified: "@review captures: the only one is manual--the-two-animals--step0, kept in three reports (tools-en, tools-fr, avec-facultatifs-en). All three opened 2026-10-13: both animals drawn and told apart, no raw key, no missing texture; FR UI labels render (Toxicomanie, Animaux, Faune)"
  - verified: "(playTests) Python tests replayed 2026-10-25 on Windows (uv run --with lxml, RIMWORLD_DIR set to the Steam folder): Tests/test_mod.py 25 passed, Tests/test_pickle_suite.py 12 passed, Check-DefInjected.ps1 20 keys 0 errors. The 2026-10-12 map failure is gone (pass 4 stages the original by Workshop id)"
  - verified: "(playTests) scenarios D, E to K, M and O are automated (features 13 to 17, 16 of 16 passed on 65d4e31, owner decision 2026-10-13). Pass 5 (core-only) is optional, not a required pass (owner, 2026-10-25); its green run core-only-en-b832dfe stays as extra proof"
  - unverified: "(done -> tested) existing-save migration: loading a save made with the original mod. No such save exists; stays listed as unverified, not a gate"
  - unverified: "(prepublished) PUBLICATION.md is drafted (2026-09-28) but nothing in it is final: the gallery is not produced, the mature-content answer waits for it, the description is not yet the single Markdown source that About.xml is generated from, and the rollback target is chosen only once a good run exists. About.xml has no IF I GO QUIET, AI-GENERATED or THANKS block yet"
  - unverified: "FR/EN in-game rendering of the translated text: raw keys, fallback, clipping or wrapping on the affected inspect strings, descriptions and tool/lifeStage labels, in both languages"
  - unverified: "(playTests) AUDIT.md 7.a names TEST_SCENARIOS.md; this mod keeps its scenarios A to U in TESTING.md, as the sibling mods do (AUDIT.md 'Les passes se declarent dans le TESTING.md'). Wording to confirm with the Audit session, no rename done"
  - unverified: "(test hardening, 8.m review 2026-10-15, none blocks) done 2026-10-18: Dogs mate checked against the installed mod, name check covers Dogs mate (25 tests pass with lxml + Workshop path). Left as designed: test_mod.py Dessicated skips N/S/E (Pickle 17 covers it); FunnyCreaturesSteps.cs negative crossbreeding steps pass on an absent list (intended without the optional mod)"
  - unverified: "(playTests) Tests/test_mod.py and Tests/test_pickle_suite.py are listed in scripts/LOCAL_SCRIPTS.md with a justification; Virginie validates the table at the end"
  - verified: "(shootGallery) social preview re-uploaded through Chrome 2026-10-26 on Virginie's word: og:image downloaded, 632,881 bytes, sha256 equal to Mod/About/Preview.png (7793a71), recorded in social_preview_sha256. Pass 5 core-only is optional (owner, 2026-10-25)"
social_preview_sha256: 500e5b43ad1a96181744407ce9fd048b5177134c3c713f7ab7674f91f00deab6
code_review_sha: 281289d86a12cf53517afcd45092ccea5c75c10c
session:      local_83fc0db0-2211-460b-b677-85a81a6ea0d6
updated: "2026-11-19 replay-audit 2: declareDependencies -> localize (4.b 4.e 4.g closed by OptionalCompat.xml, first open 6.g: French changed 2026-11-14 after the last validation). 2026-11-19 replay-audit: shootGallery -> declareDependencies (first open 4.b: OptionalCompat.xml absent, 4.e Check-OptionalCompat 3 ERROR, 4.g). 2026-10-31 replay-audit: stage unchanged, first open 9.a (no accepted capture, ticket c569 queued for shots 1 and 4). 2026-10-25: playTests closed (passes 1 to 4 green, features 13 to 17 played, ticket 5334 FR read, Python tests and code review 8.m done, Preview validated by Virginie). Stage shootGallery[1.0.0]. Pass 5 core-only optional"
protocols_read_sha: f785c237a47053df152ee0b4e1214bf3350151ab
---
# Funny Creatures Renew (unofficial): status

Current state only. Run lines: `Docs/runs/pickle.md`. Older dated sections: git history.

## Ecosystem

PiI, 2026-11-14 (`docs/inventory/ecosystem-steam/FunnyCreaturesRenew.md`, protocols 90bb313): original Funny Creatures 2640466629 (1.3, October 2021, not on disk, packageId unknown). Meffalo and boomsloth exist nowhere else on Steam: no fork, no port, no mod shares our 8 defNames. Only neighbours, different mods: generic explode-on-death mods 2920429368 and 3199977918, Milkable Muffalo 2019852283. Nothing subscribed. The 5 old rows for this mod in `ecosystem.tsv` (TF2 Sandvich etc.) are noise.

PiI refresh 2026-11-19 (delta since 2026-11-14, same file, links block added): original 2640466629 unchanged (1.3, 2021-10-30); `meffalo` and `boomsloth` still return only the original; no fork, port, patch or duplicate of ours. New-looking names unrelated (Creatures of the Vael 3568419088, ISEKAI CREATURES ADD-ON 3757560461); other muffalo mods seen, no shared def checked. Verdict unchanged: our Renew is the only Funny Creatures for 1.6. Links: parent 2640466629, linked 2019852283, 1885527800, 2920429368, 3199977918.

## Translation audit

French in `Mod/Languages/French/DefInjected` (20 owned fields, no Keyed, no plurals, no gender agreement: texts do not follow pawn). Virginie validated 2026-10-11 (revision `7ef4deb`) and 2026-10-18 (`FRENCH_REVIEW.md` from `c3cade8`). Three ChatGPT reviews on 2026-11-14 changed texts after that: `1a24126` (English wording of four descriptions, French `chemfuel` kept as in core, Steam text), `f7c7861` (Boomsloth becomes boomthérium, names decided in `Docs/review-names.md`), `79a7052` (PawnKindDef label, Steam text); four refused proposals in `Docs/review-refusals.md`. `TRANSLATION_REVIEW.md` generated from `79a7052`. `Check-Translations` PASS and `Check-DefInjected` 20 keys, 0 errors (2026-11-19). `translation_fr` `complete` rests on the 2026-10-18 validation; Virginie's validation of the 2026-11-14 changes is awaited (6.g). In-game rendering (raw keys, clipping) stays `unverified` until `playTests`.

## Dependencies and integrations (4.g)

- **Dependencies and integrations (4.g), 2026-10-11.** No hard dependency (`modDependencies` empty, `loadAfter` Ludeon packages only, `loadBefore` ADS 2, `incompatibleWith` original and Storytime pack). No DLC used. Four animal mods, each guarded optional patch in `Mod/Patches/`: A Dog Said... Animal Prosthetics 2, [XND] Nocturnal Animals (Continued), Better Crossbreeding, **Dogs mate (Continued)** (new: meffalo joins its group Bison with muffalo, boomsloth joins its group Boomalope; mod has no megasloth group, so no megasloth pairing there).
- **OptionalCompat.xml (4.b, 4.e, 4.g), 2026-11-19.** `Mod/About/OptionalCompat.xml` created with `Check-OptionalCompat.ps1 -Write`: DizzyEevee.BetterCrossbreeding (3520675842), Mlie.DogsMate (2441132298), Mlie.XNDNocturnalAnimals (2269731409), kind patch each. A Dog Said... Animal Prosthetics 2 (SamBucher.ADogSaidAnimalProsthetics2, 3238353862) is not listed: it is ordered by `loadBefore` in About.xml, so the check counts it as ordered. Check-OptionalCompat OK (3 patched targets, 3 declared), Check-ModBasics PASS. Not a code change (AUDIT.md 8.m exception), `code_review_sha` untouched. Next: replay.

## Shotlist (2026-10-25, full header in Tests/Pickle/Gallery/18-the-gallery.feature)

Story "The herd that was not on the map": one day, Nelim only (no other colonist), same outfit all day (trousers, corset, ochre jacket, high ponytail `Roo_HD_Hair_Highpony`, no hat), 07, 08, 09, 11, 15, 15, 19, clear. Series (k): wide opening 1, mediums 2 4 5 6, tight 3, quiet closing 7, one face-on animal in 4.

| # | a time | b decor | c living | d pawns | e instant (how) | f composition | g, j subject and 268 px | est | main risk |
|---|---|---|---|---|---|---|---|---|---|
| 1 | pen, 07, clear, 60 ticks + walk | pale `Plant_YellowTallGrass` 3 x 3 under the meffalo, `Plant_Daylily` along the fence, two lit braziers, laying boxes | adult meffalo at (160, 209) by the gate, no other animal within 10 cells | Nelim ochre jacket, trousers, corset, high ponytail, smile, three-quarter, walks east to (156, 209) | before they meet (forced walk, `faces`, `I let 20 ticks pass`, paused) | opening, rectangle 14 x 8 centred on the gate (159, 207), zoom ~6, Nelim left, meffalo right within 4 cells of the gate | Nelim about 38 px at 268 px, big black animal at a gate | 4.5 | meffalo cell on pale grass, clear of bamboo; clear radius |
| 2 | pen, 08, 60 ticks + walks | `Plant_YellowTallGrass` fully grown at (153,212), (155,215), (154,217), pen laying boxes `EggBox` kept | meffalo calf, boomsloth calf, adult meffalo | none (Nelim dropped from this shot) | herd moves out at first sun: calves just started to follow, about to pass the boxes (adult walks, `I let 15 ticks pass`, calves walk, `I let 30 ticks pass`, paused) | medium-tight, rectangle (143,210)-(154,216), 11 x 6 cells, zoom ~3, calves in front, adult cut at the right edge | two calves follow their mother; each calf about 1 cell of 11, about 24 px at 268 px | 4 | calves still small at 268 px |
| 3 | water-garden, 09, clear | lily pads, willows (171, 162), (165, 162), reeds (168, 163), pale dry bank grass, two `Duck` at the edge | meffalo, one duck startled, no other animal within 12 cells | none | it has just left the water, a duck startled (forced walk, `I let 15 ticks pass`, paused) | tight, zoom 5, centre (151, 172), burrow (149, 173) out | the black coat by the water | 4.5 | strays in frame (`the animal {string} is despawned`), grey fog |
| 4 | calm-zone (cream square), 11, clear | ring of six `Plant_Daylily` fully grown around the pair, the two monuments to the right | boomsloth face-on at (201, 186), meffalo behind left at (198, 189) | none | they have just seen the camera (forced walk, `faces`, `I let 20 ticks pass`, paused) | medium, rectangle 12 x 7 on the pair near (200, 187), at most 4 cells apart, zoom ~5 | two animals meet on pale ground | 4.5 | beige boomsloth pale on cream, facing held |
| 5 | bare-clearing, 15 | `Plant_Daylily` fully grown at (186,155), (186,147), (204,155), (204,147), 9 cells or more from the boomsloth, same in 6 | boomsloth facing her | Nelim at (188,150), BrowRaised, turned to it | she has just turned back (walk, faces) | wider, zoom 6, centre (195,152) | distance and a fuse | 4.5 | Nelim facing wrong |
| 6 | same minute as 5, same frame | same four daylilies as 5, unburnt (outside the 4.9 radius), removed after | boomsloth killed | Nelim at (188,150), 7.3 cells, unhurt, brows raised + `LidSquinting` set after her own face, expression last, same outfit | first half second after the kill: flame ring at its widest, corpse gone (kill, `I let 6 ticks pass`, paused; tick settled by the film scenario `6x-boom-film`, not a gallery image) | frame of 5 | Boom | 4 | blast tick, fire spread |
| 7 | pen, 19, dimmed light (value to settle with NPT) | pale `Plant_YellowTallGrass` 3 x 3 under the pair, bamboo hidden near them, fire bowls hidden, lit `DR_StickLantern` at (163, 210), three daylilies | meffalo lying at (159, 209), boomsloth calf lying at (161, 209), both facing West | Nelim 4 cells from the meffalo, smile | she has just stopped (walk, paused) | frame of 1, dusk | quiet pen, sleeping fuse | 5 by the rule (run 12dc: image 2.5, REDO) | dusk not visible (sun glow 0.4 not played), brazier defName unknown (list step logs it), cells |
| 8 | optional card on window-backdrop-for-height | n/a | n/a | n/a | n/a | cropped, no subtitle | info card, wildness 97 | not scored | info-card step on an animal |

Series score 4 (every cell filled, no missing step: NPT confirmed on 2026-10-25 forced walk, `faces`, `lies at`, pause, info card; none is played on a capture of this mod). Director pass (Opus) kept: 07 not 06, pen in the morning then water then clearing then pen, third place `water-garden`, `bare-clearing` instead of `emerald-clearing`, closer zoom for calves, the boomsloth calf asleep at dusk, a face-on animal in 4. Not kept: grazing and drinking (steps unproven), Nelim crouched in 4 (no step), door held open (gate dropped, Nelim stops at it). Estimates become verdicts after the run.

## NSB (sync 2026-11-09)

Rules of the owner (2026-11-05, 2026-11-06, 2026-11-07) applied: everything in NSB is free; outside NSB a colonist or foreign domestic animal needs express validation; a colonist property change needs express validation; every outfit is free; every animal the mod includes is in the gallery. No colonist property is changed, no pawn outside NSB, no validation needed.

Changed in NSB since 2026-10-25: places `enclosure` and `enclosure-south` validated 2026-11-08 (logo Nelim in flowers on growing zones 3 to 15, nothing on its flowers, owner rule 2026-11-07), `water-garden` revalidated 2026-11-07, `bare-clearing` unchanged (pile at (205, 152) removed). NPT steps added: light dimmed to at most N and refreshed (dusk shot 7, compiled not played), put out, lies asleep in the bed, growing zones cleaned and filled, cells kept free of decor, things that are not plants removed from zones. Updated here: hair of Nelim in the shotlist (high ponytail, not a bun). Left alone: scenarios (no cosmetic change shown in the images). To check when scenarios 2, 5, 6, 7 are written: shot 2 grass cells (153, 212), (155, 215), (154, 217) must not sit on the logo flowers; shot 7 may use the dimmed light step.

Sync 2026-11-14: NSB changed once since 2026-11-09, commit 18abf53 (2026-11-12) renamed `docs/` to `Docs/`, 0 lines changed in any file: nothing to update, names and paths in this mod do not point at NSB files. NPT added 9 steps and catalogue entries since 2026-11-09 (filth removed from the map or around a colonist, StageDecor floor and decor burns, ScreenshotStudio step that hides the main tab bar, speed controls and mouse-over readout while the inspect pane stays, culture and building-work steps, Flooring Floors catalogue); none replaces a step a scenario calls, `Check-Steps.ps1` still resolves all 474 step lines (54 blocks). Candidate for shots 1 to 7 once ticket 12dc is read: the HUD-hiding step (the failure frames still showed the HUD) and the filth step; not added, `Tests/Pickle` frozen until RUN_DONE of 12dc. Included animals (meffalo, boomsloth, adult and calf) all have shots: no MISSING.

Sync 2026-11-19: rules of the owner (2026-11-05 to 07) said back and still met: no colonist property changed, no pawn or domestic animal outside NSB, every outfit free, every included animal has a shot. NSB since 2026-11-14: no change to enclosure-south, water-garden, bare-clearing, calm-zone or to Nelim's sheet (commits of 2026-11-17 are Iori, BiB gene renames, VALIDE rows for other colonists; `RECONSTRUCTION-SAUVEGARDE.md` 2026-11-18 is a plan to rebuild the save as `Nelims-tribe-v2`, nothing built, same site names, centres and zoom kept). NPT since 2026-11-14: face-parts catalogue (vanilla face has no vanilla mouth: Nelim keeps her Facial Animation `MouthLipsSmirk`, no scenario change), StageDecor `the plants {string} are removed in the area from (x1, z1) to (x2, z2)` (by defName, bamboo included, no growing zone: candidate to replace the hide-bamboo steps of shots 1 and 7, not applied), `the game interface is shown`, `the selection is cleared`. `Check-Steps.ps1`: 54 blocks, 530 step lines, every one resolves. Not changed: scenarios, shotlist cells. Included animals unchanged: meffalo and boomsloth (adult and calf) all have shots, no MISSING.

Places read: 2026-11-19 Tribe read: 2026-11-19 Steps read: 2026-11-19

| Place | Shots | Changes made for the gallery | Last read |
|---|---|---|---|
| enclosure-south (gate (159, 207)) | 1, 2, 7 | daylilies and grass, laying boxes kept, logo flowers left free | 2026-11-09 |
| water-garden | 3 | none (nothing in the water, validated 2026-11-06) | 2026-11-09 |
| bare-clearing | 4, 5, 6 | daylilies placed then removed | 2026-11-09 |

| Colonist | Shots | Outfit | Last read of profile | Exceptions |
|---|---|---|---|---|
| Nelim (in the save) | 1, 2, 4 to 7 | fixture trousers, corset, `Apparel_Jacket` ochre, same all day, no hat: vanilla pieces, free (rule 4); one outfit so the day reads as one day; hair high ponytail as canon | 2026-11-09 (NELIM-PROFIL, NSB-ROSTER lines, VALIDE) | none |

| Animal | Shots | Outfit | Last read of sheet | Exceptions |
|---|---|---|---|---|
| none from NSB (mod animals and anonymous wildlife only; ducks in shot 3 are decor) | | | | none |

| Included animal | Shots |
|---|---|
| Meffalo (adult and calf) | 1, 2, 3, 4, 7 |
| Boomsloth (adult and calf) | 2, 4, 5, 6, 7 |

## Gallery state (2026-11-19)

Kept: 2, 3, 4 (`Art/Gallery`, `Art/Gallery-clean`). REDO: 1, 5, 6, 7. Owner verdict 2026-11-16: Nelim off her sheet (smile, hair, no trousers); fixed by the explicit hairstyle `Roo_HD_Hair_Highpony`, no MouthSmile override (own face kept), AB Visible Pants seeds copied to `Tests/Pickle/config/gallery/`. Run d1ae (2026-11-19) played the fixes, all four REDO again on the pictures. Lessons: the meffalo art is near black, stage it on pale ground; no other animal in the frame radius; braziers and bamboo out of frame (StageDecor hide steps, or `the plants {string} are removed in the area`); Nelim large and within 3 cells of the animal, decor around the subject; shot 7 needs the dusk read (dim value, sun glow); shot 6 needs a film read of the blast tick. Next: recompose 1, 5, 6, 7 from the Shotlist table, rewrite scenarios, `Check-ShotlistVsScenario`, one ticket. Blocked until `localize` closes.

RUN_DONE d1ae 2026-11-19 read (tree 3c3e1fd, 4 of 4 green, captures opened, score-gallery): shots 1, 5, 6, 7 REDO, captures and run folder deleted. 1: Nelim about 90 px but 6+ cells from the meffalo (not in its 4 cells), braziers and bamboo in frame, no gate contact (image 3, adequacy 2.5, understanding 2.5, decoration 3.5). 5: Nelim small at the left, boomsloth about 8 cells away, ground still bare brown, no startle or fuse readable (3.5, 3.5, 3, 3.5). 6: haze, animal tumbling, flame ring not readable (3, 3, 3, 3.5). 7: pair on pale grass with the lantern, but Nelim at the left edge side-on and no dusk read (3.5, 3.5, 3.5, 4). Trousers of Nelim not judgeable at this size. Next: recompose 1, 5, 6, 7 (Nelim within 3 cells of the animal, plant and filth cleaning of the ground, dusk value, 6 needs a film read of the blast tick), then one ticket.
