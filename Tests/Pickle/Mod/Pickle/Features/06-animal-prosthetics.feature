# A Dog Said... Animal Prosthetics 2 (SamBucher.ADogSaidAnimalProsthetics2, Workshop 3238353862).
# Patches/Compat_ADogSaidAnimalProsthetics2.xml adds both animals to the three surgery categories, and About.xml
# declares <loadBefore> for it.
#
# WHAT ONLY A RUN SHOWS. ADS 2 copies its category lists onto its recipe bases ONCE, at its own last patch
# (Patches/z_Category_Patches.xml). The offline test applies this mod's patch to the real Core definitions and to
# ADS 2's own category file, and shows the lists gain both animals. It cannot show the ORDER: a patch that is
# right on paper and loads after ADS 2 leaves the real recipes without the animals. So the check is on the
# recipes the game built, through the list the health tab is drawn from (ThingDef.AllRecipes).
#
# THE CONTROL. The muffalo and the megasloth are in every one of ADS 2's categories, so they must offer the same
# recipes. If they did not, ADS 2 itself had not applied and a missing meffalo would prove nothing about this mod.
#
# One recipe per category, each a concrete child of the base that ADS 2 fills:
#   InstallPegLegAnimal                  category 1, the medieval replacements
#   InstallSimpleProstheticLegAnimal     category 2, the simple prosthetics
#   InstallBionicEyeAnimal               category 3, the bionics
#
# Skipped by requirement in the pass without optional mods, on purpose: it is counted there, not hidden.
# No save is loaded: everything below reads definitions, which exist from the main menu on, and loading a
# colony before each scenario would cost most of the run's time for nothing.
@requires:SamBucher.ADogSaidAnimalProsthetics2
Feature: A Dog Said... Animal Prosthetics 2 offers its surgeries to both animals

  Scenario: this mod loads before ADS 2, which is what its lists depend on
    Then mod "nelim.funnycreatures" loads before "SamBucher.ADogSaidAnimalProsthetics2"

  Scenario: control, the muffalo and the megasloth are offered all three categories
    Then Funny Creatures Renew: the race "Muffalo" offers the recipe "InstallPegLegAnimal"
    And Funny Creatures Renew: the race "Muffalo" offers the recipe "InstallSimpleProstheticLegAnimal"
    And Funny Creatures Renew: the race "Muffalo" offers the recipe "InstallBionicEyeAnimal"
    And Funny Creatures Renew: the race "Megasloth" offers the recipe "InstallPegLegAnimal"
    And Funny Creatures Renew: the race "Megasloth" offers the recipe "InstallSimpleProstheticLegAnimal"
    And Funny Creatures Renew: the race "Megasloth" offers the recipe "InstallBionicEyeAnimal"

  Scenario: the meffalo is offered all three categories
    Then Funny Creatures Renew: the race "Meffalo" offers the recipe "InstallPegLegAnimal"
    And Funny Creatures Renew: the race "Meffalo" offers the recipe "InstallSimpleProstheticLegAnimal"
    And Funny Creatures Renew: the race "Meffalo" offers the recipe "InstallBionicEyeAnimal"

  Scenario: the boomsloth is offered all three categories
    Then Funny Creatures Renew: the race "Boomsloth" offers the recipe "InstallPegLegAnimal"
    And Funny Creatures Renew: the race "Boomsloth" offers the recipe "InstallSimpleProstheticLegAnimal"
    And Funny Creatures Renew: the race "Boomsloth" offers the recipe "InstallBionicEyeAnimal"
