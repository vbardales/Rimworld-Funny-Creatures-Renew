# Publication: Funny Creatures Renew (unofficial)

What the Workshop page asks for and the repository holds nowhere else: the description, the change note, the order of the
captures, the messages to the mods this one is built on, the dependencies, and the answer to the content questions. It serves
twice: for the first upload, and for whoever takes the mod over.

**Current state, 2026-10-11:** the item exists, private (`Mod/About/PublishedFileId.txt` = 3811290892, prepublication 0.1.0 of 2026-10-01). The stage is `playTests[1.0.0]`. In-game tests have been run, but full validation on the final revision remains pending. The text below is still a draft. The open items are at the end, and they are the owner's. The rules this follows are in `PUBLISHING.md` and `AUDIT.md` (`publish`, `followUp`).

*Historical, 2026-09-28:* nothing had been uploaded and no item existed.

## Steam description

The single source, in Markdown: the CI converts it to the Steam description (BBCode) and to the plain-text `<description>` of
`Mod/About/About.xml`, and stops when they differ. **`About.xml` still carries the hand-written text of 2026-09-20 plus the
compatibility paragraph of 2026-09-28; it is regenerated from this block, not the other way round, once the runs are done** and
`Mod/` is free to change again (a request is staged from the working tree when it plays).

The block opens with the UNOFFICIAL paragraph, has the blocks `IF I GO QUIET`, `AI-GENERATED` and `THANKS` in that order after
the body, then the pointer to `ATTRIBUTION.md` and the licence, and ends with the source link. It contains no code fence.

```markdown
UNOFFICIAL. This mod is published without the original author's explicit consent. If the original author contacts me to request its removal, I undertake to take it down promptly.

The meffalo and the boomsloth, brought forward to the latest RimWorld version. Two animals that turn fodder into contraband.

I am not the author of this mod. Both animals are PredatorKing's; this update ports them to the latest RimWorld version and adds the predator protection described below. Credit goes to them, mistakes in the update are mine. If they come back to it, or ask me to take this down, it comes down.

Original mod: [Funny Creatures](https://steamcommunity.com/sharedfiles/filedetails/?id=2640466629), last supporting 1.3, last updated in October 2021. Abandoned, not withdrawn.

**WHAT IT ADDS**

Two animals, both trainable to Advanced, and both milkable in a way no vanilla animal is.

The meffalo is a muffalo in everything but its udder: body size 3.5, fifty-five years of life, wildness 0.6, and it is milked for flake rather than milk. It is shorn for meffalo wool; butchering yields dark fur leather.

The boomsloth is a megasloth that goes off. Body size 4.0, wildness 0.97, fifteen years, and it explodes when it dies, with the vanilla big explosion, so a dead boomsloth takes the room with it. It yields megasloth wool when shorn and is milked for chemfuel.

**WHAT CHANGED IN THIS UPDATE**

Two compatibility repairs restore the original behaviour. Wildness stopped being a field of RaceProperties in the latest RimWorld version and became a stat declared under statBases: the old form is not an error, it is simply never read, and the stat defaults to -1, outside the range the game uses, so both animals tamed for almost nothing instead of sitting at 0.6 and 0.97. And the boomsloth's death action moved: a flat deathActionWorkerClass inside race became a deathAction block holding a workerClass, and the flat form is no longer read at all, which means the explosion had stopped happening, on the animal named for it.

Production quantities and other numeric balance values are unchanged. One behaviour is added: wild predators no longer hunt boomsloths, calves included, since a predator that kills one sets off the explosion. Colonists can still hunt them.

**COMPATIBILITY**

Nothing is required. Four patches apply only when the other mod is loaded, and change nothing otherwise.

- [A Dog Said... Animal Prosthetics 2](https://steamcommunity.com/sharedfiles/filedetails/?id=3238353862): both animals get its medieval, simple prosthetic and bionic surgeries.
- [Nocturnal Animals (Continued)](https://steamcommunity.com/sharedfiles/filedetails/?id=2269731409): the boomsloth is nocturnal, like the megasloth it comes from. The meffalo stays diurnal, like the muffalo.
- [Better Crossbreeding](https://steamcommunity.com/sharedfiles/filedetails/?id=3520675842): The meffalo and the muffalo can interbreed. The boomsloth can interbreed with either the megasloth or the boomalope; offspring may be either parent's species. This patch does not enable breeding between megasloths and boomalopes.
- [Dogs mate (Continued)](https://steamcommunity.com/sharedfiles/filedetails/?id=2441132298): the meffalo can mate with the muffalo, and the boomsloth with the boomalope.

The original Funny Creatures defines the same defs and is declared incompatible.

Content mod: removing it mid-save will lose any meffalo or boomsloth, and any meffalo wool or dark fur already in play.

**IF I GO QUIET**

If I do not answer within a reasonable time after being contacted, anyone may freely update this or any other of my mods, including publishing a continuation of it. All credit must be preserved.

**AI-GENERATED**

The update work, code, tests and documentation were done with the help of AI assistants: Claude, by Anthropic, and Codex, by OpenAI. The Preview and the icon are AI-generated images.

**THANKS**

- PredatorKing, for the meffalo, the boomsloth and their textures.
- SamBucher, for A Dog Said... Animal Prosthetics 2; Mlie and XeoNovaDan, for Nocturnal Animals; Mlie and Revolus, for Dogs mate; DizzyEevee, for Better Crossbreeding. Their files were read to write the patches, and nothing of theirs was copied.
- The tools used to test this mod, for development only and never dependencies: [Pickle](https://steamcommunity.com/sharedfiles/filedetails/?id=3791648678), [RimLogging](https://steamcommunity.com/sharedfiles/filedetails/?id=3733484696) and PickleTools.

Licence and sources: the original states no licence anywhere, and this port rests on the Workshop's own custom for abandoned mods, named credit and a takedown on request. `ATTRIBUTION.md`, in the mod folder and on GitHub, has the licence check and the port in detail.

[Source code on GitHub](https://github.com/vbardales/Rimworld-Funny-Creatures-Renew)
```

