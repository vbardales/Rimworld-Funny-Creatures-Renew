# Funny Creatures Renew (unofficial)

UNOFFICIAL. This mod is published without the original author's explicit consent. If the original author contacts me to request its removal, I undertake to take it down promptly.

The meffalo and the boomsloth, brought forward to RimWorld 1.6.

**I am not the author of this mod.** Both animals are PredatorKing's; this update ports them to 1.6 and adds predator protection. Credit goes to them, mistakes in the update are mine.

Original mod: https://steamcommunity.com/sharedfiles/filedetails/?id=2640466629 — last supporting
1.3, last updated in October 2021. Abandoned, not withdrawn.

## What the mod does

Two animals, both trainable to Advanced, both milkable in a way no vanilla animal is.

- **Meffalo** — a muffalo in everything but its udder. Body size 3.5, fifty-five years of life,
  wildness 0.6, move speed 5. **Milked for flake**, and shorn for meffalo wool. Butchering yields dark fur leather.
- **Boomsloth** — a megasloth that goes off. Body size 4.0, wildness 0.97, fifteen years, move speed
  4.8. **Milked for chemfuel**, shorn for `WoolMegasloth`, and it **explodes when it dies**, using
  the base game's big-explosion worker.
- **Darkfur** leather comes with them.

No DLC required. No Harmony, no framework, no dependency of any kind.

Content mod: removing it mid-save will lose any meffalo or boomsloth, and any darkfur or meffalo wool
already in play.

## What changed in the 1.6 update

Two compatibility repairs restore the original behavior:

- **`wildness` moved to `<Wildness>` under `statBases`, on both animals.** It stopped being a field
  of `RaceProperties` in 1.6 and became a StatDef. The old form is not an error, it is simply never
  read, and the stat's default is `-1` — outside the range the game uses, so both tamed for almost
  nothing.
- **The boomsloth's death action moved.** `deathActionWorkerClass` sat flat inside `<race>`; in 1.6
  it is `<deathAction><workerClass>`. The flat form is not read, so **the explosion had stopped
  happening** — on the animal named for it.

Production quantities and other numeric balance values are unchanged.

## One thing this port adds

Everything above restores what 1.6 had quietly stopped reading. This one does not, and is listed
apart for that reason.

- **Wild predators no longer hunt boomsloths**, through `canBePredatorPrey` false on the animal's
  `<race>`. The base game's boomalope declares the same flag for the same reason: a predator that
  kills one sets off the explosion, and on a forested map that is a wildfire no player caused.
  Colonists can still hunt them.

Adult boomsloths were already out of reach, though only by accident of their size. Calves were not,
and a bear or a warg would take one.

French translations cover the animals, their meat, tools, calf labels, wool and leather.
English uses the native source text. Neither language requires an extra dependency.

## Verification

See [TESTING.md](TESTING.md) for automated checks and the pending in-game scenarios.

## Terms

The original **states no licence anywhere** — no file in the mod, nothing in its `About.xml`, no
linked repository, and nothing on its Workshop page, which was read looking for a refusal rather
than for a permission. Silence grants nothing and forbids nothing.

This port rests on the Workshop's own custom for abandoned mods: named credit, and a takedown on
request. If PredatorKing comes back to these two, or asks for this to be taken down, it comes down.

If I do not answer within a reasonable time after being contacted, anyone may freely update this or
any other of my mods, including publishing a continuation of it. All credit must be preserved.

## Credits

- **PredatorKing** — the mod, both animals, and their textures.
- 1.6 update by nelim. Written with the help of Claude (Anthropic) and Codex (OpenAI).

See [ATTRIBUTION.md](ATTRIBUTION.md) for the licence check and the port in detail.
