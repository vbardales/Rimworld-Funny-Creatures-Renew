# What only a save and a reload can show: that both animals, and a calf, are written to a save and read back
# as themselves. The animals are wild, unnamed by the game, so each is given a nickname when it is spawned,
# and found again by it after the reload: every object kept from before a reload belongs to the game that was
# replaced (Pickle authoring guide, section 5).
#
# Loading a save made with the ORIGINAL mod is a different question, and one this suite cannot ask: no such save
# exists (TESTING.md, scenario Q). It stays listed as unverified, and is not a gate.
Feature: the animals survive a save and a reload

  Background:
    Given the save "test-colony" is loaded

  Scenario: an adult meffalo, an adult boomsloth and a boomsloth calf come back as what they were
    Given Funny Creatures Renew: a "Meffalo" named "Meffy" is spawned at x=140 z=153
    And Funny Creatures Renew: a "Boomsloth" named "Boomy" is spawned at x=143 z=153
    And Funny Creatures Renew: a "Boomsloth" calf named "Kid" is spawned at x=146 z=153
    When I save and reload
    Then Funny Creatures Renew: the animal "Meffy" is of kind "Meffalo"
    And Funny Creatures Renew: the animal "Boomy" is of kind "Boomsloth"
    And Funny Creatures Renew: the animal "Kid" is of kind "Boomsloth"
    And Funny Creatures Renew: the animal "Kid" is a calf
    And no errors were logged