## Steam change notes

Written now, sent when the item goes up; they start with the version, alone on the first line, in BBCode. A first release has no
previous tag.

```
### 1.0.0
[b]1.0.0[/b]
First release of the update of Funny Creatures, by PredatorKing.
[list]
[*] The boomsloth explodes again: its death action moved in the latest RimWorld version and the old form was silently ignored.
[*] Wildness is read again on both animals, so they are as hard to tame as they were meant to be.
[*] Wild predators no longer hunt boomsloths, calves included.
[*] Optional patches for A Dog Said... Animal Prosthetics 2, Nocturnal Animals (Continued), Better Crossbreeding and Dogs mate (Continued).
[*] French translation.
[/list]
```

## Gallery

**Not produced; the shot plan below is settled on paper (2026-10-18) and nothing in it is played.** The gallery is a manual step on the Steam page (SteamCMD sends the header image only), from a folder that holds
the images to upload numbered `00-`, `01-`, `02-`, `03-` in page order and nothing else. `00-` is a byte-identical copy of
`Mod/About/Preview.png` (owner rule of 2026-09-29); the captures follow it starting at `01-`. They come from the Pickle scenarios tagged
`@review`, which makes them reproducible; a green scenario proves the path ran, not that the image shows anything, so **every image is
opened and read before it goes in the folder.** In the repository the files are `0-`, `1-`, `2-` (contiguous, `0-` the Preview copy).

### Gallery story and subtitles (PLAN, reworked 2026-10-18; no capture exists yet)

**Superseded 2026-10-25:** the shot plan below is replaced by the shotlist of `Tests/Pickle/Gallery/18-the-gallery.feature` (copied in `STATUS.md`, "Shotlist"). The subtitle table is rewritten from it once the captures are accepted.

`Art/Gallery/` holds only `0-preview.png`. This is the shot plan the scenarios follow at `shootGallery`. Each line is rewritten after its image is opened and judged. A scene whose image is refused loses its line.

**Story, one day at the Sanctuary: "The herd that was not on the map".** Nelim (Virginie) is the protagonist and the only colonist of the save. **No guest rancher** (decided 2026-10-18): a second body, outfit and face would cost seven more setups and say nothing the two animals do not. Two places only: `emerald-clearing` (herd, shots 2, 3, 5, 6) and `enclosure-south` (pen, shots 1, 4, 7). Time runs from 06:00 to dusk. The feature header states the hours.

