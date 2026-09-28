"""Offline checks of the Pickle suite in Tests/Pickle. They do not start a game.

A run confiscates the machine for tens of minutes, and an undefined or ambiguous step, a tag that selects nothing, or
a pass map that stages the wrong folder costs a whole run before any scenario has played. Everything below is what can be
established from the files alone: that each line of each feature matches exactly one known step, that the passes are
consistent with the maps and the tags, and that the def names the scenarios point at exist.
"""
import os
from pathlib import Path
import re
import unittest
import xml.etree.ElementTree as ET

ROOT = Path(__file__).resolve().parents[1]
COLLECTION = ROOT.parent
PICKLE = ROOT / 'Tests' / 'Pickle'
FEATURES = PICKLE / 'Mod' / 'Pickle' / 'Features'
STEPS_CS = PICKLE / 'Source' / 'FunnyCreaturesSteps.cs'
GAME = Path(os.environ.get('RIMWORLD_DIR', r'C:\Program Files (x86)\Steam\steamapps\common\RimWorld'))
WORKSHOP = Path(os.environ.get('RIMWORLD_WORKSHOP',
                               r'C:\Program Files (x86)\Steam\steamapps\workshop\content\294100'))

PREFIX = 'Funny Creatures Renew:'
ALLOWED_TAGS = {'review', 'film', 'allow-errors', 'sans-facultatifs', 'core-only', 'clean-load'}
REQUIRES = re.compile(r'^requires:[A-Za-z0-9_.]+$')
EXPANSIONS = {'ludeon.rimworld.royalty', 'ludeon.rimworld.ideology', 'ludeon.rimworld.biotech',
              'ludeon.rimworld.anomaly', 'ludeon.rimworld.odyssey'}
# The two steps of PickleTools' load audit, from PickleTools/docs/steps.md (the tool is staged by every pass map).
LOAD_AUDIT = ["Nelim's Pickle Tools: the load of the mod {string} is clean",
              "Nelim's Pickle Tools: the load of the mod {string} is clean, apart from {string}"]


def to_regex(expression):
    """A Cucumber expression, as far as these steps use one: {string} {int} {float} {word} and escaped characters."""
    out, i = [], 0
    while i < len(expression):
        if expression.startswith('{string}', i):
            out.append(r'(?:"[^"]*"|\'[^\']*\')')
            i += len('{string}')
        elif expression.startswith('{int}', i):
            out.append(r'-?\d+')
            i += len('{int}')
        elif expression.startswith('{float}', i):
            out.append(r'-?\d+(?:\.\d+)?')
            i += len('{float}')
        elif expression.startswith('{word}', i):
            out.append(r'[^\s]+')
            i += len('{word}')
        elif expression[i] == '\\' and i + 1 < len(expression):
            out.append(re.escape(expression[i + 1]))
            i += 2
        else:
            out.append(re.escape(expression[i]))
            i += 1
    return re.compile('^' + ''.join(out) + '$')


def builtin_steps():
    steps = []
    for line in (PICKLE / 'pickle-steps.txt').read_text(encoding='utf-8').splitlines():
        if line and not line.startswith('#'):
            steps.append(line.split('\t', 1)[1])
    return steps


def custom_steps():
    text = STEPS_CS.read_text(encoding='utf-8')
    return re.findall(r'\[(?:Given|When|Then)\("((?:[^"\\]|\\.)*)"', text)


def parse_features():
    """(file, tags, scenario, keyword, step text) for every step line; tags are those in force for the scenario."""
    steps, features = [], {}
    for file in sorted(FEATURES.glob('*.feature')):
        feature_tags, scenario_tags, pending, scenario = set(), set(), set(), None
        seen_feature = False
        collected = []
        for raw in file.read_text(encoding='utf-8').splitlines():
            line = raw.strip()
            if not line or line.startswith('#'):
                continue
            if line.startswith('@'):
                pending |= {t[1:] for t in line.split()}
                continue
            if line.startswith('Feature:'):
                feature_tags, pending, seen_feature = pending, set(), True
                continue
            if line.startswith('Background:'):
                scenario, scenario_tags, pending = 'Background', set(), set()
                continue
            if line.startswith(('Scenario:', 'Scenario Outline:')):
                scenario, scenario_tags, pending = line.split(':', 1)[1].strip(), pending, set()
                continue
            match = re.match(r'^(Given|When|Then|And|But)\s+(.*)$', line)
            if match:
                collected.append((file.name, feature_tags | scenario_tags, scenario, match.group(1), match.group(2)))
        steps.extend(collected)
        features[file.name] = (feature_tags, seen_feature)
    return steps, features


def read_map(path):
    entries = []
    for number, line in enumerate(path.read_text(encoding='utf-8').splitlines(), 1):
        stripped = line.split('#', 1)[0].strip()
        if stripped:
            entries.append((number, stripped.split()))
    return entries


class PickleSuiteTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.steps, cls.features = parse_features()
        cls.custom = custom_steps()
        cls.known = builtin_steps() + LOAD_AUDIT + cls.custom
        cls.compiled = [(e, to_regex(e)) for e in cls.known]

    def test_there_are_features_and_steps(self):
        self.assertGreaterEqual(len(self.features), 12)
        self.assertGreater(len(self.steps), 50)
        self.assertGreater(len(builtin_steps()), 190, 'pickle-steps.txt looks truncated')

    def test_every_step_line_matches_exactly_one_step(self):
        for file, _, scenario, keyword, text in self.steps:
            with self.subTest(file=file, scenario=scenario, step=text):
                matches = [e for e, rx in self.compiled if rx.match(text)]
                self.assertTrue(matches, 'undefined step: ' + text)
                self.assertEqual(len(matches), 1, 'ambiguous step: ' + text + ' matches ' + repr(matches))

    def test_custom_steps_are_well_formed_and_all_used(self):
        self.assertGreater(len(self.custom), 15)
        texts = [t for _, _, _, _, t in self.steps]
        for expression in self.custom:
            with self.subTest(step=expression):
                self.assertTrue(expression.startswith(PREFIX), 'a step text must carry the mod name')
                # Cucumber reads these as optional text and alternatives.
                self.assertNotRegex(re.sub(r'\{[a-z]*\}', '', expression), r'[()/]')
                regex = to_regex(expression)
                self.assertTrue(any(regex.match(t) for t in texts), 'no feature uses this step: delete it')
        self.assertEqual(len(self.custom), len(set(self.custom)), 'a step is declared twice')

    def test_no_custom_step_collides_with_a_builtin(self):
        builtin = [to_regex(e) for e in builtin_steps() + LOAD_AUDIT]
        for expression in self.custom:
            sample = re.sub(r'\{string\}', '"x"', expression)
            sample = re.sub(r'\{int\}', '1', sample)
            sample = re.sub(r'\{word\}', 'word', sample)
            with self.subTest(step=expression):
                self.assertFalse([rx for rx in builtin if rx.match(sample)])

    def test_tags_are_known_and_nothing_is_set_aside(self):
        for file, (tags, seen) in self.features.items():
            self.assertTrue(seen, file + ' has no Feature line')
            for tag in tags:
                with self.subTest(file=file, tag=tag):
                    self.assertNotEqual(tag, 'wip', 'a scenario set aside is not a scenario passed')
                    self.assertTrue(tag in ALLOWED_TAGS or REQUIRES.match(tag), 'unknown tag @' + tag)
        for file, tags, scenario, _, _ in self.steps:
            for tag in tags:
                self.assertNotEqual(tag, 'wip', file)
                self.assertTrue(tag in ALLOWED_TAGS or REQUIRES.match(tag), f'{file}: unknown tag @{tag}')

    def test_features_are_numbered_and_named_after_what_they_show(self):
        names = [f.name for f in sorted(FEATURES.glob('*.feature'))]
        for index, name in enumerate(names, 1):
            self.assertRegex(name, rf'^{index:02d}-[a-z0-9-]+\.feature$')

    def test_the_companion_is_a_pickle_test_mod_of_this_mod(self):
        about = ET.parse(PICKLE / 'Mod/About/About.xml').getroot()
        self.assertEqual(about.findtext('packageId'), 'nelim.funnycreatures.pickletests')
        deps = [e.text for e in about.findall('modDependencies/li/packageId')]
        self.assertEqual(sorted(deps), ['nelim.funnycreatures', 'rimworks.pickle'])
        for dep in about.findall('modDependencies/li'):
            self.assertTrue(dep.findtext('displayName'))
        self.assertIn('Pickle tests', about.findtext('name'))
        # A test dependency without a URL logs a warning that the load audit attributes to this mod.
        for dep in about.findall('modDependencies/li'):
            if dep.findtext('packageId') == 'rimworks.pickle':
                self.assertTrue(dep.findtext('steamWorkshopUrl') or dep.findtext('downloadUrl'))

    def test_every_map_is_well_formed_and_ends_with_a_newline(self):
        maps = sorted(PICKLE.glob('wsl-deps.*.map'))
        self.assertEqual([m.name for m in maps], ['wsl-deps.avec-facultatifs.map', 'wsl-deps.core-only.map',
                                                  'wsl-deps.incompat-original.map', 'wsl-deps.tools.map'])
        for path in maps:
            with self.subTest(map=path.name):
                # `read` drops a last line with no newline, without a word, and the mod on it is never staged.
                self.assertTrue(path.read_bytes().endswith(b'\n'))
                for number, parts in read_map(path):
                    if parts[0].startswith('!'):
                        self.assertIn(parts[0][1:], EXPANSIONS, f'{path.name}:{number} may only drop an expansion')
                        continue
                    self.assertEqual(len(parts), 2, f'{path.name}:{number} is not "packageId workshopId|path:folder"')
                    if parts[1].startswith('path:'):
                        folder = COLLECTION / parts[1][len('path:'):]
                        about = folder / 'About' / 'About.xml'
                        self.assertTrue(about.exists(), f'{path.name}:{number}: no About/About.xml in {folder}')
                        self.assertEqual(ET.parse(about).getroot().findtext('packageId'), parts[0],
                                         f'{path.name}:{number}: the folder declares another packageId')
                    else:
                        self.assertRegex(parts[1], r'^\d+$')

    def test_the_optional_mod_pass_loads_this_mod_before_ads2(self):
        order = [parts[0] for _, parts in read_map(PICKLE / 'wsl-deps.avec-facultatifs.map')]
        self.assertLess(order.index('nelim.funnycreatures'), order.index('SamBucher.ADogSaidAnimalProsthetics2'),
                        'ADS 2 copies its lists once: this mod has to load first (About.xml loadBefore)')
        self.assertEqual(sorted(order), sorted(['nelim.pickletools.loadaudit', 'nelim.funnycreatures',
                                                'SamBucher.ADogSaidAnimalProsthetics2', 'Mlie.XNDNocturnalAnimals',
                                                'DizzyEevee.BetterCrossbreeding']))
        self.assertEqual({p[0] for _, p in read_map(PICKLE / 'wsl-deps.incompat-original.map')},
                         {'nelim.pickletools.loadaudit', 'predatorking.funnycreatures'})
        self.assertEqual({p[0] for _, p in read_map(PICKLE / 'wsl-deps.core-only.map')} - {'nelim.pickletools.loadaudit'},
                         {'!' + e for e in EXPANSIONS})

    def test_every_requirement_is_staged_by_the_map_that_plays_it(self):
        staged = {
            'SamBucher.ADogSaidAnimalProsthetics2': 'wsl-deps.avec-facultatifs.map',
            'Mlie.XNDNocturnalAnimals': 'wsl-deps.avec-facultatifs.map',
            'DizzyEevee.BetterCrossbreeding': 'wsl-deps.avec-facultatifs.map',
            'predatorking.funnycreatures': 'wsl-deps.incompat-original.map',
            'nelim.pickletools.loadaudit': 'wsl-deps.tools.map',
        }
        for file, (tags, _) in self.features.items():
            for tag in tags:
                if tag.startswith('requires:'):
                    with self.subTest(file=file, tag=tag):
                        package = tag[len('requires:'):]
                        self.assertIn(package, staged)
                        names = [p[0] for _, p in read_map(PICKLE / staged[package])]
                        self.assertIn(package, names)

    def test_step_arguments_name_defs_that_exist(self):
        core = GAME / 'Data/Core/Defs'
        if not core.is_dir():
            self.skipTest('no installed game')
        kinds, things = set(), set()
        for file in core.rglob('*.xml'):
            for definition in ET.parse(file).getroot():
                name = definition.findtext('defName')
                if definition.tag == 'PawnKindDef':
                    kinds.add(name)
                elif definition.tag == 'ThingDef':
                    things.add(name)
        for file in (ROOT / 'Mod/Defs').rglob('*.xml'):
            for definition in ET.parse(file).getroot():
                name = definition.findtext('defName')
                (kinds if definition.tag == 'PawnKindDef' else things).add(name)
        recipes = set()
        ads = WORKSHOP / '3238353862/1.6/Defs/HediffDefs'
        if ads.is_dir():
            for file in ads.glob('*.xml'):
                recipes.update(re.findall(r'<defName>([^<]+)</defName>', file.read_text(encoding='utf-8')))
        for file, _, scenario, _, text in self.steps:
            with self.subTest(file=file, step=text):
                quoted = re.findall(r'"([^"]*)"', text)
                if re.search(r'is spawned at|calf named', text):
                    self.assertIn(quoted[0], kinds, 'not a PawnKindDef')
                elif text.startswith(PREFIX + ' the race'):
                    self.assertIn(quoted[0], things, 'not a ThingDef')
                    if 'recipe' in text and recipes:
                        self.assertIn(quoted[1], recipes, 'not a recipe of the installed ADS 2')
                elif ' mother answers ' in text:
                    self.assertIn(quoted[0], kinds)
                    self.assertIn(quoted[1], kinds)
                elif text.startswith(PREFIX + ' the kind'):
                    self.assertIn(quoted[0], kinds)

    def test_passes_are_selectable_by_the_filters_written_in_the_readme(self):
        readme = (PICKLE / 'README.md').read_text(encoding='utf-8')
        for tag in ('@sans-facultatifs', '@core-only', '@clean-load'):
            self.assertIn(tag, readme, tag + ' is used by a feature and must be explained where the passes are')
        for name in sorted(f.stem for f in FEATURES.glob('*.feature')):
            self.assertIn(name, readme, name + ' is not placed in a pass of the README')


if __name__ == '__main__':
    unittest.main(verbosity=2)
