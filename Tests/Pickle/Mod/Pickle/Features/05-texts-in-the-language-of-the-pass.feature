# What both animals, their meat, tools, calf labels, wool and leather are called in the language the pass was
# launched in. A language is chosen at launch and never inside a scenario, so this feature asserts nothing about
# a language: it asserts against whichever one is active, and the coverage is two passes, `-Language English`
# and `-Language French`.
#
# WHY THE GAME AND NOT A FILE CHECK. Tests/test_mod.py proves the French files cover every owned text field, and
# the shared DefInjected checker proves each path resolves to a real field. Neither shows what the game DISPLAYS.
# In developer mode, which every Pickle run is in, a key missing from the active language is not shown as
# English: the game shows the English text in an accented form, letter by letter, so a missing French entry
# reads here as a wrong string instead of a clean one.
#
# The species names meffalo and boomsloth are proper names and are deliberately the same in both languages.
Feature: the texts are those of the language of the pass

  Background:
    Given the save "test-colony" is loaded

  Scenario: the animals, their products and their calf are named in the active language
    Then Funny Creatures Renew: the texts of the animals are those of the active language
    And no errors were logged