**Common recipe of every shot** (each scenario starts from the saved fixture, so nothing carries over; the story is carried by what each scenario sets): save `Nelims-tribe` loaded; presentation mode on; colonist bar, alerts, resource readout, learning helper, tooltips, selection brackets and item and name labels hidden; `I set the hour to N` and `I set the weather to "Clear"`; map temperature set to 20 degrees (no sweat or blush on Nelim); animals kept out of the place, then ours spawned; Nelim placed, dressed, face set **last** and in one call (`Nelim has her own face`, then at most one part step, then the expression); a few frames before the capture; decor removed at the end.

#### Shots, with the transition into each

| # | file | hour, weather | place and frame | animals (kinds are `Meffalo`, `Boomsloth`) | Nelim | line |
|---|---|---|---|---|---|---|
| 0 | `0-preview.png` | | | | | none (the Preview, byte copy) |
| 1 | `1-dawn-at-the-gate.jpg` | 06, Clear | `enclosure-south`, `I frame the rectangle` around the south gate (159, 207), Nelim and the animal both in frame | one adult meffalo just outside the gate, nose to the bars | inside the pen at the gate, work outfit, relaxed smirk (her own face untouched) | Nelim opens the gate at dawn. Something big is waiting. |
| 2 | `2-two-new-faces.jpg` | 08, Clear | `emerald-clearing`, floor bared, vanometric cell hidden, zoom about 5 | an adult meffalo and an adult boomsloth, three cells apart, **both facing the camera** | not in frame | A meffalo and a boomsloth, face to face at last. |
| 3 | `3-heavy-fur.jpg` | 09, Clear | same clearing, `I frame the animal` on the meffalo at zoom about 3 | the meffalo alone in frame, its dark coat lit from the side | not in frame | The meffalo's dark coat, up close. |
| 4 | `4-calves-play.jpg` | 11, Clear | `enclosure-south`, frame on the middle of the pen | a meffalo calf and a boomsloth calf (life stage step), one adult behind them | not in frame | The calves are safe from the wolves now. |
| 5 | `5-do-not-startle-it.jpg` | 15, Clear | `emerald-clearing`, same frame as 2, wider | the adult boomsloth in the middle | seven cells from it, hat on, brows raised | Nelim keeps her distance. The boomsloth knows why. |
| 6 | `6-boom.jpg` | 15, Clear | exactly the frame of 5 | the boomsloth is killed (`Funny Creatures Renew: "<name>" is killed`) | still seven cells away, unhurt | Boom. |
| 7 | `7-dusk-roll-call.jpg` | 19, Clear | `enclosure-south`, same frame as 1 | the adult meffalo and the calf of 4, resting; **no boomsloth** | at the gate, hat off, small smile | At dusk, the pen is quieter. |

**Transitions, one by one** (what changes between two images, so the series reads as one day and not as seven set-ups):
- **1 to 2** (06 to 08): pen to clearing, camera from the gate to the open ground; the meffalo of 1 is the one of 2 (same name), the boomsloth is new. Light goes from low and warm to flat morning light.
- **2 to 3** (08 to 09): same place, same animal, the camera moves in from the pair to one face. Nelim leaves the frame.
- **3 to 4** (09 to 11): back to the pen; the animals are young. Shadows shorten. The adult behind the calves is the meffalo of 1 and 3.
- **4 to 5** (11 to 15): back to the clearing; Nelim comes back in the frame, now with the hat the story needs for the afternoon sun; the boomsloth is alone. The camera pulls back to take her and the animal in one frame.
- **5 to 6** (same minute): **no change at all but one kill**; frame, hour and Nelim's position stay identical. The two images are a before and an after.
- **6 to 7** (15 to 19): the boomsloth of 5 and 6 is not in the pen; the meffalo and the calf are. A lantern is lit. Nelim has taken off her hat.

