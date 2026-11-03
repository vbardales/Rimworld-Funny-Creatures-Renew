# Gallery shotlist of Funny Creatures Renew (written 2026-10-25, shootGallery[1.0.0]). No scenario exists yet.
# This file holds the plan only. It moves to Mod/Pickle/Features/ with its first scenario, and gets its own pass map
# (the Sanctuary map as base, no optional animal mod: the nocturnal mod would put the boomsloth to sleep in daytime shots).
#
# STORY, "The herd that was not on the map". One day at the Sanctuary of Nelim (Virginie, the protagonist and only
# colonist; no other colonist is used). She works in the same outfit all day: fixture trousers and corset, `Apparel_Jacket`
# dyed ochre, her bun, no hat. Rhythm: one hour per image, clear weather, 07, 08, 09, 11, 15, 15, 19, with 60 setup ticks.
# Morning in the pen: Nelim meets a meffalo at the gate, then its calf and the calf of the boomsloth. At 09 a walk by the
# water. At 11 the two adults, face to face, in the open clearing. At 15 she keeps her distance from the boomsloth and it
# goes off. At dusk the pen is quiet and the little fuse is asleep. The mod's offer: both animals, their size and look
# (1, 3, 4), their young (2, 7), the explosion (5, 6), the 97 percent wildness (8, optional card).
# SERIES: wide opening (1), mediums (2, 4, 5, 6), tight (3), quiet closing (7), a face-on animal in 4.
#
# COMMON RECIPE (each scenario reloads the save): save Nelims-tribe; presentation mode on; colonist bar, alerts, resource
# readout, learning helper, tooltips, selection brackets, item and name labels hidden; I set the hour to N; I set the weather
# to "Clear"; temperature 20; animals kept out of the place, then ours spawned; Nelim placed, dressed (trousers, corset,
# jacket), her face set LAST in one call (Nelim has her own face, then the one part step if the shot has one); frames before
# the capture; decor removed after. Mid-play instants: forced walk, `I let N ticks pass`, then the game paused for the capture.
#
# SHOTS (name, place, hour, subject and line, composition, living things, decor, instant and how, risk, estimate)
# 1 1-dawn-at-the-gate. enclosure-south, 07, opening shot, frame rectangle 14 x 8 cells centred on the south gate, zoom about
#   6 (was 11: the run of 2026-11-03 showed Nelim a few pixels wide), Nelim off-centre left, the meffalo off-centre right, both
#   within 4 cells of the gate (Nelim about 2 of 14 cells wide, about 38 px at 268 px).
#   "Nelim walks out at dawn. Something big is already waiting." Nelim forced to walk to (152, 214), smirk (MouthSmile
#   set after her face); an adult meffalo standing at the gate, head toward her. `Plant_Daylily` fully grown along the fence,
#   laying boxes kept. Instant: just before they meet; forced walk, `I let 20 ticks pass`, paused, the walk frozen mid-stride.
#   Risk: the meffalo coat reads black at dawn (lead from the run, not checked: ask NPT if it persists). 4.5.
# 2 2-the-calves-follow. enclosure-south, 08, medium, zoom 7 to 8 on one corner of the pen, adult meffalo large at the edge.
#   "Two calves follow their mother. One of them is a fuse." A meffalo calf and a boomsloth calf (life stage step) trail the
#   adult; Nelim small at the fence, smiling (MouthSmile, LidCheerful). Short straw, YellowTallGrass kept low. Instant: the
#   calves mid-trot behind the adult, forced walks, frozen. Risk: calves unreadable at 268 px, so the zoom stays close. 4.
# 3 3-heavy-fur-by-the-water. water-garden, 09, tight on the brown west bank (x 143-158, z 168-176), zoom about 5.
#   "The meffalo's dark coat, next to the water." The meffalo walks along the bank, ducks behind it; no pawn. Instant:
#   it has just left the water and starts along the bank, a duck startled behind it; forced walk, `I let 15 ticks pass`,
#   paused; keep clear of the steam geyser and the burrow at (149-150, 173).
#   Risk: the geyser steam in frame; the coat reads against pale bank. 4.5.
# 4 4-two-new-faces. bare-clearing, 11, medium, zoom 5, the boomsloth in the foreground, the meffalo behind and to the left.
#   "A meffalo and a boomsloth, face to face at last." Frame rectangle 12 x 7 cells centred on the pair (the run of
#   2026-11-03 left half the frame empty and the meffalo cut at the edge); the two animals at most 4 cells apart, the
#   boomsloth in front right, the meffalo behind it to the left, both inside the frame. The boomsloth walks toward the
#   camera (faces South, forced walk), mid-stride; the meffalo facing South, head up. No pawn. Floor bared, vanometric cell
#   hidden. Decor, removed after: `Plant_Daylily` fully grown at two cells left of the meffalo and at two cells right of the
#   boomsloth (a flower strip stood at the left of the 2026-11-03 frame, origin not checked: the new frame keeps off it). The only shot with an animal
#   full-face. Instant: they have just seen the camera; forced walk, `faces`, `I let 20 ticks pass`, paused.
#   Risk: facing held on a paused capture (held on 2026-11-03). 4.5.
# 5 5-do-not-startle-it. bare-clearing, 15, same frame as 4 but wider, zoom 6.
#   "Nelim keeps her distance. The boomsloth knows why." The adult boomsloth in the middle, facing her; Nelim seven cells away,
#   BrowRaised after her own face, set to face it. Instant: she has walked back and just turned, the boomsloth looks at
#   her; forced walk then `faces`. Risk: Nelim facing the wrong way; nothing of ours within 5 cells of her. 4.
# 6 6-boom. bare-clearing, 15 (same minute), exactly the frame of 5.
#   "Boom." The boomsloth is killed (Funny Creatures Renew: "<name>" is killed); Nelim stays seven cells away, unhurt.
#   Instant: the flame at its widest, 2, 6 or 12 ticks after the kill, settled by the first run (or the film). Risk:
#   missing the widest flame; grass at the clearing edge may catch fire. 4.
# 7 7-dusk-roll-call. enclosure-south, 19, same frame as 1, dusk light.
#   "At dusk the pen is quiet. The little fuse is asleep." The adult meffalo lying down (`lies at ... facing`), the boomsloth
#   calf asleep against it; Nelim at the gate, smile; a lit DR_StickLantern at the gate, daylilies. Instant: Nelim has just
#   stopped at the gate; forced walk, frozen. Risk: the lying pose on a paused game not played yet. 4.
# 8 (optional, interface window) 8-boomsloth-card. window-backdrop-for-height, cropped, no subtitle: the information card of
#   the boomsloth on its Stats tab (wildness 97 percent listed). Steps: select the thing, open the info card (not played on an
#   animal). Not scored.
#
# MODS: wsl-deps.sanctuary.map as base, plus screenshotstudio, camerazoom, stagedecor, inspecttabs, screenshotmode,
# clearscreen, Mlie.StickLantern (2024351846); this mod and its companion. No optional animal mod.
# STEPS (all exist, NPT 2026-10-25, none played on a capture of this mod): forced walk, `faces`, `stands at ... facing`,
# `lies down`, `lies at ... facing`, game paused for the capture, life-stage spawn, kill step of this suite, bare floor,
# hide the vanometric cell, keep animals out, own face, frame rectangle and animal, StageDecor and `is lit`, hour and weather.
# To settle on the first run: the cells of Nelim, the gate and the animals; the tick after the kill; ochre and trouser colours.
#
# WRITTEN SO FAR: scenarios 1 and 4 played 2026-11-03 (ticket c569, 2 of 2 passed, cells and pause phrase settled). Director
# verdict on the captures: both refused (1 too wide, no gate, meffalo a black silhouette; 4 pair too far apart, meffalo cut,
# empty half). Shots 1 and 4 recomposed above, to refile. Scenarios 2, 3, 5, 6, 7 follow. Shots 2, 5, 6 keep the reworked
# lines of the STATUS.md shotlist (2026-10-25 rework), to copy here when their scenarios are written. Outfit colours chosen here:
# trousers earth brown (86, 64, 48), corset cream (222, 208, 178), jacket ochre (204, 142, 48).
@gallery @review @timeout:900 @requires:nelim.pickletools.clickdiagnostics @requires:nelim.pickletools.colonistrace @requires:nelim.pickletools.screenshotstudio @requires:nelim.pickletools.stagedecor
Feature: the gallery of Funny Creatures Renew

  Background:
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And Nelim's Pickle Tools: the temperature of the map is 20 degrees
    And Nelim's Pickle Tools: the eclipse of the map is ended
    And Nelim's Pickle Tools: all filth is cleaned
    And Nelim's Pickle Tools: all humans but "Nelim" are removed
    And I set the weather to "Clear"

  Scenario: 1-dawn-at-the-gate
    Given I set the hour to 7
    And Nelim's Sanctuary: I am at the sanctuary "enclosure-south"
    And Nelim's Sanctuary: the animals are removed from the sanctuary "enclosure-south"
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: the colonist bar is hidden
    And Nelim's Pickle Tools: the learning helper is hidden
    And Nelim's Pickle Tools: the tooltips are hidden
    And Nelim's Pickle Tools: the resource readout is hidden
    And Nelim's Pickle Tools: the alerts are hidden
    And Nelim's Pickle Tools: the selection brackets are hidden
    And Nelim's Pickle Tools: the item and name labels are hidden
    And Nelim's Pickle Tools: I move the mouse to (10, 10)
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (148, 205) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (150, 205) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (152, 205) fully grown
    And Nelim's Pickle Tools: an adult animal of kind "Meffalo" named "Moss" is spawned at (162, 210)
    And Nelim's Pickle Tools: the animal "Moss" stands at (162, 210) facing West
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Pants" dyed rgb (86, 64, 48)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Corset" dyed rgb (222, 208, 178)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Jacket" dyed rgb (204, 142, 48)
    And Nelim's Pickle Tools: "Nelim" stands at (152, 214) facing East
    And Nelim's Pickle Tools: I frame the rectangle from (138, 204) to (168, 223)
    And Nelim's Pickle Tools: "Nelim" is forced to walk to (158, 209)
    When Nelim's Pickle Tools: I let 40 ticks pass
    And game speed is paused
    And Nelim's Sanctuary: Nelim has her own face
    And Nelim's Pickle Tools: I let 5 frames pass
    Then I take a screenshot "1 dawn at the gate"
    And Nelim's Pickle Tools: the decor is removed

  Scenario: 4-two-new-faces
    Given I set the hour to 11
    And Nelim's Sanctuary: the vanometric cell of the sanctuary is hidden
    And Nelim's Sanctuary: the floor of the sanctuary "bare-clearing" is bared
    And Nelim's Sanctuary: I am at the sanctuary "bare-clearing"
    And Nelim's Sanctuary: the animals are removed from the sanctuary "bare-clearing"
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: the colonist bar is hidden
    And Nelim's Pickle Tools: the learning helper is hidden
    And Nelim's Pickle Tools: the tooltips are hidden
    And Nelim's Pickle Tools: the resource readout is hidden
    And Nelim's Pickle Tools: the alerts are hidden
    And Nelim's Pickle Tools: the selection brackets are hidden
    And Nelim's Pickle Tools: the item and name labels are hidden
    And Nelim's Pickle Tools: I move the mouse to (10, 10)
    And Nelim's Pickle Tools: "Nelim" stands at (180, 121) facing South
    And Nelim's Pickle Tools: an adult animal of kind "Meffalo" named "Moss" is spawned at (189, 155)
    And Nelim's Pickle Tools: the animal "Moss" stands at (189, 155) facing South
    And Nelim's Pickle Tools: an adult animal of kind "Boomsloth" named "Boomy" is spawned at (194, 156)
    And Nelim's Pickle Tools: the animal "Boomy" stands at (194, 156) facing South
    And Nelim's Pickle Tools: "Boomy" is forced to walk to (194, 150)
    When Nelim's Pickle Tools: I let 35 ticks pass
    And game speed is paused
    And Nelim's Pickle Tools: "Moss" faces South
    And Nelim's Pickle Tools: I let 5 frames pass
    Then I take a screenshot "4 two new faces"
