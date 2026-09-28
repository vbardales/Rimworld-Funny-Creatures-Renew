---
localization: complete
translation_en: complete
translation_fr: complete
settings_audit: not_applicable
mod:          Funny Creatures Renew (unofficial)
packageId:    nelim.funnycreaturesrenew
repo:         Rimworld-Funny-Creatures-Renew
visibility:   public
detached:     yes
stage:        preTest
previous_stage: done
audit_revision: ed32e2b51ab5fe9e47bb3bad83705dad386bdaff
licence:      silent
licence_at:   "Four places searched for a refusal rather than a permission (ATTRIBUTION.md). The Workshop page was re-read on 2026-09-28: description unchanged, no repository or licence wording, 1.3 only, last updated 30 October 2021. Its comments load by script and could not be read. No permission is inferred."
dependencies: none
showcase:     complete
build:        not_applicable
xml_audit:    complete
automated_tests: complete
pickle_scenarios: "none written: Tests/Pickle/ does not exist. The plan (four passes, what goes in Gherkin and what does not) is in TESTING.md, 'Plan: passes, automation and gates'"
functional_tests: unverified
tested_on:
workshop:     "none. Not prepublished: Mod/About/PublishedFileId.txt is absent (checked 2026-09-28; RimWorld/Mods/FunnyCreaturesRenew is a link to Mod/, so the file would have landed there). The only PublishedFileId.txt found near this mod belongs to the archived original, in _mods-sources/FunnyCreatures. CHANGELOG.md therefore has no [0.1.0] section, by design"
evidence:     "Static checks, on disk only: evidence/static/2026-09-28-ed32e2b/. No game run exists. What to keep and what to delete: TESTING.md, 'Evidence to keep'. One line per run: docs/runs/README.md"
remaining:
  - unverified: "(preTest -> done) the Pickle (Gherkin) suite is not written. AUDIT.md asks for it, with its scope justified, before done. The plan is in TESTING.md and needs the owner's word on the lines marked proposed: passes 1 to 4 and the scenarios proposed as not applicable"
  - unverified: "(done -> tested) every scenario A-Q in a running game, in English and French with developer mode on, logs checked; no @wip, every conditional scenario played, no manual test left (each is Pickle and green, or listed not applicable with its reason)"
  - unverified: "(done -> tested) existing-save migration: loading a save made with the original mod. No such save exists; stays listed as unverified, not a gate"
  - unverified: "ModIcon readability at 32 px: the mascot head reads, the five animals around it merge into colour. The owner kept the icon on 2026-09-12; whether that covers this reading is to be confirmed"
  - unverified: "owner decision: the packageId nelim.funnycreaturesrenew carries 'renew', which PUBLISHING.md (2026-09-27) tells new packageIds not to. Free to change until the first publication, frozen after"
  - unverified: "owner decision: Storytime Rides Again (TSP.Isengriff.Storytime) defines the same defNames and is not declared incompatible; declaring it would add a second incompatibility pass"
  - unverified: "(prepublished) PUBLICATION.md is not written; the description has no IF I GO QUIET, AI-GENERATED, THANKS and licence-pointer blocks in the order the step asks for; thanks comments and the WORKSHOP_COMMENTS.md rows are not prepared"
session:      local_2bc4ddc6-2f19-485e-8404-c7f03c070278
updated:      "2026-09-28, audit against the current AUDIT.md: done -> preTest (the Pickle suite the workflow now asks for is not written). Nothing committed or pushed"
---

# Audit — 2026-09-28

**`done` -> `preTest`.** The stage names are the workflow's own literal states (`dansMonoRepo`,
`horsMonoRepo`, `ModIcon générée`, `Preview générée`, `preOptions`, `options`, `l10n`, `preTest`,
`done`, `tested`, `prepublished`, `published`); the field carries no codes to translate.

The regression is the criterion, not the mod. `done` was set on 2026-09-13, before `AUDIT.md` (edited
2026-09-27) asked for the Pickle tests to be **written**, with their scope justified, in the `preTest ->
done` step. This mod has none. Everything before that step holds and was re-checked on the current
revision.

## Scope and revision

