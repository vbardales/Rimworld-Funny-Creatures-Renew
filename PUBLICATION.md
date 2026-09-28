# Publication: Funny Creatures Renew (unofficial)

What the Workshop page asks for and the repository holds nowhere else: the description, the change note, the order of the
captures, the messages to the mods this one is built on, the dependencies, and the answer to the content questions. It serves
twice: for the first upload, and for whoever takes the mod over.

**State, 2026-09-28: a draft, not final.** Nothing has been uploaded and no item exists (`Mod/About/PublishedFileId.txt` is
absent). The stage is `done`; `prepublished` needs `tested` first, and no scenario has been played yet. The open items are at the
end, and they are the owner's. The rules this follows are in `PUBLISHING.md` and `AUDIT.md`, steps `tested -> prepublished` and
`prepublished -> published`.

## Steam description

The single source, in Markdown: the CI converts it to the Steam description (BBCode) and to the plain-text `<description>` of
`Mod/About/About.xml`, and stops when they differ. **`About.xml` still carries the hand-written text of 2026-09-20 plus the
compatibility paragraph of 2026-09-28; it is regenerated from this block, not the other way round, once the runs are done** and
`Mod/` is free to change again (a request is staged from the working tree when it plays).

The block opens with the UNOFFICIAL paragraph, has the blocks `IF I GO QUIET`, `AI-GENERATED` and `THANKS` in that order after
the body, then the pointer to `ATTRIBUTION.md` and the licence, and ends with the source link. It contains no code fence.

```markdown
UNOFFICIAL. This mod is published without the original author's explicit consent. If the original author contacts me to request its removal, I undertake to take it down promptly.

The meffalo and the boomsloth, brought forward to RimWorld 1.6. Two animals that turn fodder into contraband.

I am not the author of this mod. Both animals are PredatorKing's; this update ports them to 1.6 and adds the predator protection described below. Credit goes to them, mistakes in the update are mine. If they come back to it, or ask me to take this down, it comes down.

Original mod: [Funny Creatures](https://steamcommunity.com/sharedfiles/filedetails/?id=2640466629), last supporting 1.3, last updated in October 2021. Abandoned, not withdrawn.

**WHAT IT ADDS**

Two animals, both trainable to Advanced, and both milkable in a way no vanilla animal is.

The meffalo is a muffalo in everything but its udder: body size 3.5, fifty-five years of life, wildness 0.6, and it is milked for flake rather than milk. It is shorn for meffalo wool; butchering yields dark fur leather.

The boomsloth is a megasloth that goes off. Body size 4.0, wildness 0.97, fifteen years, and it explodes when it dies, with the vanilla big explosion, so a dead boomsloth takes the room with it. It shears megasloth wool and is milked for chemfuel.

**WHAT CHANGED IN THE 1.6 UPDATE**

Two compatibility repairs restore the original behaviour. Wildness stopped being a field of RaceProperties in 1.6 and became a stat declared under statBases: the old form is not an error, it is simply never read, and the stat defaults to -1, outside the range the game uses, so both animals tamed for almost nothing instead of sitting at 0.6 and 0.97. And the boomsloth's death action moved: a flat deathActionWorkerClass inside race became a deathAction block holding a workerClass, and the flat form is no longer read at all, which means the explosion had stopped happening, on the animal named for it.

Production quantities and other numeric balance values are unchanged. One behaviour is added: wild predators no longer hunt boomsloths, calves included, since a predator that kills one sets off the explosion. Colonists can still hunt them.

**COMPATIBILITY**

Nothing is required. Three patches apply only when the other mod is loaded, and change nothing otherwise.

- [A Dog Said... Animal Prosthetics 2](https://steamcommunity.com/sharedfiles/filedetails/?id=3238353862): both animals get its medieval, simple prosthetic and bionic surgeries.
- [Nocturnal Animals (Continued)](https://steamcommunity.com/sharedfiles/filedetails/?id=2269731409): the boomsloth is nocturnal, like the megasloth it comes from. The meffalo stays diurnal, like the muffalo.
- [Better Crossbreeding](https://steamcommunity.com/sharedfiles/filedetails/?id=3520675842): the meffalo and the muffalo interbreed, and so do the boomsloth, the megasloth and the boomalope. A megasloth and a boomalope that mate produce a boomsloth, which is how the boomsloth is described.

The original Funny Creatures defines the same defs and is declared incompatible.

Content mod: removing it mid-save will lose any meffalo or boomsloth, and any meffalo wool or dark fur already in play.

**IF I GO QUIET**

If I do not answer within a reasonable time after being contacted, anyone may freely update this or any other of my mods, including publishing a continuation of it. All credit must be preserved.

**AI-GENERATED**

The update work, code, tests and documentation, was done with the help of AI assistants: Claude, by Anthropic, and Codex, by OpenAI. The Preview and the icon are AI-generated images.

**THANKS**

- PredatorKing, for the meffalo, the boomsloth and their textures.
- SamBucher, for A Dog Said... Animal Prosthetics 2; Mlie and XeoNovaDan, for Nocturnal Animals; DizzyEevee, for Better Crossbreeding. Their files were read to write the patches, and nothing of theirs was copied.
- The tools this was tested with, for development only and never a dependency: [Pickle](https://steamcommunity.com/sharedfiles/filedetails/?id=3791648678), [RimLogging](https://steamcommunity.com/sharedfiles/filedetails/?id=3733484696) and PickleTools.

Licence and sources: the original states no licence anywhere, and this port rests on the Workshop's own custom for abandoned mods, named credit and a takedown on request. `ATTRIBUTION.md`, in the mod folder and on GitHub, has the licence check and the port in detail.

[Source code on GitHub](https://github.com/vbardales/Rimworld-Funny-Creatures-Renew)
```

