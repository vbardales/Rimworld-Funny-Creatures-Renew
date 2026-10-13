# Scenarios E, F and G of TESTING.md: the two jokes the mod is built on (flake from a meffalo, chemfuel from a
# boomsloth) and the wool of both.
#
# NO MILKING IS WAITED FOR. A milking is six days of game time and the yield is a die roll (the handler's
# AnimalGatherYield stat). What is asked instead is what the engine reads from the comp: the product, the amount
# and the interval of the comp the game instantiated, and, once the animal is tamed and full, whether the game
# calls it ready (CompHasGatherableBodyResource.ActiveAndFull). `milkFemaleOnly` false is the setting most likely
# to be lost in a port and it is silent when it goes: a MALE animal is made ready here, which a female-only comp
# refuses.
Feature: milk and wool

  Background:
    Given the save "test-colony" is loaded

  Scenario: a meffalo gives flake, a male as well, and wool
    Given Funny Creatures Renew: a "Meffalo" named "Meffy" is spawned at x=140 z=153
    And Funny Creatures Renew: the animal "Meffy" is male
    And Funny Creatures Renew: the animal "Meffy" is tamed
    Then Funny Creatures Renew: the animal "Meffy" yields 20 of "Flake" of milk every 6 days
    And Funny Creatures Renew: the animal "Meffy" yields 125 of "WoolMeffalo" of wool every 15 days
    When Funny Creatures Renew: the animal "Meffy" is full of milk
    Then Funny Creatures Renew: the animal "Meffy" can be gathered from for milk

  Scenario: a boomsloth gives chemfuel, a male as well, and the megasloth's own wool
    Given Funny Creatures Renew: a "Boomsloth" named "Boomy" is spawned at x=143 z=153
    And Funny Creatures Renew: the animal "Boomy" is male
    And Funny Creatures Renew: the animal "Boomy" is tamed
    Then Funny Creatures Renew: the animal "Boomy" yields 20 of "Chemfuel" of milk every 6 days
    And Funny Creatures Renew: the animal "Boomy" yields 200 of "WoolMegasloth" of wool every 20 days
    When Funny Creatures Renew: the animal "Boomy" is full of milk
    Then Funny Creatures Renew: the animal "Boomy" can be gathered from for milk

  Scenario: the meffalo's wool is a new stuff, and its fur is pretty
    Then def "WoolMeffalo" of type "ThingDef" exists
    And def "Leather_Darkfur" of type "ThingDef" exists
    And Funny Creatures Renew: the stuff "Leather_Darkfur" has the factor 3 on the stat "Beauty"