**Wardrobe, hair, face, marks** (decided 2026-10-18 from the catalogues of NPT, `PickleTools/ColonistRace/docs/`; nothing is yet seen in a capture):
- **Nelim's outfit**: she keeps the fixture trousers `Apparel_Pants` and corset `Apparel_Corset`; the work layer is **`Apparel_Jacket`** (Shell, covers torso, neck, shoulders and arms, leaves the legs bare so the trousers and the Waistlines cut stay visible) dyed ochre, and **`Apparel_CowboyHat`** (Overhead, UpperHead) dyed cream, both vanilla. The ochre and the cream stand against dark fur and against the earth of a bared clearing. A duster is refused: it covers the legs and hides the trousers. Shots 1, 5 and 6 wear the hat; 2, 3 and 4 have no pawn; 7 wears the jacket only.
- **The first `wears` step undresses everything**, so the scenario re-dresses in order: trousers, corset, jacket, then hat. Re-dressing drops the fixture's own dyes: pick the trousers and corset colours on the first capture and write them into the scenario.
- **Hair**: the fixture's bun stays in every shot; no hairstyle step. The hat sits over it in 1, 5, 6; at dusk the bun is seen. A let-down hairstyle was considered and refused: it adds a step and a hat clash for no story gain.
- **Face** (`FACE-PARTS`, `Generate-FaceGallery`): own face as the fixture default (two brows, `MouthSmirkSmile`, `blink`) on 1. On 5 and 6: `BrowRaised` after the own-face step, then the expression `normal+blink` once, last. On 7: `MouthSmile` with `LidCheerful`. Lids and smiles of VTE need VEFA in the map (GALERIE.md); the sanctuary map has it.
- **Tattoos: none.** Nelim's face is the anchor of the series and her own-face step is validated bare; a tattoo (the catalogue has `Face_Line` and `Face_Stars` among 29) would change the face between shots for nothing the story says. No body tattoo either: the jacket hides the arms.
- **Weapons and held items: none.** A weapon in a shot named "do not startle it" contradicts it, and the animals are the subject. The catalogue of weapons and crafts is read and nothing in it earns a place.

**Other mods' objects, plants, buildings, animals** (props are credited in the Steam description and the thanks; nothing staged ships with this mod; every mod below joins the `-DepMap` of the **gallery pass only**, which is not written yet):
- **Plants (vanilla)**: `Plant_Daylily` placed fully grown along the pen fence in 1 and 7 (colour against dark bars, as played in other galleries); `Plant_YellowTallGrass` in the middle of the pen in 4 as straw for the calves.
- **Objects and buildings**: the pen already holds its laying boxes (`EggBox`, vanilla): leave them, they say "farm". **`DR_StickLantern`** (Stick Lantern Continued, `Mlie.StickLantern`, 2024351846, played in CreaturesOfKiRenew) lit at the gate in 7: the only third-party prop of the plan. A big animal bed (`GSAnimalBedBigPrestige`, `Animal.BedsNew`, 3107972819) under the resting calf in 7 is **optional**: the `LayDown` job must be run until the posture is not standing; dropped if the capture does not show the calf on it.
- **Animals**: ours, only. The fixture's own fauna (bison, horses, huskies, boomalopes) is kept out of both frames with `the animals are kept out of the sanctuary`. **A wolf** beyond the fence in 4 is optional and only if it reads; without it, the line of 4 becomes "The calves play in the straw." Nothing from the four optional animal mods (ADS 2, Nocturnal, Crossbreeding, Dogs mate) is shown: they have no look to photograph.
- **Traps taken from NPT's notes**: `the floor is bared` only in `emerald-clearing` (in `enclosure-south` it paints a dark patch); hide the vanometric cell before framing the clearing; light a dark place with torches, never by removing a roof; spawn nothing within five cells of Nelim in 5 and 6 (the adult blast radius is 4.9, `02-the-boomsloth-explodes`), and nothing of ours within five cells of the boomsloth in 6.

**What the first run must settle** (listed, not assumed): the animals' facing (no step known sets it; if it cannot be set, shot 2 is taken from several spawn positions until one pair faces the camera, or NPT is asked for a step); the exact cells of Nelim, the gate and the animals; the tick count after the kill that catches the flame (three candidates at 2, 6 and 12 ticks, or one frame of the `@film`); the colours of the jacket, hat, trousers and corset against the fur; whether `Plant_YellowTallGrass` reads as straw; whether a calf stage step exists for both of our kinds (otherwise NPT).

Rules kept: the two animals are seen from the front on image 2. A capture of a game window (the health tab with a prosthetic, the info card) gets no subtitle and is cropped. Each clean original goes to `Art/Gallery-clean/` under the same name; `scripts/Add-Subtitle.ps1` writes the subtitled file to `Art/Gallery/`. The line of 7 is true only if the capture shows the pen without the boomsloth; if it does not, the line is rewritten. A third image of the health tab offering a prosthetic on a meffalo (ADS 2) stays out of the story: it needs a scenario that opens it and the pass with the optional mods.

## Thank-you posts

Only after the item is visible to its readers, and only what is true and played. One comment per page, ever, and the registry
`WORKSHOP_COMMENTS.md` decides whether one is still needed.

