# Funny Creatures — where the content comes from, and what had to be changed

Everything in this mod is **PredatorKing's** work: the meffalo, the boomsloth, their textures and
their sounds. This repository holds the port to RimWorld 1.6 and nothing else.

## The source

| | |
|---|---|
| Mod | Funny Creatures |
| Author | PredatorKing |
| Workshop | [2640466629](https://steamcommunity.com/sharedfiles/filedetails/?id=2640466629) |
| Last version supported | 1.3 |
| Last updated | 30 October 2021 |
| Licence | none stated |

**Abandoned, not withdrawn.** The item is still on the Workshop and still downloadable; it stopped
at 1.3, missing 1.4, 1.5 and 1.6. Nobody else has picked it up: Mlie has no continuation of it, a
Workshop search filtered on the 1.6 tag returns nothing related, and no installed mod declares
`Meffalo` or `Boomsloth`.

## The licence, looked for in four places

"None stated" is a verdict, not an absence of checking. A refusal never presents itself as a
licence, so each place was searched for the refusal rather than for the permission — `prohibit`,
`forbid`, `do not redistribute`, `no reupload`, `all rights reserved`, `without permission`, and
the Japanese and Chinese forms 禁止, 転載, 無断, 二次配布, 不得.

| Where | What it says |
|---|---|
| A `LICENSE` or `COPYING` file in the mod | there is none |
| The `<description>` of its `About.xml` | nothing about reuse |
| A linked repository | there is none |
| The Workshop page description | nothing about reuse |

Silence grants nothing and forbids nothing. This port rests on the Workshop's own custom for
abandoned mods: named credit, and a takedown on request.

## What the port changed

Three lines, of two kinds.

- **`wildness` moved to `<Wildness>` under `statBases`, on both animals.** It stopped being a field
  of `RaceProperties` in 1.6 and became a StatDef. The old form does not error: nothing reads it, and
  the stat's own default is `-1`, which Core's comment describes as deliberately out of range "so we
  can catch missing wildness stats on animals". The meffalo's 0.6 and the boomsloth's 0.97 were both
  doing nothing.
- **The boomsloth's death action moved.** `<deathActionWorkerClass>DeathActionWorker_BigExplosion</deathActionWorkerClass>`
  sat flat inside `<race>`; in 1.6 it is `<deathAction><workerClass>`. The flat form is not read,
  which means the explosion had simply stopped happening — on the animal whose entire name is the
  explosion.

A diff against the original files shows those three lines and nothing else.

## What was left alone, and why

- **The meffalo is milked for flake and the boomsloth for chemfuel.** Both are the author's jokes,
  both still work, and neither is a balance value this port is entitled to touch.
- **The boomsloth shears `WoolMegasloth`**, the base game's wool, rather than a wool of its own.
  Deliberate on the author's part and left as found.
- **Their voices are the muffalo's**, by way of four `SoundDef`s that point at the base game's
  muffalo clips through `AudioGrain_Folder`. The mod ships no audio of its own.
- **No balance value was touched.**

## Where this came from

The port was done inside a private pack that had gathered two dozen abandoned animal mods, where
these two were one source among them. They leave the pack to stand on their own, because the rule
that pack follows is that a mod which is dead **and** states nothing gets republished with credit
rather than kept back. The pack keeps only what cannot be published: sources that are alive in 1.6,
and the one whose author refuses redistribution.
