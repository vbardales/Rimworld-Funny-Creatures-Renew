# Changelog

Format inspired by [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).
This file serves the repository and the writing of Steam patch notes; RimWorld does not display it
in game.

## [1.0.0] — unreleased

On release: add `Mod/About/ModIcon.png` and `Mod/About/Preview.png`, create the `v1.0.0` tag and
the matching GitHub release, then publish to the Workshop.

First release of the 1.6 update of **Funny Creatures**, by PredatorKing.

### Fixed

- **The boomsloth explodes again.** Its `deathActionWorkerClass` sat flat inside `<race>`, which 1.6
  no longer reads; the field is `<deathAction><workerClass>` now. Nothing errored, the animal simply
  died quietly — which on an animal named for its explosion is the whole of it.

### Changed

- **`wildness` moved to `<Wildness>` under `statBases`, on both animals.** It stopped being a field
  of `RaceProperties` in 1.6 and became a StatDef. The old form is not an error, it is simply never
  read, and the stat's default is `-1` — outside the range the game uses, so the meffalo's 0.6 and
  the boomsloth's 0.97 were both doing nothing.

### Notes

Those three lines are the entire difference from the original files. No balance value was changed,
including the two jokes that make the mod: the meffalo is milked for flake and the boomsloth for
chemfuel.
