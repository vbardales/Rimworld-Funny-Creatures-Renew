# Scenarios H and I of TESTING.md: what each animal leaves, and what a colonist can do with it.
#
# THE ANIMAL IS NOT KILLED. A boomsloth killed explodes (feature 02), and a corpse needs a death. What a butcher
# takes is asked of the live pawn, with the method the corpse calls (Pawn.ButcherProducts): the products are the
# same, and nothing detonates. That a butcher table does not explode is therefore true by construction, and a
# colonist beside the animal confirms it; what is shown is that the leather and the meat are the declared ones.
#
# TRAINING is asked of the game's own gate, Pawn_TrainingTracker.CanAssignToTrain: Advanced trainability offers
# Obedience, Release, Rescue and Haul. The pack and herd flags and the carrying capacity are the engine's reading
# of the race, against a vanilla muffalo as the control.
Feature: butchering, training and the herd

  Background:
    Given the save "test-colony" is loaded

  Scenario: butchering a meffalo gives dark fur and meffalo meat
    Given Funny Creatures Renew: a "Meffalo" named "Meffy" is spawned at x=140 z=153
    And a colonist "Butcher" exists
    Then Funny Creatures Renew: butchering the animal "Meffy" gives "Leather_Darkfur" and meat labelled "meffalo meat"

  Scenario: butchering a boomsloth gives heavy fur and boomsloth meat, and nothing blows up
    Given Funny Creatures Renew: a "Boomsloth" named "Boomy" is spawned at x=140 z=155
    And a colonist "Butcher" exists
    And Funny Creatures Renew: the colonist "Butcher" stands at x=142 z=155
    Then Funny Creatures Renew: butchering the animal "Boomy" gives "Leather_Heavy" and meat labelled "boomsloth meat"
    When I wait 90 ticks
    Then "Butcher" has no hediff "Burn"

  Scenario: both animals can be trained in the four advanced skills
    Given Funny Creatures Renew: a "Meffalo" named "Meffy" is spawned at x=140 z=153
    And Funny Creatures Renew: a "Boomsloth" named "Boomy" is spawned at x=143 z=153
    And Funny Creatures Renew: the animal "Meffy" is tamed
    And Funny Creatures Renew: the animal "Boomy" is tamed
    Then Funny Creatures Renew: the animal "Meffy" can be trained in "Obedience"
    And Funny Creatures Renew: the animal "Meffy" can be trained in "Release"
    And Funny Creatures Renew: the animal "Meffy" can be trained in "Rescue"
    And Funny Creatures Renew: the animal "Meffy" can be trained in "Haul"
    And Funny Creatures Renew: the animal "Boomy" can be trained in "Obedience"
    And Funny Creatures Renew: the animal "Boomy" can be trained in "Release"
    And Funny Creatures Renew: the animal "Boomy" can be trained in "Rescue"
    And Funny Creatures Renew: the animal "Boomy" can be trained in "Haul"

  Scenario: the meffalo is a herd and pack animal that carries more than a muffalo, the boomsloth is neither
    Given Funny Creatures Renew: a "Meffalo" named "Meffy" is spawned at x=140 z=153
    Then Funny Creatures Renew: the race "Meffalo" is always a pack animal
    And Funny Creatures Renew: the race "Meffalo" is always a herd animal
    And Funny Creatures Renew: the animal "Meffy" carries above than a "Muffalo"
    And Funny Creatures Renew: the race "Boomsloth" is never a pack animal
    And Funny Creatures Renew: the race "Boomsloth" is never a herd animal
