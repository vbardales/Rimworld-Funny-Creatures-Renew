# Is the declared incompatibility still true? `About.xml` lists predatorking.funnycreatures in <incompatibleWith>,
# because both mods define the same defs: Meffalo, Boomsloth, WoolMeffalo and Leather_Darkfur, each under the same
# defName. An incompatibility ages: the original could be updated, or withdrawn, and one that is never looked at
# again forbids a coexistence that might work.
#
# THE PASS MOUNTS THE ORIGINAL. `wsl-deps.incompat-original.map` stages the archived copy of its 1.3 files
# (_mods-sources/FunnyCreatures, package id predatorking.funnycreatures) next to this mod. The game loads a 1.3 mod in
# 1.6 as an outdated one.
#
# GREEN MEANS THE ORIGINAL IS STILL READ NEXT TO THIS MOD. The first run showed the game does NOT log a duplicate-def error
# for a def two mods share (an assumption drawn from the decompiled code, refuted by the log). The scenario asserts what
# the log does hold instead of expecting a red run, which cannot be told from an accidental one.
#
# WHY THE LOG FILE. Pickle's log steps count what is logged after a scenario starts, so a message written at load is
# out of their reach, and Pickle 4.9.1 has no step that asserts an ERROR was logged (`an error matching ...` appears in
# the workflow documents and not in the build). The file is read from the start of the game instead.
#
# If a line goes red, something changed: the original may have been updated, or renamed its defs, or this mod
# renamed its own. Corrected, aggravated or displaced, all three are a signal to go and look.
#
# @allow-errors: the errors are the point. No save is loaded: the load is what is being read.
@requires:predatorking.funnycreatures
@allow-errors
Feature: the original mod still conflicts with this one

  Scenario: both mods are loaded
    Then mod "predatorking.funnycreatures" is loaded
    And mod "nelim.funnycreatures" is loaded

  Scenario: the original's own defs are read and fail on 1.6, next to this mod's
    # Observed 2026-09-28 (run 1c89): with both mods loaded the game wrote no "Adding duplicate" line for any def, so
    # the conflict is silent. What the log does hold is the original's 1.3 form, refused by 1.6: the wildness
    # written as a field of <race>, and the flat death action. They prove the original's Meffalo and Boomsloth were
    # read alongside this mod's, which is the coexistence the declaration forbids.
    Then Funny Creatures Renew: the game log holds the text "<wildness>0.6</wildness> doesn't correspond to any field in type RaceProperties"
    And Funny Creatures Renew: the game log holds the text "<wildness>0.97</wildness> doesn't correspond to any field in type RaceProperties"
    And Funny Creatures Renew: the game log holds the text "<deathActionWorkerClass>DeathActionWorker_BigExplosion</deathActionWorkerClass> doesn't correspond to any field in type RaceProperties"
