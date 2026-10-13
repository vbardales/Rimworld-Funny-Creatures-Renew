# Scenarios M and O of TESTING.md.
#
# M. The boomsloth ships ONE dessicated texture, facing east, and the meffalo borrows the vanilla muffalo's. The
# game turns the east texture for the other sides, so what is asserted is that the graphic of every life stage
# loads, and that none of the four sides shows the game's missing-texture material (the pink box). A capture of a
# dried corpse would only record that.
#
# O. The sounds are four defs per animal pointing at vanilla clip folders, and the port could lose them without any
# visible sign. Each sound is asked to resolve at least one clip through AudioGrain.GetResolvedGrains, the call the
# game makes when it plays one, so an empty or misspelt folder shows. The meffalo's pitch is lowered (the original's
# choice, about an octave under a muffalo) and the boomsloth uses the thrumbo's sounds outright.
Feature: the dessicated corpse and the sounds

  Background:
    Given the save "test-colony" is loaded

  Scenario: both animals draw a dessicated corpse from every side
    Then Funny Creatures Renew: the kind "Meffalo" draws a dessicated corpse from every side
    And Funny Creatures Renew: the kind "Boomsloth" draws a dessicated corpse from every side
    And no errors were logged

  Scenario: the meffalo's four sounds load and sit lower than a muffalo's
    Then Funny Creatures Renew: the race "Meffalo" has a call sound with clips that load
    And Funny Creatures Renew: the race "Meffalo" has a angry sound with clips that load
    And Funny Creatures Renew: the race "Meffalo" has a wounded sound with clips that load
    And Funny Creatures Renew: the race "Meffalo" has a death sound with clips that load
    And Funny Creatures Renew: the call sound of the race "Meffalo" is pitched below 0.9
    And Funny Creatures Renew: the call sound of the race "Muffalo" is pitched above 0.9

  Scenario: the boomsloth uses the thrumbo's sounds
    Then Funny Creatures Renew: the race "Boomsloth" has a call sound with clips that load
    And Funny Creatures Renew: the call sound of the race "Boomsloth" is that of the race "Thrumbo"
    And Funny Creatures Renew: the angry sound of the race "Boomsloth" is that of the race "Thrumbo"
    And Funny Creatures Renew: the wounded sound of the race "Boomsloth" is that of the race "Thrumbo"
    And Funny Creatures Renew: the death sound of the race "Boomsloth" is that of the race "Thrumbo"
