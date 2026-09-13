# Test scenarios

Four Def files, two French translation files, seven animal textures, no assembly, no patch operation. There is very little here to
break, and both things that *were* broken broke **silently**. That is the whole reason this mod
needs the game rather than a file checker.

**An empty log is not a pass.** Neither fault this port repairs writes an error. A `<wildness>`
element that matches no field logs one warning among hundreds at startup, and the animal loads and
looks perfectly normal afterwards. A `deathActionWorkerClass` sitting flat inside `<race>` logs
**nothing at all** in 1.6: the element is simply not read, and a boomsloth dies quietly. Only the
information card settles the first, and only killing one settles the second.

The compatibility repairs preserve the original animal textures. Most of what
follows asks one question: *did PredatorKing's two animals survive the move intact?* The exceptions
are B, C and D, which test the two repairs and the one consequence that shows in play, and **N**,
which tests the single change this port makes on purpose rather than to restore something.

## Load order

```
nelim.funnycreaturesrenew    this mod    after Core and all official expansions
```

`<loadAfter>` names Core and the five expansions, which is all this mod needs: both animals inherit
`AnimalThingBase` and `AnimalKindBase` from Core, the wools inherit `WoolBase` and the leather
`LeatherBase`. The definitions and their French translations need Core only: no Harmony, framework or DLC.

