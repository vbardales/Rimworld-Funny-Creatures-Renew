"""Static distribution and regression checks; does not simulate RimWorld."""
import os
from pathlib import Path
import re
import struct
import unittest
import xml.etree.ElementTree as ET

ROOT = Path(__file__).resolve().parents[1]
MOD = ROOT / 'Mod'
GAME = Path(os.environ.get('RIMWORLD_DIR', r'C:\Program Files (x86)\Steam\steamapps\common\RimWorld'))
TEXT_FIELDS = {'label', 'labelPlural', 'description', 'meatLabel'}


def inventory(node, prefix):
    """Derive owned text paths from source, independently of translation contents.

    Tool and PawnKind life-stage handles use their untranslated source labels.
    Check-DefInjected.ps1 separately verifies these handles against engine metadata.
    """
    for index, child in enumerate(node):
        if not isinstance(child.tag, str):
            continue
        segment = child.tag
        if segment == 'li':
            label = child.findtext('label')
            segment = re.sub(r'[^a-zA-Z0-9_]', '_', label) if label else str(index)
        key = prefix + '.' + segment
        if child.tag in TEXT_FIELDS:
            yield key, child.text
        yield from inventory(child, key)


class DistributionTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.defs = {}
        cls.raw_defs = []
        for file in sorted((MOD / 'Defs').rglob('*.xml')):
            for definition in ET.parse(file).getroot():
                cls.raw_defs.append(definition)
                cls.defs[(definition.tag, definition.findtext('defName'))] = definition

    def test_xml_and_unique_definitions(self):
        for file in MOD.rglob('*.xml'):
            with self.subTest(file=file.relative_to(MOD)):
                ET.parse(file)
        self.assertEqual(len(self.defs), len(self.raw_defs), 'Duplicate typed defName')
        self.assertTrue(all(name for _, name in self.defs))

    def test_french_covers_actual_source_text(self):
        expected = {}
        for (kind, name), definition in self.defs.items():
            for key, text in inventory(definition, name):
                self.assertTrue(text and text.strip(), key)
                expected[(kind, key)] = text
        actual = {}
        for file in (MOD / 'Languages/French/DefInjected').rglob('*.xml'):
            for entry in ET.parse(file).getroot():
                key = (file.parent.name, entry.tag)
                self.assertNotIn(key, actual, 'Duplicate French key')
                self.assertTrue(entry.text and entry.text.strip(), key)
                self.assertNotRegex(entry.text, r'\b(TODO|TRANSLATE_ME)\b')
                actual[key] = entry.text
        self.assertEqual(set(expected), set(actual), 'Missing or obsolete French text paths')
        self.assertTrue(expected)
        for key, source in expected.items():
            self.assertEqual(re.findall(r'\{[^{}]+\}', source), re.findall(r'\{[^{}]+\}', actual[key]))

    def test_port_regressions(self):
        for name, wildness in [('Meffalo', '0.6'), ('Boomsloth', '0.97')]:
            animal = self.defs[('ThingDef', name)]
            self.assertEqual(animal.findtext('statBases/Wildness'), wildness)
            self.assertIsNone(animal.find('race/wildness'))
            self.assertIsNone(animal.find('race/deathActionWorkerClass'))
        boom = self.defs[('ThingDef', 'Boomsloth')]
        self.assertEqual(boom.findtext('race/deathAction/workerClass'), 'DeathActionWorker_BigExplosion')
        self.assertEqual(boom.findtext('race/canBePredatorPrey'), 'false')

    def test_animal_production_contract(self):
        for name, product, wool, count, interval in [
            ('Meffalo', 'Flake', 'WoolMeffalo', '125', '15'),
            ('Boomsloth', 'Chemfuel', 'WoolMegasloth', '200', '20')
        ]:
            animal = self.defs[('ThingDef', name)]
            comps = {c.attrib['Class']: c for c in animal.find('comps')}
            milk = comps['CompProperties_Milkable']
            self.assertEqual(milk.findtext('milkDef'), product)
            self.assertEqual(milk.findtext('milkAmount'), '20')
            self.assertEqual(milk.findtext('milkIntervalDays'), '6')
            self.assertEqual(milk.findtext('milkFemaleOnly'), 'false')
            shear = comps['CompProperties_Shearable']
            self.assertEqual(shear.findtext('woolDef'), wool)
            self.assertEqual(shear.findtext('woolAmount'), count)
            self.assertEqual(shear.findtext('shearIntervalDays'), interval)
        self.assertEqual(self.defs[('ThingDef', 'Meffalo')].findtext('race/leatherDef'), 'Leather_Darkfur')

    def test_metadata_and_distribution(self):
        about = ET.parse(MOD / 'About/About.xml').getroot()
        url = 'https://github.com/vbardales/Rimworld-Funny-Creatures-Renew'
        self.assertEqual(about.findtext('packageId'), 'nelim.funnycreatures')
        self.assertEqual(about.findtext('name'), 'Funny Creatures Renew (unofficial)')
        self.assertEqual(about.findtext('url'), url)
        self.assertTrue(about.findtext('description').strip().endswith(f'[url={url}]Source code on GitHub[/url]'))
        self.assertTrue(about.findtext('description').startswith('UNOFFICIAL.'))
        self.assertIn('predatorking.funnycreatures', [e.text for e in about.findall('incompatibleWith/li')])
        self.assertIn('TSP.Isengriff.Storytime', [e.text for e in about.findall('incompatibleWith/li')])
        self.assertFalse(about.findall('modDependencies/li'))
        self.assertEqual((ROOT / 'ATTRIBUTION.md').read_bytes(), (MOD / 'ATTRIBUTION.md').read_bytes())
        self.assertFalse(list(MOD.rglob('*.cs')) + list(MOD.rglob('*.csproj')))

    def test_settings_absence_contract(self):
        # Fixed species design requires no settings page or dependency-based shortcut.
        self.assertFalse(list(MOD.rglob('*.dll')))
        self.assertFalse(any(kind == 'MainButtonDef' for kind, _ in self.defs))

    def test_local_texture_paths(self):
        for definition in self.raw_defs:
            for node in definition.iter('texPath'):
                if node.text.startswith('funnycreatures/'):
                    base = MOD / 'Textures' / node.text
                    self.assertTrue(list(base.parent.glob(base.name + '*.png')), node.text)
                    if '/Dessicated/' not in node.text:
                        for direction in ['north', 'south', 'east']:
                            self.assertTrue(base.with_name(base.name + '_' + direction + '.png').exists())

    def test_images(self):
        for filename, size in [('ModIcon.png', (128, 128)), ('Preview.png', (896, 504))]:
            data = (MOD / 'About' / filename).read_bytes()
            self.assertEqual(data[:8], b'\x89PNG\r\n\x1a\n')
            self.assertEqual(struct.unpack('>II', data[16:24]), size)
            self.assertLess(len(data), 900000)

    def test_core_references_and_inheritance(self):
        core = GAME / 'Data/Core/Defs'
        self.assertTrue(core.is_dir(), 'Set RIMWORLD_DIR to an installed 1.6 game for Core checks')
        names = set()
        parents = set()
        for file in core.rglob('*.xml'):
            for definition in ET.parse(file).getroot():
                names.add(definition.findtext('defName'))
                if definition.get('Name'):
                    parents.add(definition.get('Name'))
        names.update(name for _, name in self.defs)
        # Def references used by this content; class and packed-asset resolution is a runtime check.
        tags = {'woolDef','milkDef','leatherDef','body','def','trainability',
                'soundWounded','soundDeath','soundCall','soundAngry','soundMeleeHitPawn',
                'soundMeleeHitBuilding','soundMeleeMiss','linkedBodyPartsGroup'}
        for definition in self.raw_defs:
            if definition.get('ParentName'):
                self.assertIn(definition.get('ParentName'), parents)
            for node in definition.iter():
                if node.tag in tags:
                    self.assertIn(node.text, names, f'Missing Core/local reference: {node.tag}={node.text}')
            for biome in definition.findall('race/wildBiomes/*'):
                self.assertIn(biome.tag, names)


