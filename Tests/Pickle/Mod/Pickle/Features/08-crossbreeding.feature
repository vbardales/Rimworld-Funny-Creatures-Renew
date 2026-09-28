# Better Crossbreeding (DizzyEevee.BetterCrossbreeding, Workshop 3520675842).
# Patches/Compat_BetterCrossbreeding.xml pairs the meffalo with the muffalo, and the boomsloth with the
# megasloth and the boomalope. No pair joins two vanilla animals.
#
# HOW A CROSSBREED IS DECIDED, in two halves that must both exist (the header of the patch has the sources):
#   - who MATES: vanilla decides it from the MALE's race, <canCrossBreedWith>, read by JobGiver_Mate;
#   - what is BORN: that mod decides it from the MOTHER's PawnKindDef, through DZY.CrossBreeding.Extension,
#     whose <outcomes> are keyed by the FATHER's kind.
# So every pair is checked in both directions, on both halves.
#
# WHAT ONLY A RUN SHOWS. The offline tests apply the patch to the real Core definitions and prove the pairs, the
# outcomes, the append-not-overwrite behaviour and the class spelling against the compiled assembly. What they
# cannot show is that the GAME accepted it: that the type was resolved, `outcomes` was parsed with its
# per-father elements, and no cross-reference was left dangling. That is the load of the patched defs, and the
# extension is read back here through reflection.
#
# A BIRTH IS NOT ASKED OF A RUN. A gestation is days of game time, and which kind is drawn belongs to that mod's
# own code. That the pairs and outcomes are present and were loaded is what this mod answers for.
#
# The megasloth x boomalope recipe is NOT patched (owner rule of 2026-09-28: a pairing between two vanilla
# animals belongs to Animal Naturally); the scenario below asserts they stay apart.
#
# No save is loaded: everything below reads definitions.
@requires:DizzyEevee.BetterCrossbreeding
Feature: Better Crossbreeding sees the pairs of this mod

  Scenario: the meffalo and the muffalo are a pair, in both directions
    Then Funny Creatures Renew: the race "Meffalo" lists "Muffalo" as a crossbreeding partner
    And Funny Creatures Renew: the race "Muffalo" lists "Meffalo" as a crossbreeding partner
    And Funny Creatures Renew: a "Meffalo" mother answers a "Muffalo" father with Random
    And Funny Creatures Renew: a "Muffalo" mother answers a "Meffalo" father with Random

  Scenario: the boomsloth is paired with the megasloth and with the boomalope, in both directions
    Then Funny Creatures Renew: the race "Boomsloth" lists "Megasloth" as a crossbreeding partner
    And Funny Creatures Renew: the race "Boomsloth" lists "Boomalope" as a crossbreeding partner
    And Funny Creatures Renew: the race "Megasloth" lists "Boomsloth" as a crossbreeding partner
    And Funny Creatures Renew: the race "Boomalope" lists "Boomsloth" as a crossbreeding partner
    And Funny Creatures Renew: a "Boomsloth" mother answers a "Megasloth" father with Random
    And Funny Creatures Renew: a "Boomsloth" mother answers a "Boomalope" father with Random
    And Funny Creatures Renew: a "Megasloth" mother answers a "Boomsloth" father with Random
    And Funny Creatures Renew: a "Boomalope" mother answers a "Boomsloth" father with Random

  Scenario: two vanilla animals are not paired by this mod, the megasloth and the boomalope stay apart
    Then Funny Creatures Renew: the race "Megasloth" does not list "Boomalope" as a crossbreeding partner
    And Funny Creatures Renew: the race "Boomalope" does not list "Megasloth" as a crossbreeding partner

  Scenario: the meffalo does not become a partner of anything beyond the muffalo
    Then Funny Creatures Renew: the race "Meffalo" does not list "Megasloth" as a crossbreeding partner
    And Funny Creatures Renew: the race "Meffalo" does not list "Boomsloth" as a crossbreeding partner
    And Funny Creatures Renew: the race "Boomsloth" does not list "Muffalo" as a crossbreeding partner
    And Funny Creatures Renew: the race "Boomsloth" does not list "Meffalo" as a crossbreeding partner
