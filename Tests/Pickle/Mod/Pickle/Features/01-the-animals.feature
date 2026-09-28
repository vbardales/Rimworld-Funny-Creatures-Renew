# What only a running game can say about the two animals themselves.
#
# Everything provable without the game is proved without it, by Tests/test_mod.py: the XML, the def
# values (production, wildness under statBases, the deathAction block, canBePredatorPrey), the French
# coverage, the packaging. None of that is repeated here. A run confiscates the machine for tens of
# minutes; a scenario restating a check that takes two seconds offline buys nothing with it.
#
# What is left is what the engine does with those values:
#
#   - that the engine READS wildness. Under the 1.6 rules the old `<wildness>` form is not an error,
#     it is simply never read, and the stat then falls back to its default. Only the computed stat
#     answers, and it is asked below through the game's own StatWorker.
#   - that both animals are drawn: a texture path that resolves on paper can still fail to load.
#
# WHY NOT "def X field ...". Meffalo and Boomsloth are each a ThingDef AND a PawnKindDef, and Pickle's
# `def {string} field` resolves a defName across every database and throws when it names more than one
# def. `def {string} of type {string} exists` and `def {string} stat {string}` do not have that problem
# (the stat step reads buildable defs only), so those are the ones used.
Feature: both animals exist, are read correctly, and are drawn

  Background:
    Given the save "test-colony" is loaded

  Scenario: both animals are defined as an animal and as a kind
    Then def "Meffalo" of type "ThingDef" exists
    And def "Meffalo" of type "PawnKindDef" exists
    And def "Boomsloth" of type "ThingDef" exists
    And def "Boomsloth" of type "PawnKindDef" exists
    And def "WoolMeffalo" of type "ThingDef" exists
    And def "Leather_Darkfur" of type "ThingDef" exists

  Scenario: the engine reads the wildness stat, and does not fall back to its default
    # 0.6 and 0.97, from <statBases>. The stat's own default is -1, clamped to 0 by its minimum: an
    # animal whose wildness was never read would answer 0 here, and taming would cost almost nothing.
    Then Funny Creatures Renew: the race "Meffalo" has wildness 0.6
    And Funny Creatures Renew: the race "Boomsloth" has wildness 0.97

  @review
  Scenario: an adult meffalo and an adult boomsloth stand side by side and are drawn
    Given Funny Creatures Renew: a "Meffalo" named "Meffy" is spawned at x=140 z=153
    And Funny Creatures Renew: a "Boomsloth" named "Boomy" is spawned at x=143 z=153
    Then Funny Creatures Renew: the animal "Meffy" is of kind "Meffalo"
    And Funny Creatures Renew: the animal "Boomy" is of kind "Boomsloth"
    When I move the camera to (141, 153)
    And I zoom all the way in
    And I wait 20 ticks
    And I take a screenshot "the-two-animals"
    Then no errors were logged