**The original must stay off.** `predatorking.funnycreatures`
([2640466629](https://steamcommunity.com/sharedfiles/filedetails/?id=2640466629)) defines the same
four defs under the same `defName`s: `Meffalo`, `Boomsloth`, `WoolMeffalo`, `Leather_Darkfur`.
About.xml declares the original package in incompatibleWith. The mod list must warn about this pairing. Keep the original disabled for normal play; scenario L verifies the warning.

Nothing else in the local collection defines either animal. Funny Creatures was once merged into
Nelim's Animal Ark, but `AnimalArk/` no longer contains a `Meffalo` or a `Boomsloth`, checked on
2026-09-12. Vanilla's **megasloth** and **muffalo** are different defs and different animals, and
are only a nuisance in the debug search box.

## What to search the log for

`Player.log` sits in
`%USERPROFILE%\AppData\LocalLow\Ludeon Studios\RimWorld by Ludeon Studios\Player.log`.

| String in the log | Written by | What it would mean for this mod |
|---|---|---|
| `doesn't correspond to any field` | `DirectXmlToObject.ObjectFromXml` | The first of the two faults this port exists to fix. Expected count naming `wildness`, `deathActionWorkerClass` or `RaceProperties`: **zero**. One line naming either means an old form came back. |
| `Could not load UnityEngine.Texture2D` | `ContentFinder<Texture2D>.Get` | A `texPath` with nothing behind it. The line names the path, so it says whether it is `funnycreatures/Meffalo`, `funnycreatures/Boomsloth` or the dessicated one. |
| `Failed to find any textures at` | `Graphic_Multi.Init` | The same fault one level up: no rotation found at all. |
| `Could not find parent node named` | `XmlInheritance.ResolveParents` | One of the four Core templates is gone: `AnimalThingBase`, `AnimalKindBase`, `WoolBase` or `LeatherBase`. This mod declares no abstract def of its own. |
| `Could not find type named` | `DirectXmlToObject.ClassTypeOf` | The only `Class=` attributes here are `CompProperties_Shearable`, `CompProperties_Milkable` and `AudioGrain_Folder`, plus the `workerClass` in scenario C. A line here names which one Core renamed. |
| `Adding duplicate` | `DefDatabase.Add` | The original mod is enabled alongside this port. Scenario L. |
| `Could not resolve cross-reference` | `DefDatabase.ResolveAllReferences` | A def this mod points at is missing. All eight were confirmed present in 1.6 on 2026-09-12: `Flake`, `Chemfuel`, `WoolMegasloth`, `Leather_Heavy`, `QuadrupedAnimalWithHooves`, `QuadrupedAnimalWithPawsAndTail`, and the two Core templates. |

Lines naming other mods are not ours to fix, and are worth leaving in whatever gets pasted back.

---

## A — both animals exist, and draw

The baseline. Everything else assumes this one passed.

- Dev mode on, spawn `Meffalo` and `Boomsloth` with the debug spawn-pawn action. Searching
  "muffalo" also returns vanilla's; searching "sloth" also returns vanilla's **megasloth**. The
  ones wanted are labelled exactly *meffalo* and *boomsloth*.
- Both draw, walk, and are listed in the Wildlife tab. Finding them there proves nothing about
  natural spawning, since you put them there; scenario J is the one that settles that.
- **The meffalo is near-black with a pale face mask**, and is large: body size 3.5, drawn at 4 for
  an adult. The boomsloth is brown with a cream mane, body size 4.0, drawn at 3.8.
- A meffalo drawn at the size of a husky means the `<race>` block did not load, and scenario B
  will confirm it.

## B — wildness reads on the information card

The first repair, and the only place it shows as a number.

- Open each animal's information card, Stats tab.
- **Wildness is listed: 60% on the meffalo, 97% on the boomsloth.** *Listed* is the point.
  `Wildness` declares `showIfUndefined` false, so the broken form did not print a wrong number, it
  printed **no line at all**. An absent row is the failure, not a zero.
- 97% on the boomsloth is close to the vanilla ceiling. It is meant to be: the animal is a
  megasloth crossed with a bomb.

## C — the boomsloth explodes when it dies

The second repair, and the one the animal is named for. **This is the scenario that justifies the
port.** Before the fix the explosion had simply stopped happening, with nothing in the log.

- Spawn a boomsloth in the open, well away from anything that can burn, and kill it. Dev mode's
  damage tool, or a colonist with a gun.
- **A large explosion goes off where it died.** Flame damage, a wide radius, fire on the ground.
- The reference is **vanilla's boomalope**, which declares the identical
  `<deathAction><workerClass>DeathActionWorker_BigExplosion</workerClass></deathAction>`. If the
  boomsloth's blast looks materially smaller than a boomalope's, the block did not load and
  something reverted. Kill one of each in the same session if there is any doubt.
- Confirm the corpse is destroyed by its own explosion rather than left on the ground.

**Then do it indoors, once, deliberately.** A dead boomsloth in a wooden barn should take the room
with it. That is the documented behaviour and the warning the description gives; seeing it once is
worth more than reading it.

## D — taming is hard again

The consequence of B, and the only place the old bug was visible in play rather than on a card.

With the broken form the stat fell back to its default of `-1`, which is outside the range the game
uses, and **both animals tamed for almost nothing**. That is what a player would actually have
noticed, without ever knowing why.

- Spawn a wild meffalo and a wild boomsloth and send an animal handler at each.
- The meffalo at 60% wildness is comparable to a vanilla muffalo. **The boomsloth at 97% should be
  close to refusing**, on the order of a thrumbo: many attempts, high-skill handler, and a real
  chance of failure each time.
- A boomsloth that tames on the first try with a skill-4 handler means the stat did not take.
  Re-run B before concluding anything else.
- Tame-failure also matters here: `manhunterOnTameFailChance` is 0.10 on the meffalo and **0.30 on
  the boomsloth**. Expect a failed attempt to turn one hostile roughly a third of the time, and
  remember what an angry boomsloth becomes when it dies.

## E — the meffalo is milked for flake

One of the two jokes the mod is built on, and it is not a vanilla behaviour anywhere.

- Tame a meffalo, wait, and let a handler milk it.
- **The output is `Flake`**, the drug, not milk. 20 per milking, one every 6 days.
- `milkFemaleOnly` is false, so **a male meffalo gives flake too**. Test one deliberately; this is
  the setting most likely to be lost in a port, and it is silent when it goes.
- The flake stacks with any other flake in the colony and is usable as the drug is.

## F — the boomsloth is milked for chemfuel

The other joke, and the one that has a vanilla comparison.

- Tame a boomsloth and let a handler milk it. **The output is `Chemfuel`**, 20 every 6 days, males
  included.
- Vanilla's boomalope gives 11 every **1** day. The boomsloth is therefore about a sixth as
  productive per day. That is the original's balance and the port did not touch it; it is recorded
  here so that a future reader does not "fix" it thinking something was lost.

## G — shearing, both animals

- **Meffalo**: 125 of `WoolMeffalo` every 15 days.
- **Boomsloth**: 200 of `WoolMegasloth` every 20 days, which is vanilla's own megasloth wool and
  stacks with it.
- `WoolMeffalo` is a new def and its colour is `(33,33,32)`, near-black. Weave something from it
  and confirm the cloth is nearly black rather than the default wool colour.
- Its insulation is the point of it: 40 cold, 30 heat. Compare a meffalo-wool parka against a
  megasloth-wool one on the same pawn.

## H — butchering, and what each animal leaves

- **Meffalo** butchers to `Leather_Darkfur`, labelled *dark fur*, and *meffalo meat*. Dark fur is
  also `(33,33,32)`, and carries a Beauty factor of 3, so furniture made from it should read as
  notably pretty in the inspect pane.
- **Boomsloth** butchers to `Leather_Heavy`, vanilla's heavy fur, and *boomsloth meat*.
- **Butchering a boomsloth corpse must not explode.** The death action fires when the animal dies,
  not when the corpse is processed. If a butcher table detonates, something is wired wrong. Note
  that getting a corpse at all requires the animal to die without its own blast destroying it,
  which in practice means slaughter rather than combat.

## I — training, hauling and the herd

- Both animals are `Advanced` trainability: Obedience, Release, Rescue and Haul should all be
  offered. Advanced on a 97%-wildness animal is deliberate, and it is what makes the boomsloth
  worth the trouble.
- **The meffalo is a pack animal.** It should be selectable for a caravan and carry gear. At mass
  853 and body size 3.5 it should carry more than a vanilla muffalo.
- **The meffalo is a herd animal.** Spawn three or four wild and confirm they move as a group and
  do not scatter.
- The boomsloth is neither, and should not appear in the caravan pack list.

## J — they spawn in the wild

Unlike some ports in this collection, these two are genuinely wild animals, and the About file does
not say so. Worth confirming, since the numbers are small.

- Declared biomes, both animals: arid shrubland, temperate forest, tropical rainforest, ice sheet,
  boreal forest and tundra. **Desert is explicitly 0.** Nothing else.
- Meffalo commonality runs 0.01 to 0.04 depending on biome, the boomsloth half that. These are low.
  Use dev mode's wildlife regeneration on a boreal forest or tundra map rather than waiting.
- Meffalo wild group size is 1 to 3. The boomsloth declares none, so it arrives alone.

## K — traders carry them

The lesson of A Sloth Mod, which declared a trade tag that appears in **no** trader's list and so
could never be bought. That is not the case here, and this scenario records the check.

- Trade tags: meffalo `AnimalUncommon`, `AnimalFarm`, `AnimalFighter`; boomsloth `AnimalUncommon`,
  `AnimalFighter`. All three appear in Core's trader definitions, confirmed on disk 2026-09-12:
  `AnimalFarm` in 22 places, `AnimalUncommon` in 9, `AnimalFighter` in 5, across neolithic and
  outlander bases, caravans and orbital traders.
- Call a bulk goods or exotic animal trader with dev mode until one carries either animal. The
  point is only to see it happen once.

## L — original-mod incompatibility warning

Preconditions: RimWorld 1.6, this distribution installed, and the original Funny Creatures
available but disabled. Use a disposable configuration; do not load a valued save with both enabled.

- Open the mod list and enable both packages in the pending selection.
- Expect a visible incompatibility warning for `predatorking.funnycreatures` and this port.
  The declaration warns about the combination; it does not merge or rename duplicate definitions.
- Disable the original again and retain only this continuation. The incompatibility warning clears.
- Restart with Core and this continuation and execute A-C. There must be only one of each animal,
  no duplicate-definition messages for this mod, and the ported wildness and explosion behavior.
- Record the game version and observed warning. Do not add or remove XML as part of this scenario:
  the declaration is already shipped, and a source mutation would invalidate the tested artifact.

## M — the dessicated corpse

A known upstream defect, left as it is. This scenario confirms it is only cosmetic.

- Kill a boomsloth without destroying the corpse, and let it dry out, or use dev mode to age a
  corpse.
- `funnycreatures/Dessicated/Dessicated_Boomsloth_east.png` is the **only** dessicated texture in
  the mod. `Graphic_Multi` does not fall over: it builds the other faces by rotating the east one.
  Expect a slightly odd corpse from the north and south, not a missing texture and not a pink box.
- The meffalo has no dessicated texture at all and borrows vanilla's muffalo one, which is declared
  explicitly and is correct behaviour.
- Fixing either would mean drawing, not porting. See the scope note in the repository.

## N — no predator hunts a boomsloth, calves included

The one behaviour this port adds rather than restores, and the scenario that checks it took.

The boomsloth's `<race>` now declares `canBePredatorPrey` false, as the base game's boomalope does.
The reason is the explosion: a predator that kills one starts a fire nobody chose to start.

**Test the calf, not the adult.** The adult was never reachable, and the flag changes nothing for
it. Prey selection vetoes on body size first, and the largest `maxPreyBodySize` in the base game and
all five expansions is the bear's **3**; an adult boomsloth is **4.0**. Watching an adult go
unhunted therefore proves nothing about the flag, and would have looked the same before it.

The exposure was the young, and these are the numbers behind it:

| Life stage | Body size | Under a bear's ceiling of 3? |
|---|---|---|
| Calf | 0.8 | yes |
| Juvenile | 2.0 | yes |
| Adult | 4.0 | no |

- Spawn a **baby** boomsloth and a grizzly bear on the same map, let the bear go hungry, and leave
  them to it. The bear must never take the calf. A warg is the other case worth running: it clears
  the checks by a narrow margin, so it is the most likely to slip through if the flag failed to
  load.
- To see what is being prevented, comment the flag out and run the same pair again. The bear takes
  the calf and the calf explodes. That control is worth doing once, because a passing test here
  looks exactly like nothing happening.
- **Colonists must still be able to hunt them.** The flag governs animal predators only. Order a
  hunt on an adult boomsloth and confirm the job is offered and completes; if that broke, the fix
  costs more than it saves.

**What this does not do.** The flag is absolute: predators will not touch a boomsloth even when
starving. The base game offers no middle setting, because `FoodUtility.IsAcceptablePreyFor` has no
hunger term of any kind; hunger decides *whether* a predator goes hunting, never *what* it is
willing to take. A starving exception would need a Harmony patch and an assembly, which this mod
does not have.

## O — the sounds

Small, but they are a separate def file and they are the only place the port could have lost
something without any visible sign.

- The meffalo's four sounds draw on vanilla's **muffalo** clip folders, pitched down to
  0.48 to 0.74 where vanilla sits at 0.98 to 1.14. It should sound like a muffalo about an octave
  lower. That is the original's choice and it is what makes the animal read as bigger.
- The boomsloth borrows **thrumbo** sounds outright, unmodified.
- The reversed `volumeRange` of `15.42672~14.7734` in the call is copied verbatim from vanilla's own
  `Pawn_Muffalo_Call`. It is not a fault introduced here and needs no repair.

## P — English and French UI

Preconditions: scenario A passes; use Core plus this mod on a disposable map, with both adult
animals, a meffalo calf, butchered meat, meffalo wool and dark fur leather available.

- Set the game language to English and restart. Inspect animal information, attacks, meat,
  the meffalo calf, wool and leather. Expect the English source labels/descriptions, readable
  without unresolved keys or clipped text.
- Repeat in French after restarting. Expect the French descriptions, tête/sabot/griffe attack
  labels, viande de meffalo/boomsloth, veau meffalo, laine de meffalo and fourrure sombre.
  Species names meffalo and boomsloth intentionally remain unchanged.
- Inspect generated labels and plurals as well as the inventory cards. Capture any English fallback,
  raw path, missing translation, malformed text or clipping as a failure with the exact screen.
- Check Mod options and the main button bar: this content mod has no empty settings page or shortcut.
  RIMMSQOL and settings persistence are not applicable; no integration is claimed as tested.
- Review Player.log after each language run. Expect no translation/DefInjected errors for this mod.

## Q — new game and existing saves

Preconditions: back up an existing 1.6 save without this mod and a save already containing these
animals/resources if available. Use copies only. Record the exact mod list and game version.

- Start a new game with Core plus this mod, perform A-C and E-H, save, exit, restart and reload.
  Expect both species and their inventories to remain, with the same production definitions,
  wildness and predator protection. Check the log for unresolved defs and load exceptions.
- Enable this mod on a copy of an existing vanilla save, reload, spawn both animals and repeat
  A-C. Save and reload again: added animals and resources must persist without load errors.
- If a previous continuation/original save is available, load a copy with only this continuation
  enabled (the original disabled). Verify existing animals, wool/leather, training and production
  survive through a save/reload. If no such save is available, mark this migration case unverified.
- Repeat the relevant information-card checks in FR and EN as described in P. Do not infer a
  migration pass from a new-game pass. Removing this content mod mid-save is unsupported and
  loses its entities; that documented limitation is not a promised migration feature.

## Automated checks and result recording

Run from the repository root with Python 3 and PowerShell 7. Core-reference checks require a
local RimWorld 1.6 installation (`RIMWORLD_DIR` can override the default Steam location).

```powershell
python Tests/test_mod.py
& ../scripts/Check-DefInjected.ps1 -TransMod (Join-Path (Get-Location) 'Mod')
```

The second command is the shared workflow checker, outside this standalone repository. It needs
RimWorld's managed assemblies. Supply its actual path if running from another checkout location.
It validates engine field paths and translation handles; the Python suite independently derives
coverage from the source Defs and checks production, port regressions, references and packaging.
Neither command executes the game. No build/custom-C# unit suite is applicable to this XML-only mod.

For Preview changes, install/use Playwright and Pillow, then run:

```powershell
node Art/render-preview.cjs
python Art/check-contrast.py
```

The renderer requires Chrome, waits for fonts and the source image, and writes the final Preview,
a thumbnail, a background measurement image and font/layout evidence in Art/. Palette values come
only from Art/preview-palette.json. Inspect both final and thumbnail images after each render.

Tests/RESULTS.md records the latest static results and distribution hashes. For each in-game
scenario A-Q, record date, game version, mod list, language, save/new-game context, actions,
observed outcome, PASS/FAIL and log/screenshot paths. All are currently UNVERIFIED; written
expectations are not execution results. Keep prior results and rerun affected regressions after fixes.