# ---------------------------------------------------------------------------------------------------
# Compatibility patches. RimWorld applies XML patches with .NET's XPath 1.0; lxml has the same
# semantics (an `or` over string literals is always true, for one), which ElementTree does not, so
# these tests apply the real patch files to the real Core definitions instead of only parsing them.
# ---------------------------------------------------------------------------------------------------
import copy

try:
    from lxml import etree as LX
except ImportError:  # the patch-application tests are skipped, the structural ones still run
    LX = None

WORKSHOP = Path(os.environ.get('RIMWORLD_WORKSHOP',
                               r'C:\Program Files (x86)\Steam\steamapps\workshop\content\294100'))
ADS_NAME = 'A Dog Said... Animal Prosthetics 2'
NA_NAME = '[XND] Nocturnal Animals (Continued)'
BC_NAME = 'Better Crossbreeding'
BC_CLASS = 'DZY.CrossBreeding.Extension'
NA_CLASS = 'NocturnalAnimals.ExtendedRaceProperties'
OPERATION_CLASSES = {'PatchOperationSequence', 'PatchOperationFindMod', 'PatchOperationConditional',
                     'PatchOperationAdd', 'PatchOperationAddModExtension'}


def elements(node):
    return [c for c in node if isinstance(c.tag, str)]


