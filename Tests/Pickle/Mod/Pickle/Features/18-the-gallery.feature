# Gallery shotlist of Funny Creatures Renew (written 2026-10-25, revised 2026-11-15, shootGallery[1.0.0]). Scenarios 1 to 7 exist below.
# Pass map: wsl-deps.gallery.map (the Sanctuary map as base, no optional animal mod: the nocturnal mod would put the boomsloth to sleep in daytime shots).
#
# NELIM (owner, 2026-11-16, shots 1, 5, 6, 7 refused): she follows her own sheet (NSB NELIM-PROFIL.md): `MouthLipsSmirk`, `BrowNormal`, `LidCheerful`, `Roo_HD_Hair_Highpony` set explicitly, trousers drawn. The trousers were bare legs because the AB seed was missing for the set `gallery` (Tests/Pickle/config/gallery/ now holds the four seeds of NSB). Shots 5 and 6 keep `BrowRaised`, 6 `LidSquinting`, written in the line.
#
# STORY, "The herd that was not on the map". One day at the Sanctuary of Nelim (Virginie, the protagonist and only
# colonist; no other colonist is used). She works in the same outfit all day: fixture trousers and corset, `Apparel_Jacket`
# dyed ochre, her high ponytail (`Roo_HD_Hair_Highpony`, from the save; never a bun, NSB-ROSTER), no hat. Rhythm: one hour per image, clear weather, 07, 08, 09, 11, 15, 15, 19, with 60 setup ticks.
# Morning in the pen: Nelim meets a meffalo at the gate, then its calf and the calf of the boomsloth. At 09 a walk by the
# water. At 11 the two adults, face to face, on the cream square of the calm zone. At 15 she keeps her distance from the boomsloth and it
# goes off. At dusk the pen is quiet and the little fuse is asleep. The mod's offer: both animals, their size and look
# (1, 3, 4), their young (2, 7), the explosion (5, 6), the 97 percent wildness (8, optional card).
# SERIES: wide opening (1), mediums (2, 4, 5, 6), tight (3), quiet closing (7), the meffalo face-on in 4.
#
# COMMON RECIPE (each scenario reloads the save): save Nelims-tribe; presentation mode on; colonist bar, alerts, resource
# readout, learning helper, tooltips, selection brackets, item and name labels hidden; I set the hour to N; I set the weather
# to "Clear"; temperature 20; animals kept out of the place, then ours spawned; Nelim placed, dressed (trousers, corset,
# jacket), her face set LAST in one call (Nelim has her own face, then the one part step if the shot has one); frames before
# the capture; decor removed after. Mid-play instants: forced walk, `I let N ticks pass`, then the game paused for the capture.
#
# SHOTS (name, place, hour, subject and line, composition, living things, decor, instant and how, risk, estimate)
# 1 1-dawn-at-the-gate. enclosure-south, 07, clear, 60 ticks plus the walk, opening shot, frame rectangle 14 x 8 cells centred on the gate (159, 207), x 152-166 z 203-211, zoom about 6,
#   Nelim off-centre left, the meffalo off-centre right, both within 4 cells of the gate (Nelim about 38 px at 268 px).
#   "Nelim walks out at dawn. Something big is already waiting." Nelim forced to walk east to (156, 209), turned toward the meffalo (`faces`), her own canonical smirk (`MouthLipsSmirk`, no override) after
#   her face), three-quarter view, not from behind (run 95d6: she stood 6 cells from the gate, seen from behind, no smile). An adult meffalo standing at (160, 209) by the gate, head toward her,
#   on a patch of pale `Plant_YellowTallGrass` fully grown, 3 x 3 around its cell, so the black coat stands out (the coat is black in the texture, Meffalo_east.png: not a lighting fault; on the dark
#   brown pen ground of run 95d6 it read as a silhouette). Other animals cleared from the frame and 10 cells around it, checked on the capture. The two lit braziers of the pen stay in the frame (light
#   source, lived-in), the bamboo stays but no clump stands between the meffalo and the camera. `Plant_Daylily` fully grown along the fence, laying boxes kept.
#   Instant: just before they meet; forced walk, `I let 20 ticks pass`, paused, the walk frozen mid-stride.
#   Risk: the meffalo cell must be on the pale grass and clear of bamboo (settle on the run); the clear radius of the animals. 4.5.
# 2 2-the-calves-follow. enclosure-south, 08, medium-tight, frame rectangle (143, 210) to (154, 216), 11 x 6 cells, zoom about 3, calves in front, the adult cut at the right edge. No pawn.
#   "Two calves follow their mother. One of them is a fuse." A meffalo calf and a boomsloth calf (life stage 0) trail the
#   adult meffalo. `Plant_YellowTallGrass` fully grown at (153, 212), (155, 215), (154, 217), `Plant_Daylily` fully grown at (144, 211), (152, 210), (150, 216) (ground not bare), the pen laying boxes kept.
#   Instant: the herd moves out at first sun, calves just started to follow; adult forced walk, `I let 15 ticks pass`, calves forced walk, `I let 30 ticks pass`, paused.
#   Risk: calves about 24 px at 268 px, so the frame stays tight. 4.5.
# 3 3-heavy-fur-by-the-water. water-garden, 09, clear, tight on the east part of the brown bank, frame rectangle (150, 167) to (160, 173), 10 x 6 cells, zoom about 5, burrow (149, 173) just outside the frame (run 4938: it stood in the middle of the old frame).
#   "The meffalo's dark coat, next to the water." The meffalo walks along the bank from (152, 171) to (155, 171), forced walk, `I let 15 ticks pass`, paused; no pawn. Pale dry grass of the bank and the lily pads around it, willows (171, 162), (165, 162)
#   and reeds (168, 163) of the place (validated decor, nothing added in the water). No duck (run c755: the game threw JobGiver_WanderInPen.GetWanderRoot with the ducks spawned). Other animals cleared from the frame and 12 cells around it, checked on the capture.
#   Pale `Plant_YellowTallGrass` fully grown at (153, 170), (154, 170), (153, 172), (154, 172) beside its path so the black coat does not melt into the bank (director pass); decor removed after. Instant: it has just left the water and starts along the bank. Risk: cells (152, 171) and (155, 171) not checked as standable; grey fog over the water (the place's own tint, accepted if the bank stays readable). 4.5.
# 4 4-two-new-faces. calm-zone, 11, clear, medium, zoom 5, frame rectangle (195, 185) to (205, 191), 10 x 6 cells, the cream square as the ground (run 95d6: on bare brown the frame was empty), the two monuments to the right stay near the frame.
#   "A meffalo and a boomsloth, face to face at last." The meffalo at (198, 189) stands facing South, face-on to the camera (the series' full-face animal); the boomsloth starts at (203, 188) facing West and walks to (201, 188) toward it, mid-stride. No pawn.
#   Decor, removed after: `Plant_Daylily` fully grown at (196, 189), (197, 191), (203, 189), (204, 187), (200, 184), (202, 184), (199, 186), (200, 191) and `Plant_YellowTallGrass` at (196, 185), (204, 190), (195, 190), so the cream ground is not bare.
#   Instant: the boomsloth has just spotted it; forced walk, `I let 20 ticks pass`, paused. Risk: beige boomsloth pale on cream (its dark markings and the daylilies carry it); facing held on a paused capture. 4.5.
# 5 5-do-not-startle-it. bare-clearing, 15, tighter frame rectangle (186, 146) to (200, 154), 14 x 8 cells, zoom about 6 (run 4938: Nelim was 20 px at the left edge of a wider frame).
#   "Nelim keeps her distance. The boomsloth knows why." The adult boomsloth at (196, 150) facing West toward her; Nelim at (192, 150) walks back west to (190, 150) (director pass: she backs off, she does not walk toward it), 6 cells away, same outfit,
#   smile and BrowRaised set after her own face, facing East (set after the walk). Decor, removed after: `Plant_Daylily` fully grown at (187, 148), (187, 152), (190, 147), (190, 153), (200, 147), (200, 153) and `Plant_YellowTallGrass` at (188, 148), (188, 152), (191, 148), (191, 152), (199, 146), (199, 154), and from run 9496 more of both near the boomsloth: `Plant_YellowTallGrass` at (195, 147), (197, 147), (195, 153), (197, 153), (199, 150), `Plant_Daylily` at (193, 146), (193, 154), (198, 148), (198, 152) (they burn in 6, which is fine).
#   Instant: she has just turned back, the boomsloth looks at her; forced walk, `I let 20 ticks pass`, `faces`, paused. Risk: Nelim facing the wrong way; nothing of ours within 5 cells of her. 4.5.
# 6 6-boom. bare-clearing, 15 (same minute), exactly the frame and the decor of 5.
#   "Boom." The boomsloth is killed (Funny Creatures Renew: "<name>" is killed); Nelim stays 6 cells away, unhurt, brows raised, `LidSquinting` set after her own face (expression last).
#   Instant: the flame ring at its widest, `I let 3 ticks pass` after the kill, paused (run 9496 at 6 ticks: haze and the animal tumbling, no readable flame ring; 3 is a guess, no film scenario exists). Risk:
#   missing the widest flame; the decor is outside the blast radius and removed after. 4.
# 7 7-dusk-roll-call. enclosure-south, 19, frame rectangle (152, 205) to (164, 212), 12 x 7 cells, dusk light dimmed to at most 0.3 (ground and lamps) and the sun glow held at 0.3 (NPT 2026-11-14: the dim step alone does not touch the sky; run 5c60 at 0.4 read as mild dusk).
#   "At dusk the pen is quiet. The little fuse is asleep." The adult meffalo lying at (159, 209), the boomsloth calf lying at (161, 209) beside it, both facing West, on a 3 x 3 patch of pale
#   `Plant_YellowTallGrass` (runs 12dc and 5c60: the pair needs it to avoid a black blob); `Plant_TreeBamboo` hidden within 8 cells of (160, 209) and within 4 cells of (156, 209) (the real defName, run c755 log; `Plant_Bamboo` hid nothing);
#   the fire bowls `Brazier` at (152, 209), (166, 209) and one near (160, 213) hidden after the pause so the frame holds no glaring orange sprite; Nelim stands at (153, 210), walks to (156, 210), 3 to 4 cells from the meffalo, smile, facing East,
#   same outfit; a lit `DR_StickLantern` at (163, 210) beside the pair; `Plant_Daylily` fully grown at (158, 210), (162, 208), (163, 209), (157, 208), (158, 211), (162, 211), (164, 208), (165, 210) and `Plant_YellowTallGrass` at (157, 209), (164, 211), (158, 208); nothing on the fence row z 207 (run 4938).
#   Instant: forced walk, `I let 15 ticks pass`, paused. Risk: Nelim still small at the left edge; dusk 0.3 not played; brazier near (160, 213) estimated from the image. 4.5.
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
# 2026-11-09: ticket 95d6 (1, 3, 4) read, all REDO; shots 1, 3, 4 recomposed above, scenarios 1 to 7 written. Next ticket: shot 7 alone
# (lying pose, dim step), then the other six. Outfit colours: trousers earth brown (86, 64, 48), corset cream (222, 208, 178), jacket ochre (204, 142, 48).
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
    And Nelim's Pickle Tools: I place the decor "Plant_YellowTallGrass" at (159, 208) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_YellowTallGrass" at (159, 209) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_YellowTallGrass" at (159, 210) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_YellowTallGrass" at (160, 208) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_YellowTallGrass" at (160, 209) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_YellowTallGrass" at (160, 210) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_YellowTallGrass" at (161, 208) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_YellowTallGrass" at (161, 209) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_YellowTallGrass" at (161, 210) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (154, 206) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (156, 206) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (164, 206) fully grown
    And Nelim's Pickle Tools: an adult animal of kind "Meffalo" named "Moss" is spawned at (160, 209)
    And Nelim's Pickle Tools: the animal "Moss" stands at (160, 209) facing West
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Pants" dyed rgb (86, 64, 48)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Corset" dyed rgb (222, 208, 178)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Jacket" dyed rgb (204, 142, 48)
    And Nelim's Pickle Tools: "Nelim" hairstyle is "Roo_HD_Hair_Highpony"
    And Nelim's Pickle Tools: "Nelim" stands at (152, 212) facing East
    And Nelim's Pickle Tools: I frame the rectangle from (152, 203) to (166, 211)
    And Nelim's Pickle Tools: "Nelim" is forced to walk to (156, 209)
    When Nelim's Pickle Tools: I let 20 ticks pass
    And game speed is paused
    And Nelim's Sanctuary: Nelim has her own face
    And Nelim's Pickle Tools: "Nelim" lids are "LidCheerful"
    And Nelim's Pickle Tools: "Nelim" faces East
    And Nelim's Pickle Tools: I let 5 frames pass
    Then I take a screenshot "1 dawn at the gate"
    And Nelim's Pickle Tools: the decor is removed

  Scenario: 4-two-new-faces
    Given I set the hour to 11
    And Nelim's Sanctuary: I am at the sanctuary "calm-zone"
    And Nelim's Sanctuary: the animals are removed from the sanctuary "calm-zone"
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: the colonist bar is hidden
    And Nelim's Pickle Tools: the learning helper is hidden
    And Nelim's Pickle Tools: the tooltips are hidden
    And Nelim's Pickle Tools: the resource readout is hidden
    And Nelim's Pickle Tools: the alerts are hidden
    And Nelim's Pickle Tools: the selection brackets are hidden
    And Nelim's Pickle Tools: the item and name labels are hidden
    And Nelim's Pickle Tools: I move the mouse to (10, 10)
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (196, 189) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (197, 191) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (203, 189) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (204, 187) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (200, 184) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (202, 184) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (199, 186) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (200, 191) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_YellowTallGrass" at (196, 185) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_YellowTallGrass" at (204, 190) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_YellowTallGrass" at (195, 190) fully grown
    And Nelim's Pickle Tools: "Nelim" stands at (180, 121) facing South
    And Nelim's Pickle Tools: an adult animal of kind "Meffalo" named "Moss" is spawned at (198, 189)
    And Nelim's Pickle Tools: the animal "Moss" stands at (198, 189) facing South
    And Nelim's Pickle Tools: an adult animal of kind "Boomsloth" named "Boomy" is spawned at (203, 188)
    And Nelim's Pickle Tools: the animal "Boomy" stands at (203, 188) facing West
    And Nelim's Pickle Tools: I frame the rectangle from (195, 185) to (205, 191)
    And Nelim's Pickle Tools: "Boomy" is forced to walk to (201, 188)
    When Nelim's Pickle Tools: I let 20 ticks pass
    And game speed is paused
    And Nelim's Pickle Tools: "Moss" faces South
    And Nelim's Pickle Tools: I let 5 frames pass
    Then I take a screenshot "4 two new faces"
    And Nelim's Pickle Tools: the decor is removed

  Scenario: 3-heavy-fur-by-the-water
    Given I set the hour to 9
    And Nelim's Sanctuary: I am at the sanctuary "water-garden"
    And Nelim's Sanctuary: the animals are removed from the sanctuary "water-garden"
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: the colonist bar is hidden
    And Nelim's Pickle Tools: the learning helper is hidden
    And Nelim's Pickle Tools: the tooltips are hidden
    And Nelim's Pickle Tools: the resource readout is hidden
    And Nelim's Pickle Tools: the alerts are hidden
    And Nelim's Pickle Tools: the selection brackets are hidden
    And Nelim's Pickle Tools: the item and name labels are hidden
    And Nelim's Pickle Tools: I move the mouse to (10, 10)
    And Nelim's Pickle Tools: I place the decor "Plant_YellowTallGrass" at (153, 170) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_YellowTallGrass" at (154, 170) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_YellowTallGrass" at (153, 172) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_YellowTallGrass" at (154, 172) fully grown
    And Nelim's Pickle Tools: "Nelim" stands at (180, 121) facing South
    And Nelim's Pickle Tools: an adult animal of kind "Meffalo" named "Moss" is spawned at (152, 171)
    And Nelim's Pickle Tools: the animal "Moss" stands at (152, 171) facing East
    And Nelim's Pickle Tools: "Moss" is forced to walk to (155, 171)
    When Nelim's Pickle Tools: I let 15 ticks pass
    And game speed is paused
    And Nelim's Pickle Tools: I frame the rectangle from (150, 167) to (160, 173)
    And Nelim's Pickle Tools: I let 5 frames pass
    Then I take a screenshot "3 heavy fur by the water"
    And Nelim's Pickle Tools: the decor is removed

  Scenario: 2-the-calves-follow
    Given I set the hour to 8
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
    And Nelim's Pickle Tools: I place the decor "Plant_YellowTallGrass" at (153, 212) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_YellowTallGrass" at (155, 215) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_YellowTallGrass" at (154, 217) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (144, 211) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (152, 210) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (150, 216) fully grown
    And Nelim's Pickle Tools: "Nelim" stands at (180, 121) facing South
    And Nelim's Pickle Tools: an adult animal of kind "Meffalo" named "Moss" is spawned at (149, 213)
    And Nelim's Pickle Tools: the animal "Moss" stands at (149, 213) facing East
    And Nelim's Pickle Tools: an animal of kind "Meffalo" named "Mossy" is spawned at (147, 214) at life stage 0
    And Nelim's Pickle Tools: an animal of kind "Boomsloth" named "Fuse" is spawned at (146, 213) at life stage 0
    And Nelim's Pickle Tools: the animal "Mossy" stands at (147, 214) facing East
    And Nelim's Pickle Tools: the animal "Fuse" stands at (146, 213) facing East
    And Nelim's Pickle Tools: I frame the rectangle from (143, 210) to (154, 216)
    And Nelim's Pickle Tools: "Moss" is forced to walk to (153, 213)
    When Nelim's Pickle Tools: I let 15 ticks pass
    And Nelim's Pickle Tools: "Mossy" is forced to walk to (151, 214)
    And Nelim's Pickle Tools: "Fuse" is forced to walk to (150, 213)
    And Nelim's Pickle Tools: I let 30 ticks pass
    And game speed is paused
    And Nelim's Pickle Tools: I let 5 frames pass
    Then I take a screenshot "2 the calves follow"
    And Nelim's Pickle Tools: the decor is removed

  Scenario: 5-do-not-startle-it
    Given I set the hour to 15
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
    And Nelim's Pickle Tools: I place the decor "Plant_YellowTallGrass" at (195, 147) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_YellowTallGrass" at (197, 147) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_YellowTallGrass" at (195, 153) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_YellowTallGrass" at (197, 153) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_YellowTallGrass" at (199, 150) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (193, 146) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (193, 154) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (198, 148) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (198, 152) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (187, 148) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (187, 152) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (190, 147) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (190, 153) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (200, 147) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (200, 153) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_YellowTallGrass" at (188, 148) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_YellowTallGrass" at (188, 152) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_YellowTallGrass" at (191, 148) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_YellowTallGrass" at (191, 152) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_YellowTallGrass" at (199, 146) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_YellowTallGrass" at (199, 154) fully grown
    And Nelim's Pickle Tools: an adult animal of kind "Boomsloth" named "Boomy" is spawned at (196, 150)
    And Nelim's Pickle Tools: the animal "Boomy" stands at (196, 150) facing West
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Pants" dyed rgb (86, 64, 48)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Corset" dyed rgb (222, 208, 178)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Jacket" dyed rgb (204, 142, 48)
    And Nelim's Pickle Tools: "Nelim" hairstyle is "Roo_HD_Hair_Highpony"
    And Nelim's Pickle Tools: "Nelim" stands at (192, 150) facing West
    And Nelim's Pickle Tools: I frame the rectangle from (186, 146) to (200, 154)
    And Nelim's Pickle Tools: "Nelim" is forced to walk to (190, 150)
    When Nelim's Pickle Tools: I let 20 ticks pass
    And game speed is paused
    And Nelim's Sanctuary: Nelim has her own face
    And Nelim's Pickle Tools: "Nelim" brows are "BrowRaised"
    And Nelim's Pickle Tools: "Nelim" faces East
    And Nelim's Pickle Tools: "Boomy" faces West
    And Nelim's Pickle Tools: I let 5 frames pass
    Then I take a screenshot "5 do not startle it"
    And Nelim's Pickle Tools: the decor is removed

  Scenario: 6-boom
    Given I set the hour to 15
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
    And Nelim's Pickle Tools: I place the decor "Plant_YellowTallGrass" at (195, 147) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_YellowTallGrass" at (197, 147) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_YellowTallGrass" at (195, 153) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_YellowTallGrass" at (197, 153) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_YellowTallGrass" at (199, 150) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (193, 146) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (193, 154) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (198, 148) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (198, 152) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (187, 148) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (187, 152) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (190, 147) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (190, 153) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (200, 147) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (200, 153) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_YellowTallGrass" at (188, 148) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_YellowTallGrass" at (188, 152) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_YellowTallGrass" at (191, 148) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_YellowTallGrass" at (191, 152) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_YellowTallGrass" at (199, 146) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_YellowTallGrass" at (199, 154) fully grown
    And Nelim's Pickle Tools: an adult animal of kind "Boomsloth" named "Boomy" is spawned at (196, 150)
    And Nelim's Pickle Tools: the animal "Boomy" stands at (196, 150) facing West
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Pants" dyed rgb (86, 64, 48)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Corset" dyed rgb (222, 208, 178)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Jacket" dyed rgb (204, 142, 48)
    And Nelim's Pickle Tools: "Nelim" hairstyle is "Roo_HD_Hair_Highpony"
    And Nelim's Pickle Tools: "Nelim" stands at (192, 150) facing West
    And Nelim's Pickle Tools: I frame the rectangle from (186, 146) to (200, 154)
    And Nelim's Pickle Tools: "Nelim" is forced to walk to (190, 150)
    When Nelim's Pickle Tools: I let 20 ticks pass
    And game speed is paused
    And Nelim's Sanctuary: Nelim has her own face
    And Nelim's Pickle Tools: "Nelim" brows are "BrowRaised"
    And Nelim's Pickle Tools: "Nelim" lids are "LidSquinting"
    And Nelim's Pickle Tools: "Nelim" faces East
    And Nelim's Pickle Tools: "Boomy" faces West
    And Funny Creatures Renew: "Boomy" is killed
    And Nelim's Pickle Tools: I let 3 ticks pass
    And game speed is paused
    And Nelim's Pickle Tools: I let 5 frames pass
    Then I take a screenshot "6 boom"
    And Nelim's Pickle Tools: the decor is removed

  Scenario: 7-dusk-roll-call
    Given I set the hour to 19
    And Nelim's Pickle Tools: the light of the map is dimmed to at most 0.3
    And Nelim's Pickle Tools: the sun glow of the map is held at 0.3
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
    And Nelim's Pickle Tools: I place the decor "Plant_YellowTallGrass" at (159, 208) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_YellowTallGrass" at (159, 209) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_YellowTallGrass" at (159, 210) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_YellowTallGrass" at (160, 208) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_YellowTallGrass" at (160, 209) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_YellowTallGrass" at (160, 210) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_YellowTallGrass" at (161, 208) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_YellowTallGrass" at (161, 209) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_YellowTallGrass" at (161, 210) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (158, 210) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (162, 208) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (163, 209) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (157, 208) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (158, 211) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (162, 211) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (164, 208) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (165, 210) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_YellowTallGrass" at (157, 209) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_YellowTallGrass" at (164, 211) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_YellowTallGrass" at (158, 208) fully grown
    And Nelim's Pickle Tools: I place the decor "DR_StickLantern" exactly at (163, 210)
    And Nelim's Pickle Tools: the decor "DR_StickLantern" at (163, 210) is lit
    And Nelim's Pickle Tools: an adult animal of kind "Meffalo" named "Moss" is spawned at (159, 209)
    And Nelim's Pickle Tools: an animal of kind "Boomsloth" named "Fuse" is spawned at (161, 209) at life stage 0
    And Nelim's Pickle Tools: the animal "Moss" lies at (159, 209) facing West
    And Nelim's Pickle Tools: the animal "Fuse" lies at (161, 209) facing West
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Pants" dyed rgb (86, 64, 48)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Corset" dyed rgb (222, 208, 178)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Jacket" dyed rgb (204, 142, 48)
    And Nelim's Pickle Tools: "Nelim" hairstyle is "Roo_HD_Hair_Highpony"
    And Nelim's Pickle Tools: "Nelim" stands at (153, 210) facing East
    And Nelim's Pickle Tools: I frame the rectangle from (152, 205) to (164, 212)
    And Nelim's Pickle Tools: "Nelim" is forced to walk to (156, 210)
    When Nelim's Pickle Tools: I let 15 ticks pass
    And game speed is paused
    And Nelim's Pickle Tools: the things within 2 cells of (154, 209) are listed
    And Nelim's Pickle Tools: the things within 2 cells of (164, 209) are listed
    And Nelim's Pickle Tools: the things "Brazier,Yuran_Brazier_two" within 2 cells of (154, 209) are hidden when present
    And Nelim's Pickle Tools: the things "Brazier,Yuran_Brazier_two" within 2 cells of (164, 209) are hidden when present
    And Nelim's Pickle Tools: the things "Brazier,Yuran_Brazier_two" within 3 cells of (160, 213) are hidden when present
    And Nelim's Pickle Tools: the things "Plant_TreeBamboo" within 8 cells of (160, 209) are hidden when present
    And Nelim's Pickle Tools: the things "Plant_TreeBamboo" within 4 cells of (156, 209) are hidden when present
    And Nelim's Sanctuary: Nelim has her own face
    And Nelim's Pickle Tools: "Nelim" faces East
    And Nelim's Pickle Tools: the light of the map is refreshed
    And Nelim's Pickle Tools: I let 5 frames pass
    Then I take a screenshot "7 dusk roll call"
    And Nelim's Pickle Tools: the decor is removed
