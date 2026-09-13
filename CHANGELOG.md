# Changelog

Format inspired by [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).
This file serves the repository and the writing of Steam patch notes; RimWorld does not display it
in game.

## [1.0.0] — unreleased

On release: create the `v1.0.0` tag and the matching GitHub release, then publish to the Workshop.
Both `Mod/About/ModIcon.png` and `Mod/About/Preview.png` are in place.

First release of the 1.6 update of **Funny Creatures**, by PredatorKing.

### Audit corrections — 2026-09-13

- Added French translations for all 20 owned text fields, including nested tool and calf labels.
- Corrected the Preview title hierarchy, status tag, version badge and palette.
- Corrected wool/leather terminology, described predator protection consistently and added the final source link.
- Updated incompatibility and FR/EN/save scenarios; added reproducible XML and regression checks.
- Runtime functional validation remains pending.

### Fixed

- **The boomsloth explodes again.** Its `deathActionWorkerClass` sat flat inside `<race>`, which 1.6
  no longer reads; the field is `<deathAction><workerClass>` now. Nothing errored, the animal simply
  died quietly — which on an animal named for its explosion is the whole of it.

### Changed

- **`wildness` moved to `<Wildness>` under `statBases`, on both animals.** It stopped being a field
  of `RaceProperties` in 1.6 and became a StatDef. The old form is not an error, it is simply never
  read, and the stat's default is `-1` — outside the range the game uses, so the meffalo's 0.6 and
  the boomsloth's 0.97 were both doing nothing.

### Added

- **Wild predators no longer hunt boomsloths.** The boomsloth's `<race>` now declares
  `canBePredatorPrey` false, exactly as the base game's boomalope does and for the same reason: a
  predator that kills one sets off the explosion, and on a forested map that is a wildfire nobody
  chose to start. Colonists can still hunt them, which is the only way the animal was ever meant to
  be taken down.

  This closed a real gap rather than a theoretical one. An **adult** boomsloth was already safe, but
  by accident: its body size of 4.0 is above the largest `maxPreyBodySize` in the base game and
  every expansion, which is the bear's 3. **Calves were not.** A baby boomsloth is drawn at a fifth
  of that, 0.8, and a grizzly or a warg passes every other check the game makes before hunting.

### Notes

The original compatibility repairs preserve production and numeric balance values, including
flake from meffalos and chemfuel from boomsloths. Predator protection is an intentional additional
behavior change. This continuation also includes incompatibility metadata, translations,
documentation, tests and promotional artwork; it is no longer a three-line-only port.