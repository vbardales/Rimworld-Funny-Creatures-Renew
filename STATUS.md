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
stage:        done
licence:      silent
licence_at:   Historical four-place investigation in ATTRIBUTION.md retained; no permission inferred; live Steam refresh unavailable during this audit.
dependencies: none
showcase:     complete
build:        not_applicable
xml_audit:    complete
automated_tests: complete
functional_tests: unverified
tested_on:
workshop:
remaining:
  - unverified: Execute functional scenarios A-Q in RimWorld 1.6, including English/French UI, logs, new game and existing saves.
  - unverified: Confirm explosions, production, calf predator protection, original-mod incompatibility warning, sound and corpse rendering in game.
  - unverified: Previous-version save migration needs a suitable saved game; no migration success is claimed.
session:      local_e811cc9c-3b8c-4228-8ac0-7763601dfc17
updated:      2026-09-13, corrections and static validation
---
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
