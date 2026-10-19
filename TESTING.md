# Test scenarios

Four Def files, two French translation files, seven animal textures, three optional patch files, no assembly. Little here to
break. Both things that *were* broken broke **silently**. That is whole reason mod
needs game, not file checker.

**Empty log not a pass.** Neither fault this port repairs writes error. `<wildness>`
element matching no field logs one warning among hundreds at startup; animal loads, looks normal after. `deathActionWorkerClass` flat inside `<race>` logs
**nothing at all** in 1.6: element simply not read, boomsloth dies quietly. Only
information card settles first, only killing one settles second.

Compatibility repairs preserve original animal textures. Most of what
follows asks one question: *did PredatorKing's two animals survive move intact?* Exceptions
are B, C, D, which test two repairs and one consequence shown in play, and **N**,
which tests single change port makes on purpose, not to restore something.

## Load order

```
nelim.funnycreatures    this mod    after Core and all official expansions
```

`<loadAfter>` names Core and five expansions, all mod needs: both animals inherit
`AnimalThingBase` and `AnimalKindBase` from Core, wools inherit `WoolBase`, leather
`LeatherBase`. Definitions and French translations need Core only: no Harmony, framework, DLC.
Three files under `Patches/` name other mods, apply only when loaded. About.xml also declares
`<loadBefore>SamBucher.ADogSaidAnimalProsthetics2</loadBefore>`: ADS 2 copies lists once, so this mod loads first.

