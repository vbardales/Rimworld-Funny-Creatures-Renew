# Scenarios J and K of TESTING.md. A wild spawn is a random draw and a purchase needs a trader to call, so neither
# is played. The engine's own tables are read instead: the commonality BiomeDef.CommonalityOfAnimal gives each
# animal in every biome the game loaded (the DLC biomes included, so "nothing else" is checked against the real
# list), and whether a trader kind of the game has an animal stock that handles the race
# (StockGenerator_Animals.HandlesThingDef, the test a trader's stock goes through). A Sloth Mod once declared a
# trade tag no trader asked for and could never be bought; this is the check that it is not the case here.
Feature: wild spawning and trade

  Background:
    Given the save "test-colony" is loaded

  Scenario: both animals live in the six declared biomes and nowhere else, desert included
    Then Funny Creatures Renew: the kind "Meffalo" lives in exactly the biomes "AridShrubland, TemperateForest, TropicalRainforest, IceSheet, BorealForest, Tundra"
    And Funny Creatures Renew: the kind "Boomsloth" lives in exactly the biomes "AridShrubland, TemperateForest, TropicalRainforest, IceSheet, BorealForest, Tundra"

  Scenario: the meffalo wanders in groups of one to three
    Then Funny Creatures Renew: the kind "Meffalo" wanders in groups of 1 to 3

  Scenario: a trader of the game can stock each animal
    Then Funny Creatures Renew: some trader of the game can stock the race "Meffalo"
    And Funny Creatures Renew: some trader of the game can stock the race "Boomsloth"