- Standalone Git root `C:/Users/nelim/Documents/rimworld/FunnyCreaturesRenew`; distribution root `Mod/`.
- Audited HEAD `ed32e2b51ab5fe9e47bb3bad83705dad386bdaff` (2026-09-20), equal to `origin/main`
  (`git ls-remote origin HEAD`). `gh repo view` confirmed the repository PUBLIC, with the topics
  `rimworld`, `rimworld-mod` and `mod`; its share image is a custom one.
- Local changes made by this session, **not committed, not pushed**: `.gitignore`, `ATTRIBUTION.md` and
  `Mod/ATTRIBUTION.md`, `TESTING.md`, `Tests/RESULTS.md`, `STATUS.md`, new `docs/`, and eight evidence
  files removed from the index (`git rm --cached`). `Art/ModIcon.ico` and `Art/Preview.ico` were untracked
  and are now ignored. No file under `Mod/Defs`, `Mod/Languages`, `Mod/Textures` or `Mod/About` changed.
- Protocols read and their versions: `docs/PROTOCOLS-READ.md`. RimWorld was **not** launched, by this
  session or through the dispatcher: no deposit was made.

## Ordered gates

| Transition | Result | Evidence |
| --- | --- | --- |
| dansMonoRepo -> horsMonoRepo | Validated; one owner decision open | Standalone root, public GitHub repository, remote configured, pushed HEAD. STATUS.md, English README, ATTRIBUTION.md, CHANGELOG.md. The two ATTRIBUTION copies are byte-identical (compared, not assumed). Licence `silent`, public, name suffixed ` (unofficial)` after `Renew`, takedown paragraph present. Folder, repository, name and packageId agree with each other. **Open:** the packageId contains `renew` (see below) |
| -> ModIcon générée | Validated, with a reserve | No code, so no build. `Mod/About/ModIcon.png` is 128 x 128, 12,519 bytes. Resized from the owner's 1254 x 1254 file **at her request** on 2026-09-12; the full-size original is kept as `Art/ModIcon-source.png`. This session generated and changed nothing. Reserve at 32 px, below |
| -> Preview générée | Validated | `Mod/About/Preview.png` is 896 x 504, 592,045 bytes, under 1 MB; opened directly |
| -> preOptions | Validated | Overlay measured, five contrasts at 4.936:1 or better (threshold 4.5:1); the rule and badge colour is distinct from the secondary ink; the English description opens with the UNOFFICIAL paragraph and ends with `[url=https://github.com/vbardales/Rimworld-Funny-Creatures-Renew]Source code on GitHub[/url]`, the same target as the remote and `<url>` |
| -> options | `not_applicable` confirmed | Source search: no `MainButtonDef`, no settings class, no C#. `test_settings_absence_contract` green. Fixed species design, nothing a player needs to configure |
| -> l10n | Validated | French `DefInjected` covers the 20 owned fields; the shared checker: **20 keys, 0 errors**. English is the native source text. No Keyed text, no parameters, no plurals |
| -> preTest | Validated | Nothing beyond Core is used: no dependency, no assembly, no `LoadFolders`, no patch. `loadAfter` names Ludeon's packages only; `incompatibleWith` names the original |
| preTest -> done | **Not established** | Written scenarios A-Q: yes. Automated tests: 9 green. XML tests: green (7 files, 10 typed definitions, no duplicate). **Pickle (Gherkin) tests written and their scope justified: no, `Tests/Pickle/` does not exist.** A justified scope is drafted in `TESTING.md`; it is a plan, not a suite |
| done -> tested | Not verified | No scenario played in a game. Nothing to claim |
| tested -> prepublished, published | Not reached | See "Publication state" |

## Checks executed

- `python Tests/test_mod.py -v`: **9 tests passed**, on `ed32e2b`, with the game data read from disk
  (RimWorld 1.6.4871 rev590).
- `Check-DefInjected.ps1 -TransMod Mod` (checker sha256 `6242fc37f0b4…`): 11,594 definitions indexed, 29
  patch operations applied while indexing (the mod ships none), **20 keys, 0 errors**.
- `Art/check-contrast.py`: title 5.894, suffix 7.210, tag 4.936, summary 5.035, badge 9.562. The Preview is
  unchanged since it was rendered on 2026-09-13, so that measurement still applies.
- Hash inventory of 23 delivered and test files: 22 matched, **`Mod/About/About.xml` did not** (changed by
  commit `ed32e2b`). The inventory recorded on 2026-09-13 was stale and was regenerated.