## Steam change notes

Written now, sent when the item goes up; they start with the version, alone on the first line, in BBCode. A first release has no
previous tag.

```
### 1.0.0
[b]1.0.0[/b]
First release of the 1.6 update of Funny Creatures, by PredatorKing.
[list]
[*] The boomsloth explodes again: its death action moved in 1.6 and the old form was silently ignored.
[*] Wildness is read again on both animals, so they are as hard to tame as they were meant to be.
[*] Wild predators no longer hunt boomsloths, calves included.
[*] Optional patches for A Dog Said... Animal Prosthetics 2, Nocturnal Animals (Continued) and Better Crossbreeding.
[*] French translation.
[/list]
```

## Gallery

**Not produced.** The gallery is a manual step on the Steam page (SteamCMD sends the header image only), from a folder that holds
the images to upload numbered `01-`, `02-`, `03-` in page order and nothing else. The captures come from the Pickle scenarios tagged
`@review`, which makes them reproducible; a green scenario proves the path ran, not that the image shows anything, so **every image is
opened and read before it goes in the folder.**

Steam shows the first image large, so the most demonstrative one goes first, not the prettiest:

| # | Image | Source | Why here |
|---|---|---|---|
| 01 | The boomsloth's explosion, one frame taken from the film of `02-the-boomsloth-explodes` | the `@film` scenario | It is the one thing the animal is named for, and the one thing a screenshot of a livestock pen cannot say |
| 02 | The two animals side by side, zoomed | `01-the-animals`, capture `the-two-animals` | Shows what is being installed |

A third image, of the health tab offering a prosthetic on a meffalo (ADS 2), is possible from the pass with the optional mods but
would need a scenario that opens it; not planned. The zoom must be close enough that the animals are seen, on the default scale a
small animal is lost in the map (owner, 2026-09-26).

## Thanks to post

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
| Storytime Rides Again (`TSP.Isengriff.Storytime`) | **Undecided** | Same defNames. Recommended: declare it incompatible |

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

1. **The tool that generated the Preview and the icon** is not recorded anywhere in this repository, and the description must name
   the real tool rather than "an AI tool" (`PUBLISHING.md`).
2. **The three decisions in `STATUS.md`** that change the description if they go the other way: the Better Crossbreeding recipe, the
   patch touching vanilla animals, and declaring the Storytime pack incompatible.
3. **The rollback target**, chosen before publishing and not after a red: the last commit whose runs are all green.
4. **The gallery**, and with it the answer to the content questions.
5. **The prepublication `0.1.0`**, an act of the owner's: the in-game upload button on the folder `Mod/`.
