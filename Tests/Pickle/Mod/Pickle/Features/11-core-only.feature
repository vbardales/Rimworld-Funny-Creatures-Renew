# The claim that the definitions need Core only: no DLC, no framework, no other mod. TESTING.md says it and the
# offline reference check supports it (every def this mod points at exists in Core), but that check reads the files.
# This one is the game's: with all five expansions left out of the game's list, both animals must still load and the
# engine must still read what it read with them.
#
# `wsl-deps.core-only.map` names the five expansions with `!` lines, which take them out of ModsConfig for that
# pass. Its filter is `-Filter '11-core-only,12-load-is-clean'`. The other features load Pickle's test colony, and nobody has
# shown that it loads without the expansions; they read things this pass does not change.
#
# Excluded from every other pass, where the expansions ARE active and the first step would fail: it is tagged
# @core-only and each other pass's filter leaves it out. No save is loaded for the definition checks.
@core-only
Feature: with no expansion active, both animals load and are read the same

  Scenario: the five expansions are out of the game
    Then mod "ludeon.rimworld.royalty" is not loaded
    And mod "ludeon.rimworld.ideology" is not loaded
    And mod "ludeon.rimworld.biotech" is not loaded
    And mod "ludeon.rimworld.anomaly" is not loaded
    And mod "ludeon.rimworld.odyssey" is not loaded

  Scenario: both animals and their products are defined, and the wildness is read
    Then def "Meffalo" of type "ThingDef" exists
    And def "Meffalo" of type "PawnKindDef" exists
    And def "Boomsloth" of type "ThingDef" exists
    And def "Boomsloth" of type "PawnKindDef" exists
    And def "WoolMeffalo" of type "ThingDef" exists
    And def "Leather_Darkfur" of type "ThingDef" exists
    And Funny Creatures Renew: the race "Meffalo" has wildness 0.6
    And Funny Creatures Renew: the race "Boomsloth" has wildness 0.97
