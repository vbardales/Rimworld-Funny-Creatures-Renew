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
        self.assertEqual(about.findtext('packageId'), 'nelim.funnycreaturesrenew')
        self.assertEqual(about.findtext('name'), 'Funny Creatures Renew (unofficial)')
        self.assertEqual(about.findtext('url'), url)
        self.assertTrue(about.findtext('description').strip().endswith(f'[url={url}]Source code on GitHub[/url]'))
        self.assertTrue(about.findtext('description').startswith('UNOFFICIAL.'))
        self.assertIn('predatorking.funnycreatures', [e.text for e in about.findall('incompatibleWith/li')])
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


if __name__ == '__main__':
    unittest.main(verbosity=2)
