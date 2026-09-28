# Pickle suite: Funny Creatures Renew

In-game functional tests, written 2026-09-28, run by [Pickle](https://github.com/RimWorks/Rimworld-Pickle) in the headless
WSL install. **Nothing here has been played.** A run is filed by request, never launched by hand; see "Running it".

What belongs in Gherkin, and what does not, is decided in [`../../TESTING.md`](../../TESTING.md) ("Plan: passes,
automation and gates"). In one line: the XML contract, the def values and the French coverage are proved offline by
`Tests/test_mod.py`, and a scenario that repeats one of those is deleted, not kept. What is left is what the engine does
with those values, and what two other mods do with them.

## Layout

```
Tests/Pickle/
  README.md                               this file
  pickle-steps.txt                        the 205 step expressions of Pickle 4.9.1, for the offline check
  wsl-deps.tools.map                      passes 1 and 2: the bare set plus PickleTools' load audit
  wsl-deps.avec-facultatifs.map           pass 3: ADS 2, Nocturnal Animals, Better Crossbreeding
  wsl-deps.incompat-original.map          pass 4: the original mod next to this one
  wsl-deps.core-only.map                  pass 5: the five expansions left out
  Source/                                 the C# of the step assembly (FunnyCreatures.PickleSteps.csproj)
  Mod/                                    the test companion, nelim.funnycreatures.pickletests
    About/About.xml
    Pickle/Features/*.feature             the scenarios
    Pickle/Assemblies/                    the built step DLL: git-ignored, rebuilt before a run
  Evidence/                               git-ignored: reports and captures, see "Evidence"
```

The companion and the tools stay out of the Workshop payload: the staging copies `Mod/` of the mod under test and this
companion, and nothing of `Tests/`.

## Build, and check without a game

```powershell
dotnet build Tests/Pickle/Source/FunnyCreatures.PickleSteps.csproj -c Release     # Pickle loads step DLLs at start
python Tests/test_pickle_suite.py                                                  # no game
```

`test_pickle_suite.py` shows, from the files alone, that every line of every feature matches **exactly one** step (an
undefined or ambiguous step costs a whole run), that no scenario is set aside, that every tag is known, that each map ends
with a newline and stages folders that exist and declare the id written, that the passes are consistent with the tags
they select, and that the def names the scenarios point at exist. It does not show that a step does what it says: that is
what the run is for.

## The features

| Feature | Scenario of `TESTING.md` | What only a running game shows |
|---|---|---|
| `01-the-animals` | A, B | Both animals are defined and drawn; the engine reads the wildness stat instead of falling back to its default |
| `02-the-boomsloth-explodes` | C | Killing a boomsloth burns a colonist two cells away, with the vanilla boomalope as a positive control and a meffalo as a negative one |
| `03-calves-are-not-prey` | N | The game's own prey test refuses a boomsloth calf for a grizzly bear and a warg, and accepts a meffalo calf, which differs only by the flag |
| `04-save-and-reload` | Q | Both animals and a calf come back from a save as what they were |
| `05-texts-in-the-language-of-the-pass` | P | The animals, meat, tools, calf, wool and leather read as the language of the pass, in English and in French |
| `06-animal-prosthetics` | R | The real surgery recipes list both animals, which depends on this mod loading before ADS 2 |
| `07-nocturnal-animals` | S | The game accepted the extension class; the boomsloth is nocturnal, the meffalo has no clock |
| `08-crossbreeding` | T | The game accepted the extension and its per-father outcomes; every pair exists on both halves |
| `09-without-the-optional-mods` | R, S, T | Without the three mods, nothing is patched: the guards hold on the defs the engine loaded |
| `10-the-original-mod` | L | The declared incompatibility is still true: the game logs the duplicate definitions |
| `11-core-only` | (Load order) | With the five expansions out, both animals load and are read the same |
| `12-load-is-clean` | (Logs) | Nothing in the game's log, from the start, is attributed to this mod |

## Tags

| Tag | Meaning |
|---|---|
| `@requires:<packageId>` | Skipped when that package is absent, and **counted** as skipped. It does not stage it: the map of the pass does |
| `@sans-facultatifs` | Only meaningful in the pass that mounts none of the three optional mods; excluded from pass 3 |
| `@core-only` | Only meaningful with the five expansions out; excluded from passes 1 to 3 |
| `@clean-load` | The load audit; excluded from pass 4, where the original's duplicates are attributed to this mod |
| `@allow-errors` | The errors are the point of the scenario (feature 10) |
| `@review` | Attaches a capture that a person must open. Its green says the path ran, not that the image shows the animals |
| `@film` | Films the scenario; the explosion film is what shows the blast |

There is no `@wip`, and `test_pickle_suite.py` refuses one: a scenario put aside is repaired or deleted.

## The passes, and the request that plays each

Five requests, none with `-IncludeWip`. `<sha>` is the commit the tree is on: **a request carries no SHA and the tree is
staged when the ticket plays**, so keep the tree of this repository unchanged until the `RUN_DONE` of each. Give a new
`-EvidenceDir` every time, so an older report is never read as the result. The full command form, options and exit codes
are in `Rimworld-Ticket-Dispatcher/docs/SUBMIT.md`.

```powershell
powershell.exe -ExecutionPolicy Bypass -File C:\Users\nelim\Documents\rimworld\Rimworld-Ticket-Dispatcher\scripts\Submit-PickleRun.ps1 `
  -Mod FunnyCreaturesRenew -Owner local_<session id> -Label "<sha> <pass>" -DepMap <map> -Language <language> `
  -Filter '<filter>' -EvidenceDir FunnyCreaturesRenew/Tests/Pickle/Evidence/<pass>-<language>-<sha>
```

| # | Pass | `-DepMap` | `-Language` | `-Filter` | Plays |
|---|---|---|---|---|---|
| 1 | `tools` (the bare set) | `wsl-deps.tools.map` | English | `'Funny Creatures Renew - Pickle tests,!@core-only'` | 01 to 05, 09, 12; **06, 07, 08 and 10 are skipped by requirement** |
| 2 | `tools` | `wsl-deps.tools.map` | French | the same | the same, in French: the point is 05 |
| 3 | `avec-facultatifs` | `wsl-deps.avec-facultatifs.map` | English | `'Funny Creatures Renew - Pickle tests,!@sans-facultatifs,!@core-only'` | 01 to 08 and 12; 09 excluded; 10 skipped by requirement |
| 4 | `incompat-original` | `wsl-deps.incompat-original.map` | English | `'10-the-original-mod'` | 10 |
| 5 | `core-only`, *proposed* | `wsl-deps.core-only.map` | English | `'11-core-only,12-load-is-clean'` | 11 and 12 |

The report of every pass carries its name (`-pickle-set-name`), so the passes can be set side by side. **Pass 3 runs the
whole suite on purpose**, not only 06 to 08: it is the pass that shows the mod stands in the game it will really be loaded in,
and Better Crossbreeding and Nocturnal Animals change vanilla animals the earlier features spawn.

A pass that leaves features skipped by requirement is not a pass of them. Feature 06, 07 and 08 have played only when
pass 3 has, on a map that mounted their mods; the counts are read against the features discovered.

## What the two limits of the built-in steps forced

Read from the installed Pickle 4.9.1 (2026-09-28), and the reason `Source/FunnyCreaturesSteps.cs` exists:

- **Pawn steps resolve a colonist by nickname only** (`PawnLookup.FindLiving`). Neither animal is ever a colonist, so
  `I kill`, `is dead` and `has hediff` cannot name one. The steps here spawn an animal with a nickname and find it again by it
  (also after a reload).
- **Def steps throw on an ambiguous defName** (`DefLookup.RequireAny`). Meffalo and Boomsloth are each a ThingDef and a
  PawnKindDef, and so are the vanilla animals the crossbreeding patch names. `def X of type Y exists` and `def X stat Y` are used,
  since they are not ambiguous; the lists, extensions and recipes are read by custom steps.

Two more facts worth knowing before writing the next scenario:

- **Pickle 4.9.1 has no step that asserts an error was logged.** `AUDIT.md` and the Headless guide list
  `an error matching {string} was logged`; it is not in the build (205 expressions read). Feature 10 reads the log file.
- **`Adding duplicate Verse.ThingDef name: X` is `Log.Error`**, and the game renames the later def. Hence `@allow-errors`.

## What was left out of Gherkin, and why

`TESTING.md`, "What stays out of the game suite", has the table. In short: milking, shearing, butchering, taming difficulty,
training, herding, wild spawning, trade and the sounds are proved by XML tests, or are the engine's own mechanics; a scenario
would test the engine. The migration of a save made with the original mod needs a save that does not exist, and stays
unverified. That the mod list shows a warning for `incompatibleWith` is the game's reaction to a declaration: not tested here,
and scenario L was rewritten for that reason.

## Cells and timing

The scenarios use the free ground of Pickle's `test-colony` (a 250 by 250 map) around x=140 to 146, z=153 to 155. It was
chosen by reading the fixture's things, which list nothing between x=137 and 145 for z from 150 to 158. **It has not been
seen in a run**: if a cell is not standable, the step says so and the coordinates are what to change.

The boomsloth's explosion radius depends on its life stage (1.9, 2.9 and 4.9 for calf, juvenile and adult), which is why the
animals are spawned at a fixed age. The explosion applies its damage over the ticks that follow, so the scenarios wait 30.

## Evidence

Reports go to `Tests/Pickle/Evidence/<run>/` (git-ignored), and the history is **one line per run** in
[`../../docs/runs/README.md`](../../docs/runs/README.md). What to keep and what to delete is in `TESTING.md`, "Evidence to
keep": `summary.json`, `junit.xml`, the `Player.log` of the last run of each pass, the `@review` captures that were opened
(reduced), and the explosion film. Never `report.html`, `messages.ndjson` or a whole `screenshots/` folder.
