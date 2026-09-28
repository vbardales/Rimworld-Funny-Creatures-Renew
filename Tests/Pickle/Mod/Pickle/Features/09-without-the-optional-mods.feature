# The other half of every optional patch: without the mod it names, it changes nothing and logs nothing.
#
# Each patch is guarded (PatchOperationFindMod on the mod's display name, or PatchOperationConditional on one of
# its defs), and the offline test applies each file to the real Core definitions with the mod absent and shows the
# document unchanged. That is a proof on a document the test built itself. This feature is the same claim on the
# defs the engine loaded, in the pass that mounts none of the three mods: Core, the five expansions, Harmony,
# RimLogging, Pickle, this mod.
#
# The vanilla animals are the ones to look at, because the crossbreeding patch writes to Muffalo, Megasloth and
# Boomalope. Without Better Crossbreeding they must have no partner list of their own and no outcome extension.
#
# Excluded from the pass with the optional mods, where these three mods ARE loaded and its first steps would fail:
#     -Filter 'Funny Creatures Renew - Pickle tests,!@sans-facultatifs'
# No save is loaded: everything below reads definitions.
@sans-facultatifs
Feature: without the three optional mods, nothing is patched

  Scenario: the three optional mods are absent
    Then mod "Better Crossbreeding" is not loaded
    And mod "A Dog Said... Animal Prosthetics 2" is not loaded
    And mod "[XND] Nocturnal Animals (Continued)" is not loaded

  Scenario: no animal of the crossbreeding patch has a partner list
    Then Funny Creatures Renew: the race "Meffalo" lists no crossbreeding partner
    And Funny Creatures Renew: the race "Boomsloth" lists no crossbreeding partner
    And Funny Creatures Renew: the race "Muffalo" lists no crossbreeding partner
    And Funny Creatures Renew: the race "Megasloth" lists no crossbreeding partner
    And Funny Creatures Renew: the race "Boomalope" lists no crossbreeding partner

  Scenario: no animal of the crossbreeding patch carries an outcome extension
    Then Funny Creatures Renew: the kind "Meffalo" has no crossbreeding outcome
    And Funny Creatures Renew: the kind "Boomsloth" has no crossbreeding outcome
    And Funny Creatures Renew: the kind "Muffalo" has no crossbreeding outcome
    And Funny Creatures Renew: the kind "Megasloth" has no crossbreeding outcome
    And Funny Creatures Renew: the kind "Boomalope" has no crossbreeding outcome

  Scenario: the boomsloth has no body clock, and ADS 2 has defined no prosthetic surgery
    Then Funny Creatures Renew: the race "Boomsloth" has no body clock
    And no def "InstallPegLegAnimal" exists