- Both images opened. The Preview is sound. The ModIcon at 32 px, scaled up eightfold to look at it: the
  orange mascot head, its wink and its smile read clearly; the five animals around it (alpaca, dodo, spined
  lizard, calico cat, mammoth) fade into a ring of colour, and only the cream alpaca is still guessable.
- Distribution payload of `Mod/` listed in full: About (3 files), four Defs, two French files, seven
  textures, `ATTRIBUTION.md`. The untracked `Mod/desktop.ini` is ignored by git, so the CI payload, which
  ships tracked files, does not carry it; the in-game upload button would.

## What is settled, and what is asked

**ModIcon at 32 px.** `STYLE_RIMWORLD.md` asks that the head and the object beside it still read, and that
one or two objects accompany the mascot. Five animals do not. The 2026-09-12 decision to keep the icon
concerned its **subject** (another mod's cast); this reading was not put to the owner then. The audit
corrects nothing and generates nothing. The 2026-09-12 acceptance is taken as the override the rule
allows, and the confirmation is requested.

**packageId.** `PUBLISHING.md` (2026-09-27) says not to add `renew` to a packageId, and that the rule holds
for what is not yet published. This mod is not. Renaming is free today and impossible after the first
publication; it would touch `About.xml`, `Tests/test_mod.py`, `TESTING.md`, the docs and the title of the
session. Nothing was renamed.

**A third-party pack defines the same defNames.** Storytime Rides Again: a New Chapter
(`TSP.Isengriff.Storytime`, [TurtleShroom/TSP_STORYTIME_RIDES_AGAIN](https://github.com/TurtleShroom/TSP_STORYTIME_RIDES_AGAIN))
carries a retuned copy of both animals in its `1.5/` and `1.6/` folders and itself declares
`predatorking.funnycreatures` incompatible. It does not declare this mod, and this mod does not declare
it. Not installed locally. Recorded in `ATTRIBUTION.md` and `TESTING.md`.

**Upstream repository.** The original has none that could be found (page, archived files, GitHub code and
account searches; details in `ATTRIBUTION.md`). The port therefore starts from the Workshop's 1.3 files,
and no pull request is possible. If one appears, the port should be rebased on it.

## Publication state

Not prepublished. `About/PublishedFileId.txt` does not exist, so `CHANGELOG.md` keeps `## [1.0.0] —
unreleased` alone and gets no `[0.1.0]` section; that entry is written when the file appears, with the
commit that adds it. No Workshop item, no tag, no release. `PUBLICATION.md` does not exist and is a
`prepublished` requirement.

## Hygiene done in this audit

- **`.dds`**: none tracked, none on disk, never committed (checked in the history). `*.dds` and `*.DDS` are
  now ignored so it stays so.
- **`.ico`**: the two Explorer icons are local derivatives and are now ignored, as `WELCOME.md` asks.
- **Evidence**: eight generated files were tracked (`Tests/*-results.txt`, `Tests/audited-files.json`,
  `Art/preview-background.png`, `-thumbnail.png`, `-contrast.json`, `-render.json`). They are removed from
  git, ignored, and the superseded ones deleted from disk (the 2026-09-13 results, a 570 KB intermediate
  image). Fresh outputs for `ed32e2b` are in `evidence/static/2026-09-28-ed32e2b/`. Nothing a field points
  to was deleted: `Tests/RESULTS.md` and this file were repointed first.
- **Which proofs to keep during tests** is written in `TESTING.md`, "Evidence to keep".
- **The new gates for `tested`** (no `@wip`; every conditional scenario played; no manual test left) are
  written in `TESTING.md`, "Gates for done -> tested".

## Next transition only: preTest -> done

Write the Pickle suite in `Tests/Pickle/`, on the plan in `TESTING.md`: what only a running game can show
(the animals drawn, the explosion, the calf and the predator, the two languages, save and reload, the
incompatibility symptom), and the passes it needs. Then justify in the suite's README what was left out and
why. Reading `PickleTools/Authoring/README.md` and Pickle's step catalogue comes first. Running it is not
part of this step; `done -> tested` does that, by deposit only.

## Reserves, apart from the blockers

- The Preview and the icon show animals that are not this mod's (a white and a blue-grey beast; an
  alpaca, a dodo, a cat). Decided and kept by the owner on 2026-09-12; not re-opened.
- `STYLE_RIMWORLD.md` names the un-lettered illustration `Art/Preview.png`; this repository calls it
  `Art/Preview-source.png`, which its scripts read. Cosmetic.
- The 32 px reading of the icon above is a judgement, made by an assistant looking at enlarged pixels.

---

# Earlier sections, kept as they were

> **Read with the 2026-09-28 audit above.** The stage below (`done`) is superseded; the reasons are stated
> there. Evidence paths quoted below (`Tests/audited-files.json`, `Art/preview-contrast.json`,
> `Art/preview-render.json`, `Tests/*-results.txt`) were moved on 2026-09-28: the fresh outputs are in
> `evidence/static/2026-09-28-ed32e2b/`, and the preview ones stay in `Art/`, git-ignored.

# Corrections and current validation — 2026-09-13

**Current stage: done** — all gates through readiness for final functional validation are
established. `tested` is not claimed. This section and the current front matter supersede the
pre-fix audit retained below; its defects and pending static checks describe the earlier state.

## Changes made

- Rebuilt the existing HTML/CSS Preview overlay over the unchanged illustration: Renew at 65%,
  colored secondary ink, exact unofficial tag, 1.6 version badge, primary-colored summary and
  distinct accent. The selected ModIcon, animal sprites and illustration source were preserved.
- Corrected the final source link, wool/leather terminology and the port/predator-protection
  account in About.xml, README, CHANGELOG and both synchronized ATTRIBUTION copies.
- Added French DefInjected coverage for all 20 owned fields. Native source English remains the
  EN resource; no redundant English translations or configuration features were added.
- Added Tests/test_mod.py with relevant XML, translation-coverage, dependency, packaging and
  port/production regression checks. Updated scenario L to test the shipped incompatibility
  warning and added explicit FR/EN and new/existing-save scenarios P-Q.

## Evidence and cumulative gates

Tests/RESULTS.md records commands, actual outcomes and scope. Tests/audited-files.json identifies
the delivered files and test/render sources by SHA-256. HEAD is still
`3ee276100def7a82a3569c14762c6798559339be`; the fixes are local and uncommitted, on top of the
pre-existing local work listed in the retained audit. No commit, push or publication occurred.

- Standalone/public GitHub, naming, rights classification and initialized documentation remain
  established by the preceding audit. The live Steam refresh limitation remains documented;
  no new license or permission is inferred. No compiled build is applicable.
- ModIcon remains 128 x 128. Preview is now 896 x 504 and 592,045 bytes. Both image gates pass.
- Description and overlay requirements now pass, establishing preOptions.
- `settings_audit: not_applicable` remains justified: fixed species design, no player configuration
  requirement, no custom code, no empty page or MainButton. The absence check passed again.
- `localization`, `translation_en`, `translation_fr`: complete for static coverage/path validation.
  Both French files contain 20 nonempty entries covering the independent source inventory,
  including tool handles and `Meffalo.lifeStages.meffalo_calf` label/plural paths. The shared
  engine-aware checker passed **20 keys, 0 errors**, without unresolved targets. Proper species
  names remain unchanged intentionally. No parameterized messages or custom UI strings exist.
- Core inheritance and referenced defs pass the automated check on RimWorld 1.6.4871 rev590.
  No DLC/framework dependency or conditional LoadFolders/patch is introduced. The original
  package remains incompatible. This establishes preTest after the translation gate.
- **9 automated tests passed**, including **7 XML files** and typed-name uniqueness. Written
  functional scenarios A-Q cover the relevant game behaviors, languages and saves. No custom
  compiled-logic test is applicable. The tests apply to the hash-identified current distribution,
  establishing done. Game execution, log review and final functional success remain unverified.

## Preview review

Art/preview-palette.json is the single palette source loaded by Art/preview.html.
Art/render-preview.cjs waits for fonts and image decode before rendering and records the actual
Segoe UI/Semibold fonts in Art/preview-render.json. The veil follows the warm brown floor;
the secondary ink follows the dominant warm straw/lamplight family. The accent develops the
cool blue-gray animal detail into a saturated cyan, visibly distinct from the warm secondary ink.

The final full-size image and 268 px thumbnail were opened and inspected directly: no overlap
or clipping, readable title/Renew/tag/version and a visible distinct rule. The 360 px summary
column is retained to keep the illustration's nearest animal edge clear; the left/top placement
is now the prescribed 50/54 px. Art/check-contrast.py measures the rendered background plus veil
conservatively over whole text rectangles, without relying on shadows: title 5.894:1, suffix
7.210:1, tag 4.936:1, summary 5.035:1 and badge 9.562:1. Evidence is in Art/preview-contrast.json.
The known nonrepresentative subjects remain the previously accepted illustration choice;
no regeneration or camera correction was needed.

## Remaining transition: done -> tested

Execute and record TESTING.md A-Q with logs and actual FR/EN UI observations, including a new
colony, existing-save addition/reload, and an older mod save if available. Record unavailable
migration cases as unverified. No settings persistence or RIMMSQOL integration is applicable.
Any runtime failure should be corrected and its affected regressions rerun; absence of a runtime
result is not evidence of a defect. See Tests/RESULTS.md for the explicit boundaries of static tests.

---

# Archived pre-fix audit (historical results follow)


# Workflow audit — 2026-09-13

This section and the front matter supersede the historical assessment below. Only STATUS.md
was changed by this audit; implementation, artwork and existing tests were preserved. No build,
image generation, commit, push, publication or in-game test was performed.

## Scope and revision

- Standalone Git root: `C:/Users/nelim/Documents/rimworld/FunnyCreaturesRenew`;
  distribution root: its `Mod/` directory. Git metadata is local to this repository.
- Audited HEAD: `3ee276100def7a82a3569c14762c6798559339be` (2026-09-12).
  `git ls-remote origin HEAD` returned that same SHA during this audit.
- `gh repo view vbardales/Rimworld-Funny-Creatures-Renew --json nameWithOwner,visibility,url`
  confirmed PUBLIC and the expected repository URL. Both remote checks succeeded after
  read-only elevated access; the initial sandboxed gh call could not read its configuration.
- Pre-existing tracked modifications: CHANGELOG.md, Mod/About/About.xml,
  Mod/Defs/ThingDefs_Races/Races_Animal_FunnyCreatures.xml, README.md, STATUS.md.
  Pre-existing untracked paths: Art/, Mod/About/ModIcon.png, Mod/About/Preview.png, TESTING.md.
  Findings concern this working tree, not an assertion that these local changes were pushed.
- Read parent AGENTS.md, PUBLISHING.md, STYLE_RIMWORLD.md, MOD_SETTINGS.md and TRANSLATIONS.md.
  The supplied audit prompt overrides conflicting advice, especially the settings runtime gate.
- The `stage` field uses the workflow's literal state names, not legacy codes.
  Previous `done` meant ready for final functional validation; retained `Preview générée`
  means gates 1-3 pass and gate 4 does not. Later independent checks remain recorded below.

## Ordered gates

| Transition | Result | Evidence / outstanding criterion |
| --- | --- | --- |
| dansMonoRepo -> horsMonoRepo | Validated | Standalone root, configured GitHub remote, public repository and pushed HEAD verified. STATUS, English README, ATTRIBUTION and CHANGELOG exist; distributed ATTRIBUTION is byte-identical. Package ID, title, folder and repository names are consistent. Historical silent rights investigation retained, without treating silence as permission. No invented third-party LICENSE is required. |
| horsMonoRepo -> ModIcon générée | Validated; build not applicable | XML-only implementation is present; no C# source, project or DLL exists or is required. ModIcon is a readable PNG, 128 x 128, 12,519 bytes, directly inspected. No unfinished feature is inferred from the absence of final game tests. |
| ModIcon générée -> Preview générée | Validated | Direct inspection of Preview.png: PNG, 896 x 504, 616,692 bytes, below both 900 KB and 1 MB. No concrete camera defect identified; no historical generation report or comparison screenshot required. Overlay corrections belong to the next gate. |
| Preview générée -> preOptions | Defects found | Renew is 100% size in primary ink, not 65% in secondary ink. The unofficial tag and supported-version badge are absent. Required final description link is missing. See visual review below. |
| preOptions -> options | Independently validated: not applicable justified | No useful configuration requirement identified; no settings page or MainButton exists. Source audit is sufficient under the supplied prompt. |
| options -> l10n | Defect found | Native English source coverage exists, but French coverage is absent for all 20 owned text fields. |
| l10n -> preTest | Independently validated, static dependency declaration review | Only Core definitions and engine classes are used. No third-party dependency, assembly, conditional patch, version folder or LoadFolders exists. loadAfter lists Core and official expansions; it does not require those expansions. Original package is correctly in incompatibleWith. |
| preTest -> done | Partial; not established | Fifteen functional scenarios exist with actions/expected outcomes and common setup, but scenario L is stale. No maintained automated/XML test suite was found. Five XML parse checks and duplicate checks executed successfully in this audit; they do not validate all engine fields or substitute for a complete applicable suite. No custom compiled logic needs unit tests or a build. |
| done -> tested | Non verified | No scenarios executed in game, no current-revision log evidence assessed, no FR/EN UI or new/existing-save validation. No customization integration was tested or claimed. |

## Checks executed

PowerShell parsed every `Mod/**/*.xml` with `[xml](Get-Content -Raw ...)`: **5/5 passed**.
The four Def files contain **10 definitions** (four ThingDef, two PawnKindDef, four SoundDef).
Grouping by XML `LocalName` and `defName` found **zero duplicate typed names**. ThingDef and
PawnKindDef intentionally share the animal names; this is not a duplicate error.
`git diff --check` passed; Git only warned about configured LF-to-CRLF normalization.
System.Drawing decoded both PNGs and returned the dimensions/byte lengths above.
SHA-256 of distributed images:

- ModIcon.png: `72C0527E1349DC353DF83B7EB7FE1F944DF0E3AB419285A335653E0E5DD71ED4`
- Preview.png: `780D6670BACFEB6AD28D343F23AACBDD13CA5E29BBA1A1DB30433F41FBC60A05`

Source inventory verified zero C#/DLL/project files and zero MainButtonDef entries. There is
no Languages directory. Both attribution copies have matching SHA-256 hashes.
The installed game version file reports **1.6.4871 rev590**. A direct Core XML search confirmed
AnimalThingBase, AnimalKindBase, WoolBase, LeatherBase, Flake, Chemfuel, WoolMegasloth,
Leather_Heavy, both referenced quadruped bodies, AnimalBaby/Juvenile/Adult, and all four
Pawn_Thrumbo sounds. The mod's four local sound definitions use vanilla muffalo clip folders;
actual packed audio/texture loading and engine class instantiation are not certified by this search.

## Settings audit

The mod adds two fixed-design animal species, wool and leather, with vanilla shearing,
milking, training, combat and spawning. Production quantities, biome commonality, wildness and
predator eligibility are species design values, not an advertised manual-XML configuration
interface. No player need requiring a new setting was established. Exposing every balance
constant would invent features outside this audit. No inherited settings, configurable framework,
custom settings class, UI code, MainButtonDef or optional configuration integration exists.
Therefore `settings_audit: not_applicable` is justified. Defaults/input validation/persistence,
application timing and RIMMSQOL shortcut tests are not applicable. No game integration was tested.

## Translation audit

The complete owned-text inventory has 20 fields, all nonempty English source values:

- ThingDef: four labels and four descriptions (animals, wool, leather).
- ThingDef race: two meatLabel fields.
- ThingDef tools: six explicit labels (head/hooves/claws).
- PawnKindDef: two labels, plus the meffalo calf label and plural in lifeStages.

These use native translatable Def fields. No Keyed calls, parameterized messages, custom grammar,
UI strings or conditional text patches exist. Technical devNote, identifiers, resource paths,
About metadata and repository prose are excluded appropriately. English duplication in a
Languages/English folder is unnecessary. Source prose has spelling/editorial issues but is English.
`localization: complete` records native mechanisms; `translation_en: complete` records source
coverage, neither claiming in-game validation. `translation_fr: partial` records audited missing
coverage. No French entries exist to validate for paths, placeholders, tags or parameters.
Check-DefInjected.ps1 was inspected but not run: with zero injection files, an empty report
would not verify coverage. It becomes applicable when French DefInjected resources are supplied;
verify nested tool handles and lifeStages paths then. FR/EN game rendering remains unverified.

## Visual and documentation review

Both distributed images were actually opened during the audit. The Preview has a high oblique
view, a legible left text area and two animals on the right. Its orange rule is visibly distinct
from the light text; there is no evidence that those existing colors merge. However, the required
secondary ink is not applied to Renew or a status tag at all, so the requested secondary/accent
pair is not established. The HTML confirms a single unstyled h1, primary #F2ECE1,
summary #D8CFC0 and rule #D68F2C. The next transition requires Renew at 65% in a colored
secondary ink, the exact unofficial tag, the 1.6 badge, and a summary in the primary ink;
validate the resulting hierarchy and distinct colors at full and thumbnail size. No image was
regenerated or resized for this audit. Other spacing/font-weight deviations are visible in the
HTML and should be brought into alignment during that overlay adjustment.

The historical decision to keep nonrepresentative animals in both images is retained. This is an
optional accuracy reservation, not a new regeneration requirement. The missing extra corpse
rotations are a source-file fact; whether the fallback looks wrong in game remains unverified.
Borrowing the vanilla muffalo corpse is not itself a defect.

The English About description has the correct initial unofficial/takedown notice and repository
URL, but its final paragraph is the AI credit. It must end after the credits with
`[url=https://github.com/vbardales/Rimworld-Funny-Creatures-Renew]Source code on GitHub[/url]`.
The existing bare URL and `<url>` element do not satisfy this mandatory criterion.

The old missing-incompatibleWith defect is resolved on disk (also already present in HEAD).
TESTING.md still asserts it is absent and scenario L asks to add it; these instructions need
updating before claiming the scenario set matches the delivered version. About/README still call
meffalo wool darkfur, while the defs distinguish WoolMeffalo and Leather_Darkfur. The three-line
port account in About/ATTRIBUTION also omits the locally added canBePredatorPrey=false behavior.
These are documentation discrepancies, not proof that runtime animal behavior is broken.

## Rights evidence and limitations

The existing four-place investigation in ATTRIBUTION.md establishes the recorded workflow
classification `silent` (source documented as supporting 1.3, no license/permission/refusal found).
That independent historical investigation is preserved; it does not confer redistribution rights.
The public/unofficial labels and takedown commitment are consistent with the local publishing
convention. No LICENSE was invented for PredatorKing's assets. A fresh upstream review was
attempted: Firecrawl CLI is unavailable, the web tool could not open the Steam item, and its
search returned no result. Thus current Steam changes were not verified; this is a refresh
limitation, not evidence of an upstream prohibition or a reason to erase the existing investigation.
GitHub visibility and remote HEAD, in contrast, were refreshed successfully during this audit.

## Next transition only

To reach preOptions: correct the Preview overlay hierarchy/secondary ink, unofficial tag and
1.6 badge, verify its colors/readability, and add the exact final GitHub description link.
No new feature, setting, generated illustration or in-game test is needed for that transition.
Later gates still require French resources, an applicable reproducible XML/automated verification
suite and corrected scenarios, then actual in-game validation including FR/EN and saves.

---

# Historical assessment — retained verbatim

The following text records earlier decisions and findings. Its old stage and unresolved-item
claims are historical; use the dated audit above for current results.

# Funny Creatures Renew — status

Status card, read by a sweep over every mod rather than by asking each thread one at a time. It
lives at the root, never inside `Mod/`, so Steam never receives it.

This card is in English, like the repository around it: README, changelog, attribution and every
commit message.

The fields above were deduced from disk on 2026-09-12 by the sweep, which left two of them
corrupted — `licence` read `licence_ou:` and `licence_at` had swallowed a `vitrine:` key. They are
repaired here, along with the four the sweep could not know:

- **`stage`** — `done`. The port itself is whole and is three lines: wildness moved from a
  `RaceProperties` field to a stat under `statBases` on both animals, and the boomsloth's
  `deathActionWorkerClass` moved into a `deathAction` block. Both pictures were settled on
  2026-09-12. What is left is not development, it is the game, and then the Workshop.
- **`tested_on`** — empty, and accurate rather than omitted. Neither animal has been seen running.
  No meffalo milked, no boomsloth killed, no information card read.
- **`dependencies`** — `none`. The About declares no `modDependencies`, and every entry in its
  `loadAfter` is Ludeon's own: Core and the five expansions. No Harmony, no framework, no C# at
  all.
- **`remaining`** — the sweep's catch-all line is replaced by seven real ones, none cosmetic, now
  that `TESTING.md` exists. The first two are documents that contradict the defs and a missing
  `incompatibleWith`, and both are worth clearing before the Workshop description is written, since
  that is only posted once. The last three stand apart: they are what no file checker can settle.

`licence` vocabulary: `open` an explicit licence, `silent` no licence and a dead source,
`alive` no licence but a living source, `forbidden` a written refusal, `original` owing nothing
to anyone — not a name, not an idea traceable to one mod, not a value derived from its assets.

## The pictures

`Mod/About/Preview.png` was engraved on 2026-09-12 and is formally sound: 896 x 504, 602 KB,
cropped low at 60% so both animals, the fence and the settler survive the move from 5:4 to 16:9.
The veil is a dark warm brown sampled off the floor under the text block itself, luminance 0.054,
so the light ink and the shadows are the right branch of the rule; worst measured contrast behind
the summary is 4.85:1, above the 4.5:1 the sheet demands. The source and the engraving page are
kept in `Art/`, never in `Mod/`, because Steam uploads the mod folder unfiltered.

**It does not show this mod's animals, and that was looked at and accepted on 2026-09-12.** The
large one is white and the smaller one pale blue-grey with horns, where the meffalo's sprite is
near-black with a pale face mask and the boomsloth's is brown with a cream mane; the bucket that
would have named the mod, the one holding chemfuel, is empty. The showcase stands as it is. It is
recorded here so that a later reader meets the decision rather than the discrepancy, and does not
regenerate the picture believing it was an oversight.

If it is ever redone, it needs no new prompt: `PROMPT_FUNNYCREATURESRENEW.md` already carries the
values, and the crop and the engraving page replay unchanged on a new source.

`Mod/About/ModIcon.png` was brought to size on 2026-09-12: 128 x 128, 12.5 KB, down from
1254 x 1254 and 1.5 MB. That reduction was not cosmetic. `SetItemContent` uploads the mod folder
without filtering, so the original would have put a megabyte and a half into every subscriber's
install for something the game draws at 32 px. Scaled with Lanczos and reduced to a 256 colour
palette without dithering, which flat cel shading takes without any visible loss; the mascot's
head, the wink and the ponytail still read at 32 px.

**Its subject is the same deliberate choice as the showcase's.** It shows an alpaca, a dodo, a
spined lizard, a calico cat and a mammoth around the mascot, and neither a meffalo nor a boomsloth.
This was raised, looked at and kept on 2026-09-12. Recorded so that a later reader meets the
decision rather than the discrepancy.

The prompt written for both pictures is `PROMPT_FUNNYCREATURESRENEW.md`, in the parent folder,
outside this repository. It is unused, and kept for whenever either picture is redone.

## What this mod is no longer a straight port of

Recorded here because the rest of the repository insists on how little was touched, and a future
reader will otherwise take this for a pure port.

**Wild predators no longer hunt boomsloths.** `canBePredatorPrey` false was added to the animal's
`<race>` on 2026-09-12, matching the base game's boomalope, which declares the same flag for the
same reason. A predator that kills a boomsloth sets off the explosion, and on a forested map that
is a wildfire no player caused.

The gap was narrower than it looks and real all the same. Prey selection vetoes on body size before
anything else, and the largest `maxPreyBodySize` anywhere in the base game and its five expansions
is the bear's 3, against an adult boomsloth's 4.0. **Adults were already safe, by accident of their
size.** A calf is drawn at 0.8 and a juvenile at 2.0, both under that ceiling, and a grizzly or a
warg clears every remaining check.

**It does not carry the exception it was asked to carry.** The flag is absolute: a starving predator
will not touch a boomsloth either. `FoodUtility.IsAcceptablePreyFor` has no hunger term at all,
read off the 1.6 assembly on 2026-09-12; hunger decides whether a predator hunts, never what it is
willing to take. A starving exception would need a Harmony patch and an assembly, and this mod has
neither.

## What the port did not touch

No balance value was altered, including the two jokes the mod is built on: the meffalo is milked
for flake and the boomsloth for chemfuel, both at the original intervals and amounts. Both animals
keep their original `wildBiomes`, so they are met in the wild as well as bought — which neither the
About nor the README mentions, and which is worth saying somewhere before the Workshop description
is written, because that description is only posted once.
