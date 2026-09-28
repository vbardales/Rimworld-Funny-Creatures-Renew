# [XND] Nocturnal Animals (Continued) (Mlie.XNDNocturnalAnimals, Workshop 2269731409).
# Patches/Compat_NocturnalAnimals.xml gives the boomsloth the body clock Nocturnal, as that mod gives the
# megasloth, and leaves the meffalo without one, as that mod leaves the muffalo.
#
# WHAT ONLY A RUN SHOWS. The patch adds an XML node with a class attribute that names a type of ANOTHER mod's
# assembly. The offline test shows the node is added when that mod is present and only then; whether the game
# resolves the class, and reads the field, is settled by the game loading it. The extension is read through
# reflection by its full name, so a rename in that mod fails here with the name it looked for.
#
# THE CONTROLS. The megasloth must read Nocturnal: it is that mod's own entry, so if it did not, the mod had not
# applied its own patch and a missing boomsloth would prove nothing about this one. The muffalo must read no clock:
# it shows that "no body clock" is what an unlisted animal looks like.
# No save is loaded: everything below reads definitions, which exist from the main menu on, and loading a
# colony before each scenario would cost most of the run's time for nothing.
@requires:Mlie.XNDNocturnalAnimals
Feature: Nocturnal Animals sees the boomsloth as it sees the megasloth

  Scenario: control, the mod's own entries are in place
    Then Funny Creatures Renew: the race "Megasloth" has the body clock Nocturnal
    And Funny Creatures Renew: the race "Muffalo" has no body clock

  Scenario: the boomsloth is nocturnal
    Then Funny Creatures Renew: the race "Boomsloth" has the body clock Nocturnal

  Scenario: the meffalo has no body clock, like the muffalo
    Then Funny Creatures Renew: the race "Meffalo" has no body clock
