"""Measure text contrast against the rendered veil, without editing the artwork."""
import json
import math
from pathlib import Path
from PIL import Image

art = Path(__file__).resolve().parent
background = Image.open(art / 'preview-background.png').convert('RGB')
metrics = json.loads((art / 'preview-render.json').read_text())['metrics']
palette = json.loads((art / 'preview-palette.json').read_text())

def luminance(rgb):
    c = [v / 255 for v in rgb]
    c = [v / 12.92 if v <= .04045 else ((v + .055) / 1.055) ** 2.4 for v in c]
    return sum(v * w for v, w in zip(c, [.2126, .7152, .0722]))

def contrast(a, b):
    a, b = sorted([luminance(a), luminance(b)])
    return (b + .05) / (a + .05)

def color(name):
    return tuple(int(palette[name][i:i+2], 16) for i in (1,3,5))

results = {}
for selector, ink in [('h1','inkPrimary'),('.suffix','inkSecondary'),('.tag','inkSecondary'),('p','inkPrimary')]:
    m = metrics[selector]
    # Conservative whole-element rectangles, including spaces between letters and lines.
    pixels = background.crop((math.floor(m['x']), math.floor(m['y']),
                              math.ceil(m['x']+m['width']), math.ceil(m['y']+m['height']))).get_flattened_data()
    results[selector] = round(min(contrast(color(ink), p) for p in pixels), 3)
results['badge'] = round(contrast(color('badgeInk'), color('accent')), 3)
(art / 'preview-contrast.json').write_text(json.dumps(results, indent=2)+'\n')
print(json.dumps(results, indent=2))
assert all(v >= 4.5 for v in results.values()), 'Text contrast below 4.5:1'