def absolute(xpath):
    xpath = xpath.strip()
    return xpath if xpath.startswith('/') else '/' + xpath


def apply_operation(op, doc, active):
    """The subset of Verse.PatchOperation these patch files use, with RimWorld's semantics."""
    cls = op.get('Class')
    assert cls in OPERATION_CLASSES, f'operation not covered by the test applier: {cls}'
    if cls == 'PatchOperationSequence':
        for child in elements(op.find('operations')):
            apply_operation(child, doc, active)
    elif cls == 'PatchOperationFindMod':
        names = [li.text for li in op.find('mods')]
        branch = op.find('match') if any(n in active for n in names) else op.find('nomatch')
        if branch is not None:
            apply_operation(branch, doc, active)
    elif cls == 'PatchOperationConditional':
        branch = op.find('match') if doc.xpath(absolute(op.findtext('xpath'))) else op.find('nomatch')
        if branch is not None:
            apply_operation(branch, doc, active)
    elif cls == 'PatchOperationAdd':
        for node in doc.xpath(absolute(op.findtext('xpath'))):
            for child in elements(op.find('value')):
                node.append(copy.deepcopy(child))
    elif cls == 'PatchOperationAddModExtension':
        for node in doc.xpath(absolute(op.findtext('xpath'))):
            holder = node.find('modExtensions')
            if holder is None:
                holder = LX.SubElement(node, 'modExtensions')
            for child in elements(op.find('value')):
                holder.append(copy.deepcopy(child))


def apply_patch_file(name, doc, active):
    for op in LX.parse(str(MOD / 'Patches' / name)).getroot().findall('Operation'):
        apply_operation(op, doc, active)


def snapshot(doc):
    return LX.tostring(doc)