**Original must stay off.** `predatorking.funnycreatures`
([2640466629](https://steamcommunity.com/sharedfiles/filedetails/?id=2640466629)) defines same
four defs under same `defName`s: `Meffalo`, `Boomsloth`, `WoolMeffalo`, `Leather_Darkfur`.
About.xml declares original package in incompatibleWith. Keep original disabled for normal
play; scenario L checks whether incompatibility still true.

Nothing else in local collection defines either animal. Funny Creatures once merged into
Nelim's Animal Ark, but `AnimalArk/` no longer contains `Meffalo` or `Boomsloth`, checked
2026-09-12. Vanilla **megasloth**, **muffalo** are different defs, different animals, only
nuisance in debug search box.

**One thing outside local collection does define them**, found 2026-09-28: pack Storytime
Rides Again: a New Chapter (`TSP.Isengriff.Storytime`) carries retuned copy of both animals, same
def names (see `ATTRIBUTION.md`). Not installed here, **not declared
incompatible** by this mod, so no pass covers it. Whether to declare it, then add second
incompatibility pass, is open decision in `STATUS.md`.

## What to search the log for

`Player.log` sits in
`%USERPROFILE%\AppData\LocalLow\Ludeon Studios\RimWorld by Ludeon Studios\Player.log`.

| String in the log | Written by | What it would mean for this mod |
|---|---|---|
| `doesn't correspond to any field` | `DirectXmlToObject.ObjectFromXml` | First of two faults port fixes. Expected count naming `wildness`, `deathActionWorkerClass` or `RaceProperties`: **zero**. One line naming either means old form came back. |
| `Could not load UnityEngine.Texture2D` | `ContentFinder<Texture2D>.Get` | `texPath` with nothing behind it. Line names path, so says whether `funnycreatures/Meffalo`, `funnycreatures/Boomsloth` or dessicated one. |
| `Failed to find any textures at` | `Graphic_Multi.Init` | Same fault one level up: no rotation found. |
| `Could not find parent node named` | `XmlInheritance.ResolveParents` | One of four Core templates gone: `AnimalThingBase`, `AnimalKindBase`, `WoolBase` or `LeatherBase`. Mod declares no abstract def of own. |
| `Could not find type named` | `DirectXmlToObject.ClassTypeOf` | Only `Class=` attributes here: `CompProperties_Shearable`, `CompProperties_Milkable`, `AudioGrain_Folder`, plus `workerClass` in scenario C. Line names which one Core renamed. |
| the original's `<wildness>` and flat `deathActionWorkerClass` errors | the XML loader | Original mod enabled alongside port (run 1c89: NO "Adding duplicate" line logged for shared defs). Scenario L. |
| `Could not resolve cross-reference` | `DefDatabase.ResolveAllReferences` | Def this mod points at missing. All eight confirmed present in 1.6 on 2026-09-12: `Flake`, `Chemfuel`, `WoolMegasloth`, `Leather_Heavy`, `QuadrupedAnimalWithHooves`, `QuadrupedAnimalWithPawsAndTail`, two Core templates. |

Lines naming other mods not ours to fix, worth leaving in whatever gets pasted back.

---

## A — both animals exist, and draw

Baseline. Everything else assumes this passed.

- Dev mode on, spawn `Meffalo` and `Boomsloth` with debug spawn-pawn action. Searching
  "muffalo" also returns vanilla's; "sloth" also returns vanilla **megasloth**. Wanted
  ones labelled exactly *meffalo* and *boomsloth*.
- Both draw, walk, listed in Wildlife tab. Finding them there proves nothing about
  natural spawning, since you put them there; scenario J settles that.
- **Meffalo near-black with pale face mask**, large: body size 3.5, drawn at 4 for
  adult. Boomsloth brown with cream mane, body size 4.0, drawn at 3.8.
- Meffalo drawn husky-size means `<race>` block did not load; scenario B
  confirms.

## B — wildness reads on the information card

First repair, only place shows as number.

- Open each animal's information card, Stats tab.
- **Wildness listed: 60% meffalo, 97% boomsloth.** *Listed* is the point.
  `Wildness` declares `showIfUndefined` false, so broken form printed no wrong number, it
  printed **no line at all**. Absent row is the failure, not zero.
- 97% boomsloth close to vanilla ceiling. Meant: animal is megasloth crossed with bomb.

## C — the boomsloth explodes when it dies

Second repair, what animal is named for. **Scenario justifying the
port.** Before fix explosion simply stopped, nothing in log.

- Spawn boomsloth in open, well away from anything burnable, kill it. Dev mode's
  damage tool, or colonist with gun.
- **Large explosion goes off where it died.** Flame damage, wide radius, fire on ground.
- Reference is **vanilla boomalope**, declaring identical
  `<deathAction><workerClass>DeathActionWorker_BigExplosion</workerClass></deathAction>`. If
  boomsloth blast looks materially smaller than boomalope's, block did not load,
  something reverted. Kill one of each same session if doubt.
- Confirm corpse destroyed by own explosion, not left on ground.

**Then do it indoors, once, deliberately.** Dead boomsloth in wooden barn should take room
with it. Documented behaviour and description's warning; seeing once is
worth more than reading.

## D — taming is hard again

Consequence of B, only place old bug visible in play, not on card.

With broken form stat fell back to default `-1`, outside range game
uses, and **both animals tamed for almost nothing**. Player would have
noticed that, never knowing why.

- Spawn wild meffalo and wild boomsloth, send animal handler at each.
- Meffalo at 60% wildness comparable to vanilla muffalo. **Boomsloth at 97% should be
  close to refusing**, order of thrumbo: many attempts, high-skill handler, real
  chance of failure each time.
- Boomsloth taming first try with skill-4 handler means stat did not take.
  Re-run B before concluding anything else.
- Tame-failure matters too: `manhunterOnTameFailChance` is 0.10 on meffalo, **0.30 on
  boomsloth**. Expect failed attempt to turn one hostile roughly a third of the time,
  remember what angry boomsloth becomes when it dies.

## E — the meffalo is milked for flake

One of two jokes mod built on, not vanilla behaviour anywhere.

- Tame meffalo, wait, let handler milk it.
- **Output is `Flake`**, the drug, not milk. 20 per milking, one every 6 days.
- `milkFemaleOnly` false, so **male meffalo gives flake too**. Test one deliberately; this is
  setting most likely lost in port, silent when it goes.
- Flake stacks with any other flake in colony, usable as drug is.

## F — the boomsloth is milked for chemfuel

Other joke, has vanilla comparison.

- Tame boomsloth, let handler milk it. **Output is `Chemfuel`**, 20 every 6 days, males
  included.
- Vanilla boomalope gives 11 every **1** day. Boomsloth therefore about sixth as
  productive per day. Original's balance, port did not touch; recorded
  so future reader does not "fix" it thinking something lost.

## G — shearing, both animals

- **Meffalo**: 125 `WoolMeffalo` every 15 days.
- **Boomsloth**: 200 `WoolMegasloth` every 20 days, vanilla's own megasloth wool, stacks with it.
- `WoolMeffalo` new def, colour `(33,33,32)`, near-black. Weave something from it
  and confirm cloth nearly black, not default wool colour.
- Insulation is the point: 40 cold, 30 heat. Compare meffalo-wool parka against megasloth-wool one on same pawn.

## H — butchering, and what each animal leaves

- **Meffalo** butchers to `Leather_Darkfur`, labelled *dark fur*, and *meffalo meat*. Dark fur
  also `(33,33,32)`, Beauty factor 3, so furniture made from it should read as
  notably pretty in inspect pane.
- **Boomsloth** butchers to `Leather_Heavy`, vanilla heavy fur, and *boomsloth meat*.
- **Butchering boomsloth corpse must not explode.** Death action fires when animal dies,
  not when corpse processed. If butcher table detonates, something wired wrong. Note
  getting corpse at all requires animal dying without own blast destroying it,
  in practice slaughter rather than combat.

## I — training, hauling and the herd

- Both animals `Advanced` trainability: Obedience, Release, Rescue, Haul should all be
  offered. Advanced on 97%-wildness animal deliberate, makes boomsloth
  worth trouble.
- **Meffalo is pack animal.** Selectable for caravan, carries gear. At mass
  853 and body size 3.5 should carry more than vanilla muffalo.
- **Meffalo is herd animal.** Spawn three or four wild, confirm move as group,
  do not scatter.
- Boomsloth neither, should not appear in caravan pack list.

## J — they spawn in the wild

Unlike some ports in collection, these two genuinely wild animals, About file does
not say so. Worth confirming, numbers small.

- Declared biomes, both animals: arid shrubland, temperate forest, tropical rainforest, ice sheet,
  boreal forest, tundra. **Desert explicitly 0.** Nothing else.
- Meffalo commonality 0.01 to 0.04 depending on biome, boomsloth half that. Low.
  Use dev mode wildlife regeneration on boreal forest or tundra map rather than waiting.
- Meffalo wild group size 1 to 3. Boomsloth declares none, arrives alone.

## K — traders carry them

Lesson of A Sloth Mod, which declared trade tag appearing in **no** trader's list, so
could never be bought. Not the case here; this scenario records check.

- Trade tags: meffalo `AnimalUncommon`, `AnimalFarm`, `AnimalFighter`; boomsloth `AnimalUncommon`,
  `AnimalFighter`. All three appear in Core trader definitions, confirmed on disk 2026-09-12:
  `AnimalFarm` in 22 places, `AnimalUncommon` in 9, `AnimalFighter` in 5, across neolithic and
  outlander bases, caravans, orbital traders.
- Call bulk goods or exotic animal trader with dev mode until one carries either animal. Point is only to see it happen once.

## L — is the original-mod incompatibility still true?

Rewritten 2026-09-28 to follow `AUDIT.md` ("On ne teste pas le jeu", and pass for each declared
incompatibility). Warning mod list shows for `incompatibleWith` is game's own reaction
to declaration, so not tested here. Mod answers for **the declaration**, and
whether reason behind it still holds.

- **Declaration** checked in sources, already is: `About.xml` lists
  `predatorking.funnycreatures` in `incompatibleWith` (`test_metadata_and_distribution`).
- **Reason** is both mods define `Meffalo`, `Boomsloth`, `WoolMeffalo`, `Leather_Darkfur`.
  It ages: original could be updated, or withdrawn. One pass mounts original (Workshop
  2640466629) next to this mod, in named game (`wsl-deps.incompat-original.map`), plays suite's incompatibility feature there.
- **In that pass green means incompatibility behaves as declared.** Feature asserts documented
  symptom (duplicate-definition messages naming those four defs) instead of expecting red run.
  Whether two mods still conflict is the finding; change in either direction
  is signal to go look.
- Do not add or remove XML in this scenario: declaration already shipped, source
  mutation would invalidate tested artifact.

## M — the dessicated corpse

Known upstream defect, left as is. Scenario confirms only cosmetic.

- Kill boomsloth without destroying corpse, let dry out, or use dev mode to age
  corpse.
- `funnycreatures/Dessicated/Dessicated_Boomsloth_east.png` is **only** dessicated texture in
  mod. `Graphic_Multi` does not fall over: builds other faces by rotating east one.
  Expect slightly odd corpse from north and south, not missing texture, not pink box.
- Meffalo has no dessicated texture, borrows vanilla muffalo one, declared
  explicitly, correct behaviour.
- Fixing either would mean drawing, not porting. See scope note in repository.

## N — no predator hunts a boomsloth, calves included

One behaviour port adds rather than restores, scenario checking it took.

Boomsloth `<race>` now declares `canBePredatorPrey` false, as base game boomalope does.
Reason is explosion: predator killing one starts fire nobody chose to start.

**Test the calf, not the adult.** Adult never reachable, flag changes nothing for
it. Prey selection vetoes on body size first, largest `maxPreyBodySize` in base game and
all five expansions is bear's **3**; adult boomsloth is **4.0**. Watching adult go
unhunted proves nothing about flag, would have looked same before.

Exposure was the young, numbers behind it:

| Life stage | Body size | Under a bear's ceiling of 3? |
|---|---|---|
| Calf | 0.8 | yes |
| Juvenile | 2.0 | yes |
| Adult | 4.0 | no |

- Spawn **baby** boomsloth and grizzly bear on same map, let bear go hungry, leave
  them. Bear must never take calf. Warg other case worth running: clears
  checks by narrow margin, most likely to slip through if flag failed to
  load.
- To see what is prevented, comment flag out, run same pair again. Bear takes
  calf, calf explodes. Control worth doing once, since passing test here
  looks exactly like nothing happening.
- **Colonists must still hunt them.** Flag governs animal predators only. Order
  hunt on adult boomsloth, confirm job offered and completes; if broke, fix
  costs more than saves.

**What this does not do.** Flag absolute: predators will not touch boomsloth even when
starving. Base game offers no middle setting, since `FoodUtility.IsAcceptablePreyFor` has no
hunger term at all; hunger decides *whether* predator hunts, never *what* it takes.
Starving exception would need Harmony patch and assembly, which mod
does not have.

## O — the sounds

Small, but separate def file, only place port could have lost
something without visible sign.

- Meffalo's four sounds draw on vanilla **muffalo** clip folders, pitched down to
  0.48 to 0.74 where vanilla sits 0.98 to 1.14. Should sound like muffalo about octave
  lower. Original's choice, makes animal read bigger.
- Boomsloth borrows **thrumbo** sounds outright, unmodified.
- Reversed `volumeRange` of `15.42672~14.7734` in call copied verbatim from vanilla's own
  `Pawn_Muffalo_Call`. Not fault introduced here, needs no repair.

## P — English and French UI

Preconditions: scenario A passes; Core plus this mod on disposable map, with both adult
animals, meffalo calf, butchered meat, meffalo wool, dark fur leather available.

- Set game language English, restart. Inspect animal information, attacks, meat,
  meffalo calf, wool, leather. Expect English source labels/descriptions, readable
  without unresolved keys or clipped text.
- Repeat in French after restart. Expect French descriptions, tête/sabot/griffe attack
  labels, viande de meffalo/boomsloth, veau meffalo, laine de meffalo, fourrure sombre.
  Species names meffalo and boomsloth intentionally unchanged.
- Inspect generated labels, plurals, inventory cards. Capture any English fallback,
  raw path, missing translation, malformed text, clipping as failure with exact screen.
- Check Mod options and main button bar: content mod has no empty settings page or shortcut.
  RIMMSQOL and settings persistence not applicable; no integration claimed tested.
- Review Player.log after each language run. Expect no translation/DefInjected errors for this mod.

## Q — new game and existing saves

Preconditions: back up existing 1.6 save without this mod and save already containing these
animals/resources if available. Copies only. Record exact mod list and game version.

- Start new game with Core plus this mod, perform A-C and E-H, save, exit, restart, reload.
  Expect both species and inventories remain, same production definitions,
  wildness, predator protection. Check log for unresolved defs and load exceptions.
- Enable mod on copy of existing vanilla save, reload, spawn both animals, repeat
  A-C. Save and reload again: added animals and resources must persist without load errors.
- If previous continuation/original save available, load copy with only this continuation
  enabled (original disabled). Verify existing animals, wool/leather, training, production
  survive save/reload. If no such save, mark migration case unverified.
- Repeat relevant information-card checks in FR and EN as in P. Do not infer migration
  pass from new-game pass. Removing content mod mid-save unsupported and
  loses its entities; documented limitation, not promised migration feature.

## R — A Dog Said... Animal Prosthetics 2

Added 2026-09-28. Needs pass 3 (optional mods). `Patches/Compat_ADogSaidAnimalProsthetics2.xml`.

- With ADS 2 loaded, **real** surgery recipes it builds list both animals among users. Check
  only running game gives: ADS 2 copies category lists onto recipes once,
  at own last patch, so result depends on this mod loading before it (`loadBefore` in
  `About.xml`). Patch working on paper but loading in wrong order leaves recipes without them.
- Meffalo and boomsloth offer medieval, simple prosthetic, bionic surgeries on health tab
  (all three categories, as counterparts muffalo and megasloth do).
- **Without** ADS 2 (pass 1): no error, no warning from patch, nothing changed.

## S — Nocturnal Animals (Continued)

Added 2026-09-28. Needs pass 3. `Patches/Compat_NocturnalAnimals.xml`.

- With that mod loaded, boomsloth carries body-clock extension set nocturnal, game
  accepted class: no "could not find type" line naming `NocturnalAnimals.ExtendedRaceProperties`.
- Meffalo carries none: mod does not list muffalo, so meffalo stays diurnal.
- **Without** mod (pass 1): no error, nothing added.

## T — Better Crossbreeding

Added 2026-09-28. Needs pass 3. `Patches/Compat_BetterCrossbreeding.xml`.

- With that mod loaded, races and kinds carry designed pairs: meffalo and muffalo; boomsloth with
  megasloth and with boomalope; megasloth with boomalope giving boomsloth. Game accepted
  `DZY.CrossBreeding.Extension` and `outcomes` on each mother's kind (no unresolved cross-reference,
  no "could not find type").
- Both halves exist for every pair: male's race lists female, mother's kind has outcome
  for that father. XML tests prove on paper; run shows game loaded it.
- Birth not asked of run: gestation is days of game time, which kind drawn is other
  mod's own code. Pairs and outcomes present and loaded is what mod answers for.
- **Without** mod (pass 1): five animals keep vanilla lists, nothing logged.
- **Owner rule of 2026-09-28**: pairing where both animals vanilla not patched (Animal Naturally's
  job), so megasloth x boomalope recipe gone. Scenario 08 asserts two stay apart.

## U — Dogs mate (Continued)

Added 2026-10-11. Needs pass 3. `Patches/Compat_DogsMate.xml`.

- With that mod loaded, meffalo sits in group Bison (with muffalo), boomsloth in group
  Boomalope, game accepted both: no unresolved `pawnKinds` reference naming Meffalo or Boomsloth. Mod
  has no megasloth group, so no pairing with it declared.
- **Without** mod (pass 1): nothing added, nothing logged.
- Proof on paper: `test_dogs_mate_joins_the_two_groups_and_only_with_the_mod` (lxml, with and without mod). Birth
  not asked of run, reason given in T. No Pickle step reads mating groups: pass 3 adds that
  game loads mod set without error.

## Automated checks (outside the game)

Run from repository root with Python 3 and PowerShell 7. Core-reference checks require
local RimWorld 1.6 installation (`RIMWORLD_DIR` can override default Steam location).

```powershell
python Tests/test_mod.py -v
& ../scripts/Check-DefInjected.ps1 -TransMod (Join-Path (Get-Location) 'Mod')
```

Second command is shared workflow checker, outside this standalone repository. Needs
RimWorld managed assemblies. Supply actual path if running from another checkout location.
Validates engine field paths and translation handles; Python suite independently derives
coverage from source Defs, checks production, port regressions, references, packaging.
Neither command executes game. No build/custom-C# unit suite applicable to XML-only mod.

For Preview changes, install/use Playwright and Pillow, then run:

```powershell
node Art/render-preview.cjs
python Art/check-contrast.py
```

Renderer requires Chrome, waits for fonts and source image, writes final Preview,
thumbnail, background measurement image, font/layout evidence in `Art/`. Palette values come
only from `Art/preview-palette.json`. Inspect both final and thumbnail images after each render.
Outputs git-ignored: prove Preview at moment rendered.

Static results are not kept (2026-10-19): the checks above run in seconds and are rerun on demand;
`Tests/RESULTS.md` was deleted with them (it recorded revision 0b29ed3). See "Evidence to keep" below.

---

# Plan: passes, automation and gates

Written 2026-09-28 after re-reading `AUDIT.md`, extended 2026-10-13. **Pickle suite written** (`Tests/Pickle/`, seventeen features, step assembly in two files, four pass maps), checked offline by `Tests/test_pickle_suite.py`, showing every feature line matches exactly one known step. Features 01 to 12 have played (lines in `docs/runs/README.md`); features 13 to 17 (scenarios D to K, M, O) filed as small ticket, not played. `Tests/Pickle/README.md` has layout, request playing each pass, what two limits of Pickle built-in steps forced. Lines marked *proposed* still await owner's word.

## The passes

Mod validated by named passes; mod whose `TESTING.md` does not say how many is tried, not
tested. This mod needs five requests, none with `-IncludeWip`:

| # | Pass | Language | Game set | What it covers |
|---|---|---|---|---|
| 1 | `tools`, the bare set | English | Core, the five DLC, Harmony, RimLogging, Pickle, this mod, plus PickleTools' load audit (step package, not optional mod; `wsl-deps.tools.map`) | Whole suite: animals and defs, two repairs, predator protection, persistence. Only pass where capture is clean |
| 2 | `tools` | French | the same | Same suite in French: labels, descriptions, plurals, attack labels, no accented fallback (dev mode shows missing key as accented text) |
| 3 | `avec-facultatifs` | English | pass 1 plus ADS 2 (`SamBucher.ADogSaidAnimalProsthetics2`, 3238353862), Nocturnal Animals (Continued) (`Mlie.XNDNocturnalAnimals`, 2269731409), Better Crossbreeding (`DizzyEevee.BetterCrossbreeding`, 3520675842), Dogs mate (Continued) (`Mlie.DogsMate`, 2441132298), via `wsl-deps.avec-facultatifs.map`. Map names **this mod first**, then ADS 2: ADS 2 must load after it | Scenarios R, S, T, U. Three optional mods compatible with each other, one pass covers all |
| 4 | `incompat-original` | English | pass 1 plus `predatorking.funnycreatures` (2640466629) via `wsl-deps.incompat-original.map` | Scenario L only: documented symptom of incompatibility asserted, green means still behaves as declared |
| 5 | `core-only`, *proposed* | English | pass 1 with five DLC left out (`!` lines in `wsl-deps.core-only.map`) | Claim in "Load order" that definitions need Core only, shown at run time, not only by reference check |

**Why one "with optional mods" pass, not several.** `loadAfter` names Ludeon packages only, but
three patches of 2026-09-28 name three optional mods, so pass mounting them needed. They do not
exclude each other (each touches different fields: recipe lists, body clock, crossbreeding), so one pass
covers all three; combination that could not coexist would need one pass each. If
`TSP.Isengriff.Storytime` pack declared incompatible (open decision in `STATUS.md`), pass for it
added here first. Pass 1, mounting none of them, also proof patches silent
without their mod.

## What stays out of the game suite, and what goes in

`AUDIT.md`: only what running game can show belongs in Gherkin, scenario repeating what an
XML test already proves is deleted, not kept in case. `Tests/test_mod.py` already proves every def
value below (production, wildness under `statBases`, `deathAction` block, `canBePredatorPrey`,
trade tags, biomes, references to Core). Left for game is what those values *do*.

| Scenario | Disposition | Reason |
|---|---|---|
| A both animals exist and draw | **Pickle**, `01` | Spawn each, see drawn: `@review` capture, opened |
| B wildness on the information card | **Pickle**, `01` | Stat proven by XML; that game reads it (listed row, not missing one) is the repair, only game shows it |
| C the boomsloth explodes when it dies | **Pickle**, `02` | Whole point of port, fault logging nothing. Colonist two cells from animal is sensor: Flame explosion leaves Burn on it. Boomalope positive control, meffalo negative one |
| D taming is hard again | **Pickle**, `13` | Engine handling-skill stat and taming curve over wildness it read, manhunter fail chance: no die rolled, wildness read as 0 would show |
| E, F milking; G shearing | **Pickle**, `14` | Comps game instantiated (product, amount, interval), tamed male made ready: `milkFemaleOnly` false silent when lost. No milking waited for |
| H butchering | **Pickle**, `15` | Butcher products of live animal (nothing dies, no blast), declared leather and meat |
| I training, pack, herd | **Pickle**, `15` | Game training gate, pack and herd flags, carrying capacity against muffalo |
| J wild spawning | **Pickle**, `16` | Commonality table of every biome game loaded (nothing else but six declared), group size |
| K traders | **Pickle**, `16` | Some trader kind of game has animal stock handling each race |
| L incompatibility | **Pickle**, pass 4, `10` | Rewritten above |
| M dessicated corpse | **Pickle**, `17` | Dessicated graphic loads and draws from four sides, no missing-texture material |
| N predator protection, calves included | **Pickle**, `03` | Deterministic if step asks game's own `IsAcceptablePreyFor` about calf and bear, flag as control; waiting for real hunt would be probabilistic |
| O sounds | **Pickle**, `17` | Each sound resolves clip through game's own call, pitch lowered on meffalo, thrumbo sounds on boomsloth |
| P English and French UI | **Pickle**, passes 1 and 2, `05` | Labels and descriptions rendered in each language, captures opened, log clean |
| Q new game and existing saves | **Pickle**, `04`, for save and reload; migration case *unverified* | Save, restart, reload chain automatable. Loading save made with original mod needs one not existing yet: stays listed unverified, not a gate (owner's rule for such cases, 2026-09-24) |
| R ADS 2 | **Pickle**, pass 3, `06` | Real recipes listing both animals is load-order result, only run shows it |
| S Nocturnal Animals | **Pickle**, pass 3, `07` | Game accepted extension class and meffalo carries none; what mod does with body clock is its own |
| T Better Crossbreeding | **Pickle**, pass 3, `08`, def level | Pairs and outcomes loaded and complete both directions. Birth not asked of run, see scenario T |

Owner decision, 2026-10-13: features 13 to 17 kept whole, although some lines repeat what `Tests/test_mod.py` proves (biomes,
group size, pack and herd flags, yields, sound identity, pitch) or exercise engine mechanic (taming curve, training gate, trader
stock). `AUDIT.md` ("Ne garder en Gherkin que ce que seul un jeu qui tourne peut montrer") would prune them; she chose keep them.

## Gates for `done -> tested`

All of these, read from `AUDIT.md`, step 9, stated by owner 2026-09-28:

- **No scenario tagged `@wip`.** Scenario put aside either repaired and replayed, or deleted with
  reason written here. Remaining `@wip` is pending, not passed.
- **Every conditional scenario has run.** Each `@requires:<packageId>` (optional mod, DLC, companion tool) has had its pass, on map mounting it, report read (`setName`, suite and scenario names checked before quoting: report folder shared by whole
  machine). Scenario skipped for want of condition is not scenario passed.
- **No manual test left to validate.** What used to be ticked by hand automated and green, or
  listed above not applicable with reason. `@review` captures still to be looked at,
  but that is reading image scenario already showed in intended state.
- Suite green in every pass of table, `exitReason` read **before** counts, number of
  scenarios played checked against number of features discovered.
- Logs checked, interface checked in French and English **with developer mode on**: fallback shows as accented text, clean English word among French is hard-coded string.
- Corrections followed by regression runs concerning them.

## Evidence to keep

Pickle report tens of megabytes: `report.html`, `messages.ndjson`, screenshots about 3 MB
each, in folder shared by whole machine. `Tests/Pickle/Inbox/`, `Evidence/` and `Parked/` git-ignored (AGENTS.md, "Test evidence"): runs arrive in `Inbox/`, only minified proofs with a `RELEASE.md` (deletion condition) stay in `Evidence/`, failures are deleted or parked with a `RELEASE.md` naming the scenario whose green releases them. Triage: `scripts/Prune-Evidence.ps1 -Mod FunnyCreaturesRenew` (dry run, then `-Apply`).
History is **one text line per run in `docs/runs/`**, never folder.

Per pass and per scenario, keep on disk **only latest report for revision now in
repository**, plus older one only if sole proof of check latest run did not repeat.
Report about superseded build proves nothing about current one: delete as soon as newer
replaces it. What kept report is made of:

| Keep | Delete |
|---|---|
| `summary.json` and `junit.xml`: `exitReason`, counts, verdicts | `report.html` and `messages.ndjson`, tens of MB and unread |
| `Player.log` of last run of pass, trimmed to lines concerning this mod if large | logs of earlier runs, lines of machine's other mods |
| `@review` captures **that were opened**, as reduced JPEGs | full-resolution PNGs, screenshots of scenarios without `@review`, raw film frames |
| Explosion film of scenario C, if run has one, as short MP4 (green C proves path, film shows blast) | films of anything else |

Rules for runs: give `-EvidenceDir FunnyCreaturesRenew/Tests/Pickle/Inbox/<new name>`
every time, so older report never read as result; **write commit SHA in `-Label`**,
since request carries none and tree staged when ticket plays. After each run, read
`exitReason` and played-against-discovered count in copy, write line in `docs/runs/`,
then delete what table says. Before deleting anything, **list what goes and what stays**, and
never delete report a `STATUS.md` field still points to: repoint field first. On Windows,
`Remove-Item` stalls on capture names longer than `MAX_PATH`; empty folder with
`robocopy <empty folder> <target> /MIR`, then remove shell left.

Static results (outside game) are not kept: rerun the scripts when a covered file changes; a stale hash inventory proves nothing (on 2026-09-28 the one recorded 2026-09-13 disagreed with `Mod/About/About.xml`).