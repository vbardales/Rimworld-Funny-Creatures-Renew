# The one behaviour this port adds instead of restoring: `canBePredatorPrey` false on the boomsloth, as the
# base game's boomalope has it. A predator that kills one sets off the explosion.
#
# TEST THE CALF, NOT THE ADULT. Prey selection vetoes on body size first, and the largest maxPreyBodySize in the
# base game and its five expansions is the bear's 3. An adult boomsloth is 4.0, so it was never reachable and
# watching one go unhunted would look the same with the flag removed. A calf is drawn at a fifth of that, 0.8,
# and it passes every other test the game makes. The calf is the only place the flag changes anything.
#
# HOW IT IS ASKED. The game's own prey test, RimWorld.FoodUtility.IsAcceptablePreyFor, the one a hungry
# predator's hunt job goes through, is asked directly for a spawned predator and a spawned calf. Waiting for a
# real hunt would be a matter of chance and of game days. The method has no term for hunger, so a hungry
# predator is not a different question (read from the 1.6 assembly on 2026-09-12).
#
# THE CONTROL IS A MEFFALO CALF, and it is chosen for what it shares: the same age, a similar body size
# (3.5 x 0.2 = 0.7 against 0.8) and a similar strength (320 against 270). The ONLY thing that differs is the
# flag. If the meffalo calf were not acceptable either, a refusal of the boomsloth calf would prove nothing
# about the flag.
Feature: no predator may hunt a boomsloth calf

  Background:
    Given the save "test-colony" is loaded

  Scenario: a grizzly bear may not hunt a boomsloth calf
    Given Funny Creatures Renew: a "Bear_Grizzly" named "Hunter" is spawned at x=146 z=153
    And Funny Creatures Renew: a "Boomsloth" calf named "Kid" is spawned at x=142 z=153
    Then Funny Creatures Renew: the animal "Kid" is a calf
    And Funny Creatures Renew: the animal "Kid" is not acceptable prey for "Hunter"

  Scenario: a warg may not hunt a boomsloth calf
    # The warg clears the checks by a narrow margin, so it is the most likely to slip through if the flag
    # ever failed to load.
    Given Funny Creatures Renew: a "Warg" named "Hunter" is spawned at x=146 z=153
    And Funny Creatures Renew: a "Boomsloth" calf named "Kid" is spawned at x=142 z=153
    Then Funny Creatures Renew: the animal "Kid" is not acceptable prey for "Hunter"

  Scenario: control, the same bear may hunt a meffalo calf
    Given Funny Creatures Renew: a "Bear_Grizzly" named "Hunter" is spawned at x=146 z=153
    And Funny Creatures Renew: a "Meffalo" calf named "Kid" is spawned at x=142 z=153
    Then Funny Creatures Renew: the animal "Kid" is a calf
    And Funny Creatures Renew: the animal "Kid" is acceptable prey for "Hunter"