@unittest.skipIf(LX is None, 'lxml is needed to apply the patches')
class CompatibilityPatchTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.core = GAME / 'Data/Core/Defs'
        assert cls.core.is_dir(), 'Set RIMWORLD_DIR to an installed 1.6 game for Core checks'

    def fresh_doc(self):
        """Core definitions plus this mod's, as one document: what the patches run against."""
        root = LX.Element('Defs')
        for folder in (self.core, MOD / 'Defs'):
            for file in sorted(folder.rglob('*.xml')):
                for child in LX.parse(str(file)).getroot():
                    if isinstance(child.tag, str):
                        root.append(child)
        return LX.ElementTree(root)

    @staticmethod
    def races(doc, name):
        return [li.text for li in doc.xpath(f'/Defs/ThingDef[defName="{name}"]/race/canCrossBreedWith/li')]

    @staticmethod
    def outcomes(doc, kind):
        holder = doc.xpath(f'/Defs/PawnKindDef[defName="{kind}"]/modExtensions/li[@Class="{BC_CLASS}"]/outcomes')
        result = {}
        for outcomes in holder:
            for father in elements(outcomes):
                behavior = elements(father)[0]
                result[father.tag] = (behavior.tag, [c.tag for c in elements(behavior)])
        return result

    def test_every_operation_is_guarded(self):
        files = sorted((MOD / 'Patches').glob('*.xml'))
        self.assertEqual([f.name for f in files], ['Compat_ADogSaidAnimalProsthetics2.xml',
                                                   'Compat_BetterCrossbreeding.xml',
                                                   'Compat_NocturnalAnimals.xml'])
        for file in files:
            root = ET.parse(file).getroot()
            for op in root.findall('Operation'):
                with self.subTest(file=file.name):
                    # MayRequire on an <Operation> is read by nothing; only these two guards work.
                    self.assertNotIn('MayRequire', op.attrib)
                    self.assertIn(op.get('Class'), {'PatchOperationFindMod', 'PatchOperationConditional'})
                    self.assertIsNone(op.find('nomatch'), 'a guard must do nothing when the mod is absent')

    def test_load_order_for_ads2_is_declared(self):
        about = ET.parse(MOD / 'About/About.xml').getroot()
        self.assertIn('SamBucher.ADogSaidAnimalProsthetics2', [e.text for e in about.findall('loadBefore/li')])
        self.assertFalse(about.findall('modDependencies/li'), 'every integration stays optional')

    def test_ads2_adds_both_animals_to_all_three_categories_and_nothing_else(self):
        doc = self.fresh_doc()
        root = doc.getroot()
        for cat in ('ADS_Cat1', 'ADS_Cat2', 'ADS_Cat3'):
            recipe = LX.SubElement(root, 'RecipeDef', Name=cat, Abstract='True')
            LX.SubElement(LX.SubElement(recipe, 'recipeUsers'), 'li').text = 'Muffalo'
        unrelated = LX.SubElement(root, 'RecipeDef')
        LX.SubElement(unrelated, 'defName').text = 'UnrelatedSurgery'
        LX.SubElement(LX.SubElement(unrelated, 'recipeUsers'), 'li').text = 'Cat'
        apply_patch_file('Compat_ADogSaidAnimalProsthetics2.xml', doc, set())  # ADS 2 present, no other mod
        for cat in ('ADS_Cat1', 'ADS_Cat2', 'ADS_Cat3'):
            users = [li.text for li in doc.xpath(f'/Defs/RecipeDef[@Name="{cat}"]/recipeUsers/li')]
            self.assertEqual(users, ['Muffalo', 'Meffalo', 'Boomsloth'], cat)
        # The always-true predicate this file avoids would have reached every RecipeDef in the game.
        self.assertEqual([li.text for li in doc.xpath('/Defs/RecipeDef[defName="UnrelatedSurgery"]/recipeUsers/li')],
                         ['Cat'])
        reached = doc.xpath('/Defs/RecipeDef[not(@Name)]/recipeUsers/li[text()="Meffalo" or text()="Boomsloth"]')
        self.assertEqual(reached, [], 'a recipe outside the three categories was reached')

    def test_ads2_absent_changes_nothing(self):
        doc = self.fresh_doc()
        before = snapshot(doc)
        apply_patch_file('Compat_ADogSaidAnimalProsthetics2.xml', doc, set())
        self.assertEqual(snapshot(doc), before)

    def test_ads2_against_the_installed_categories(self):
        path = WORKSHOP / '3238353862/1.6/Defs/AnimalCategories/Animal_Categories.xml'
        if not path.exists():
            self.skipTest('ADS 2 is not installed')
        doc = LX.parse(str(path))
        before = {c: [li.text for li in doc.xpath(f'/Defs/RecipeDef[@Name="{c}"]/recipeUsers/li')]
                  for c in ('ADS_Cat1', 'ADS_Cat2', 'ADS_Cat3')}
        apply_patch_file('Compat_ADogSaidAnimalProsthetics2.xml', doc, set())
        for cat, users in before.items():
            after = [li.text for li in doc.xpath(f'/Defs/RecipeDef[@Name="{cat}"]/recipeUsers/li')]
            self.assertEqual(after, users + ['Meffalo', 'Boomsloth'], cat)
            # The rationale in the patch header: the counterparts are in every category.
            self.assertIn('Muffalo', users)
            self.assertIn('Megasloth', users)

    def test_nocturnal_boomsloth_only_and_only_with_the_mod(self):
        doc = self.fresh_doc()
        before = snapshot(doc)
        apply_patch_file('Compat_NocturnalAnimals.xml', doc, set())
        self.assertEqual(snapshot(doc), before)
        apply_patch_file('Compat_NocturnalAnimals.xml', doc, {NA_NAME})
        clock = doc.xpath(f'/Defs/ThingDef[defName="Boomsloth"]/modExtensions/li[@Class="{NA_CLASS}"]/bodyClock')
        self.assertEqual([c.text for c in clock], ['Nocturnal'])
        self.assertFalse(doc.xpath('/Defs/ThingDef[defName="Meffalo"]/modExtensions'))

    def test_nocturnal_rationale_holds_in_the_installed_mod(self):
        core = WORKSHOP / '2269731409/1.6/Patches/Core'
        if not core.is_dir():
            self.skipTest('Nocturnal Animals is not installed')
        text = '\n'.join(p.read_text(encoding='utf-8') for p in core.glob('*.xml'))
        self.assertIn('defName="Megasloth"', text)
        self.assertNotIn('defName="Muffalo"', text)
        self.assertNotIn('defName="Boomalope"', text)
        dll = list((WORKSHOP / '2269731409/1.6/Assemblies').glob('*.dll'))
        self.assertTrue(dll and b'ExtendedRaceProperties' in dll[0].read_bytes())

    def test_crossbreeding_patch_builds_the_designed_pairs(self):
        doc = self.fresh_doc()
        before = snapshot(doc)
        apply_patch_file('Compat_BetterCrossbreeding.xml', doc, set())
        self.assertEqual(snapshot(doc), before, 'nothing may change without Better Crossbreeding')
        apply_patch_file('Compat_BetterCrossbreeding.xml', doc, {BC_NAME})
        self.assertEqual(self.races(doc, 'Meffalo'), ['Muffalo'])
        self.assertEqual(self.races(doc, 'Muffalo'), ['Meffalo'])
        self.assertEqual(self.races(doc, 'Boomsloth'), ['Megasloth', 'Boomalope'])
        self.assertEqual(self.races(doc, 'Megasloth'), ['Boomsloth'])
        self.assertEqual(self.races(doc, 'Boomalope'), ['Boomsloth'])
        self.assertEqual(self.outcomes(doc, 'Meffalo'), {'Muffalo': ('Random', [])})
        self.assertEqual(self.outcomes(doc, 'Muffalo'), {'Meffalo': ('Random', [])})
        self.assertEqual(self.outcomes(doc, 'Boomsloth'),
                         {'Megasloth': ('Random', []), 'Boomalope': ('Random', [])})
        self.assertEqual(self.outcomes(doc, 'Megasloth'), {'Boomsloth': ('Random', [])})
        self.assertEqual(self.outcomes(doc, 'Boomalope'), {'Boomsloth': ('Random', [])})

    def test_crossbreeding_never_pairs_two_vanilla_animals(self):
        # Owner rule of 2026-09-28: a pairing where both animals are vanilla belongs to Animal Naturally.
        doc = self.fresh_doc()
        apply_patch_file('Compat_BetterCrossbreeding.xml', doc, {BC_NAME})
        vanilla = {'Muffalo', 'Megasloth', 'Boomalope'}
        for male in vanilla:
            self.assertFalse(vanilla & set(self.races(doc, male)), f'{male} was paired with a vanilla animal')
            self.assertFalse(vanilla & set(self.outcomes(doc, male)), f'{male} mother got a vanilla father')

    def test_crossbreeding_pairs_are_usable_in_both_directions(self):
        # The male's race decides who mates; the mother's kind decides what is born. A pair that has one
        # half without the other would mate and give a plain maternal calf, or never mate at all.
        doc = self.fresh_doc()
        apply_patch_file('Compat_BetterCrossbreeding.xml', doc, {BC_NAME})
        names = ['Meffalo', 'Muffalo', 'Boomsloth', 'Megasloth', 'Boomalope']
        for male in names:
            for female in self.races(doc, male):
                with self.subTest(male=male, female=female):
                    self.assertIn(female, names)
                    self.assertIn(male, self.outcomes(doc, female), 'no outcome on the mother for this father')
        for mother in names:
            for father in self.outcomes(doc, mother):
                with self.subTest(mother=mother, father=father):
                    self.assertIn(mother, self.races(doc, father), 'the father would never seek this mother')

    def test_crossbreeding_names_are_real_animals(self):
        doc = self.fresh_doc()
        things = set(doc.xpath('/Defs/ThingDef[race/body]/defName/text()'))
        kinds = set(doc.xpath('/Defs/PawnKindDef/defName/text()'))
        for name in ['Meffalo', 'Muffalo', 'Boomsloth', 'Megasloth', 'Boomalope']:
            self.assertIn(name, things, name)
            self.assertIn(name, kinds, name)
        for name in ['Muffalo', 'Megasloth', 'Boomalope']:
            self.assertEqual(doc.xpath(f'/Defs/ThingDef[defName="{name}"]/race/canCrossBreedWith'), [],
                             'the vanilla animal already has a list: the patch must append, see the next test')

    def test_crossbreeding_appends_to_lists_and_extensions_that_already_exist(self):
        doc = self.fresh_doc()
        muffalo = doc.xpath('/Defs/ThingDef[defName="Muffalo"]/race')[0]
        LX.SubElement(LX.SubElement(muffalo, 'canCrossBreedWith'), 'li').text = 'Cow'
        kind = doc.xpath('/Defs/PawnKindDef[defName="Muffalo"]')[0]
        extension = LX.SubElement(LX.SubElement(kind, 'modExtensions'), 'li', Class=BC_CLASS)
        LX.SubElement(LX.SubElement(LX.SubElement(extension, 'outcomes'), 'Cow'), 'Maternal')
        apply_patch_file('Compat_BetterCrossbreeding.xml', doc, {BC_NAME})
        self.assertEqual(len(doc.xpath('/Defs/ThingDef[defName="Muffalo"]/race/canCrossBreedWith')), 1)
        self.assertEqual(self.races(doc, 'Muffalo'), ['Cow', 'Meffalo'])
        self.assertEqual(len(doc.xpath(f'/Defs/PawnKindDef[defName="Muffalo"]/modExtensions/li[@Class="{BC_CLASS}"]')), 1)
        self.assertEqual(self.outcomes(doc, 'Muffalo'), {'Cow': ('Maternal', []), 'Meffalo': ('Random', [])})

    def test_crossbreeding_class_name_matches_the_compiled_assembly(self):
        # The mod's own Example writes DZY.Crossbreeding (lower-case b); the assembly declares
        # DZY.CrossBreeding. A patch copied from the Example would name a type that does not exist.
        # Real attributes only: the file's header quotes the Example's wrong spelling in a comment.
        root = ET.parse(MOD / 'Patches/Compat_BetterCrossbreeding.xml').getroot()
        classes = {n.get('Class') for n in root.iter() if (n.get('Class') or '').startswith('DZY.')}
        self.assertEqual(classes, {BC_CLASS})
        dll = WORKSHOP / '3520675842/1.6/Assemblies/BetterCrossbreeding.dll'
        if not dll.exists():
            self.skipTest('Better Crossbreeding is not installed')
        data = dll.read_bytes()
        self.assertIn(b'DZY.CrossBreeding', data)
        self.assertNotIn(b'DZY.Crossbreeding', data)

    def test_every_patch_names_the_mod_the_way_the_game_does(self):
        for name, folder in [(ADS_NAME, '3238353862'), (NA_NAME, '2269731409'), (BC_NAME, '3520675842')]:
            about = WORKSHOP / folder / 'About/About.xml'
            if not about.exists():
                continue
            self.assertEqual(ET.parse(about).getroot().findtext('name'), name)


if __name__ == '__main__':
    unittest.main(verbosity=2)