| Recipient | Workshop | Registry | Action |
|---|---|---|---|
| Funny Creatures (PredatorKing) | 2640466629 | no row | Draft below. It is also how the author can reach me to ask for a takedown |
| Better Crossbreeding (DizzyEevee) | 3520675842 | no row | Draft below, after pass 3 has played |
| A Dog Said... Animal Prosthetics 2 | 3238353862 | `posted` | Add this mod to `Covers`. Post nothing |
| [XND] Nocturnal Animals (Continued), Mlie and XeoNovaDan | 2269731409 | `posted` | Add this mod to `Covers`. Post nothing. The original page (2004368312) stays `not_applicable` |
| Pickle, RimLogging | 3791648678, 3733484696 | `posted` | Add this mod to `Covers`. Post nothing |
| PickleTools | 3806142401 | `not_applicable` | Same author |

`<ID>` is the id of this mod's item, known only once it exists.

**For PredatorKing**, on the page of the original:

```
Hi PredatorKing :) your meffalo and boomsloth were stuck at 1.3, so I carried them to 1.6, credit and all: [url=https://steamcommunity.com/sharedfiles/filedetails/?id=<ID>]Funny Creatures Renew (unofficial)[/url]. The boomsloth explodes again, which felt like the point. If you want it down, say so and it goes.
```

**For DizzyEevee**, on the page of Better Crossbreeding:

```
Thanks for Better Crossbreeding, DizzyEevee. I wanted my meffalo and boomsloth to breed with their vanilla cousins, and it works with [url=https://steamcommunity.com/sharedfiles/filedetails/?id=<ID>]Funny Creatures Renew (unofficial)[/url]. In case it helps someone: the example patch spells the class Crossbreeding, the dll says CrossBreeding :)
```

## Dependencies and DLC

| Item | Decision | Why |
|---|---|---|
| Hard dependency | **None** | The code is XML only. `modDependencies` is empty and the offline suite asserts it stays so |
| Expansions | None required | `loadAfter` names Core and the five expansions, which only orders loading. Checked offline (every referenced def exists in Core); pass 5 shows it at run time, if the owner keeps it |
| A Dog Said... Animal Prosthetics 2 | Optional, `loadBefore` | It copies its category lists once, at its own last patch, so this mod has to load first |
| Nocturnal Animals (Continued), Better Crossbreeding | Optional, no order | They read what is loaded at run time |
| The original Funny Creatures | `incompatibleWith` | Both define `Meffalo`, `Boomsloth`, `WoolMeffalo` and `Leather_Darkfur`. Pass 4 looks at whether that is still true |
| Storytime Rides Again (`TSP.Isengriff.Storytime`) | **Declared incompatible** (owner, 2026-09-28) | Same defNames |

## Content questions

Answered only when the gallery exists and its images have been opened: a file name does not say what a picture holds, and these
boxes commit the page. **Not answered yet.** The likely answer is that there is nothing to declare: two animals, and an
explosion in the game's own cartoon style, with no gore. It stands on the images actually chosen.

## After the upload, which cannot be caught up

- Commit `Mod/About/PublishedFileId.txt` **immediately**. Lost, the next upload creates a second item.
- Steam creates every item **private** and RimWorld never sets its visibility. The owner subscribes to it, tests it, then makes it
  public by hand, subscribes to its comments and watches its activity and its parents' (`PUBLISHING.md`).
- `CHANGELOG.md` opens with `## [0.1.0]` "creation of a publishIdFile", with the commit `Add published Workshop file ID for 0.1.0`,
  and `## [1.0.0]` stays `unreleased` above it until the CI publishes it. The CI creates the tag and the release after a good
  upload: not by hand.
- The publication is by CI: a dry-run of the exact SHA first, `publish` with the 40-character SHA, and only the owner approves
  `steam-production`. `generate-publish-workflow.sh` writes into `.github/` and waits for the owner's word.

## Open, and the owner's

1. **Decided by the owner, 2026-09-28**: the tool is DALL-E (named in the description); the icon stays at 32 px; the Storytime
   pack is declared incompatible; no pairing joins two vanilla animals (the recipe is dropped); the vanilla side is Animal Naturally's.
2. **The rollback target**, chosen before publishing and not after a red: the last commit whose runs are all green.
3. **The gallery**, and with it the answer to the content questions.
4. **The prepublication `0.1.0`**, an act of the owner's: the in-game upload button on the folder `Mod/`.
