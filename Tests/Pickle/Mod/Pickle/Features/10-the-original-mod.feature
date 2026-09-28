# Is the declared incompatibility still true? `About.xml` lists predatorking.funnycreatures in <incompatibleWith>,
# because both mods define the same defs: Meffalo, Boomsloth, WoolMeffalo and Leather_Darkfur, each under the same
# defName. An incompatibility ages: the original could be updated, or withdrawn, and one that is never looked at
# again forbids a coexistence that might work.
#
# THE PASS MOUNTS THE ORIGINAL. `wsl-deps.incompat-original.map` stages the archived copy of its 1.3 files
# (_mods-sources/FunnyCreatures, package id predatorking.funnycreatures) next to this mod. The game loads a 1.3 mod in
# 1.6 as an outdated one.
#
# GREEN MEANS THE INCOMPATIBILITY BEHAVES AS DECLARED. This asserts the symptom the declaration is about instead of
# expecting a red run: a red run cannot be told from an accidental one. The symptom is the game's own load error,
# "Adding duplicate Verse.ThingDef name: Meffalo", logged once for each def defined twice, after which it renames
# the later def. Nothing but the game notices it, and nothing but the game's log records it.
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

  Scenario: the game logged a duplicate for each def both mods define
    Then Funny Creatures Renew: the game log holds a duplicate definition error for the ThingDef "Meffalo"
    And Funny Creatures Renew: the game log holds a duplicate definition error for the PawnKindDef "Meffalo"
    And Funny Creatures Renew: the game log holds a duplicate definition error for the ThingDef "Boomsloth"
    And Funny Creatures Renew: the game log holds a duplicate definition error for the PawnKindDef "Boomsloth"
    And Funny Creatures Renew: the game log holds a duplicate definition error for the ThingDef "WoolMeffalo"
    And Funny Creatures Renew: the game log holds a duplicate definition error for the ThingDef "Leather_Darkfur"
