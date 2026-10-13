# Scenario D of TESTING.md. The one place the old wildness bug showed in play: with the broken form the stat fell
# back to its default, and both animals tamed for almost nothing.
#
# NO TAMING ATTEMPT IS PLAYED. An attempt is a die roll, so a green run would prove nothing about the number. The
# engine's own figures are read instead, the two a handler meets:
#   - the minimum handling skill, StatDefOf.MinimumHandlingSkill, a curve over the wildness the game read
#     (0.6 gives about 5.9, 0.97 about 9.9; a wildness read as 0 would give 0);
#   - the factor a taming attempt multiplies the handler's chance by, the private curve of
#     InteractionWorker_RecruitAttempt (1 at wildness 0.5, 0 at 1): about 0.8 for 0.6, about 0.06 for 0.97.
# The failure side is the race's own manhunterOnTameFailChance, read through the game's PawnUtility.
Feature: taming is hard again

  Background:
    Given the save "test-colony" is loaded

  Scenario: the meffalo asks for a mid handling skill and tames about as well as a muffalo
    Then Funny Creatures Renew: the race "Meffalo" needs a handling skill above 5
    And Funny Creatures Renew: the race "Meffalo" needs a handling skill below 7
    And Funny Creatures Renew: the taming chance factor of the race "Meffalo" is above 0.7
    And Funny Creatures Renew: the taming chance factor of the race "Meffalo" is below 0.9
    And Funny Creatures Renew: the race "Meffalo" turns manhunter on a failed taming 0.1 of the time

  Scenario: the boomsloth asks for a handling skill near the top and almost refuses to be tamed
    Then Funny Creatures Renew: the race "Boomsloth" needs a handling skill above 9
    And Funny Creatures Renew: the race "Boomsloth" needs a handling skill below 11
    And Funny Creatures Renew: the taming chance factor of the race "Boomsloth" is above 0
    And Funny Creatures Renew: the taming chance factor of the race "Boomsloth" is below 0.1
    And Funny Creatures Renew: the race "Boomsloth" turns manhunter on a failed taming 0.3 of the time

  Scenario: the control, a vanilla muffalo is read the same way
    # If the muffalo were not a mid skill too, a red meffalo would say nothing about the mod.
    Then Funny Creatures Renew: the race "Muffalo" needs a handling skill above 3
    And Funny Creatures Renew: the race "Muffalo" needs a handling skill below 8
