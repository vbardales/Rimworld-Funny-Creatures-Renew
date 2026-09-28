# The reason for the port. Before it, the boomsloth's `deathActionWorkerClass` sat flat inside <race>,
# which 1.6 no longer reads: the element was ignored, nothing was logged, and the animal named for its
# explosion simply died quietly. Only killing one settles it.
#
# HOW THE BLAST IS SEEN. A colonist stands two cells from the animal, pinned (drafted, so that it does not
# walk away), and the animal is killed. The vanilla worker, DeathActionWorker_BigExplosion, fires a Flame
# explosion at the corpse's cell with a radius chosen by the life stage: 1.9 for a calf, 2.9 for a juvenile,
# 4.9 for an adult (read from the 1.6 assembly on 2026-09-28). A Flame explosion leaves a Burn on whoever
# it reaches, and a colonist is something Pickle's own steps can read.
#
# TWO CONTROLS, because a burn alone proves nothing about this mod.
#   - the boomalope, which declares the same worker, must burn the same colonist the same way: it shows the
#     scene can see a vanilla explosion at all. If it did not, a red boomsloth would mean nothing.
#   - the meffalo, which declares no death action, must burn nobody: it shows the burn comes from the
#     explosion and not from anything else the scene does.
#
# THE WAIT. GenExplosion spawns an Explosion thing that applies its damage over the ticks that follow, not in
# the call. Thirty ticks are given, far more than a radius of five cells needs; the colonist is pinned
# meanwhile, and Pickle drives the ticks by hand in fast mode, so it costs little real time.
Feature: the boomsloth explodes when it dies

  Background:
    Given the save "test-colony" is loaded

  @film
  Scenario: an adult boomsloth killed beside a colonist burns the colonist
    Given a colonist "Bystander" exists
    And Funny Creatures Renew: the colonist "Bystander" stands at x=142 z=155
    And Funny Creatures Renew: a "Boomsloth" named "Boomy" is spawned at x=140 z=155
    Then "Bystander" has no hediff "Burn"
    When Funny Creatures Renew: "Boomy" is killed
    And I wait 30 ticks
    Then "Bystander" has hediff "Burn"

  Scenario: control, the vanilla boomalope burns the same colonist in the same scene
    Given a colonist "Bystander" exists
    And Funny Creatures Renew: the colonist "Bystander" stands at x=142 z=155
    And Funny Creatures Renew: a "Boomalope" named "Control" is spawned at x=140 z=155
    Then "Bystander" has no hediff "Burn"
    When Funny Creatures Renew: "Control" is killed
    And I wait 30 ticks
    Then "Bystander" has hediff "Burn"

  Scenario: control, a meffalo killed in the same place burns nobody
    Given a colonist "Bystander" exists
    And Funny Creatures Renew: the colonist "Bystander" stands at x=142 z=155
    And Funny Creatures Renew: a "Meffalo" named "Quiet" is spawned at x=140 z=155
    When Funny Creatures Renew: "Quiet" is killed
    And I wait 30 ticks
    Then "Bystander" has no hediff "Burn"
