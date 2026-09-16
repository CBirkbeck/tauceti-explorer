"""Collect every 'decisions / questions for the orchestrator' section from the
review reports into research/expansion/DECISIONS.md. Mechanical extraction:
nothing is rephrased, resolved or dropped. Re-run after each review lands."""
import re, datetime
from pathlib import Path
ROOT = Path(__file__).resolve().parent
PATTERN = re.compile(r'orchestrator|decision|supplier (?:question|request)|questions? for|open items|items for', re.I)
out = ['# Open decisions from the independent reviews', '',
       f'Generated {datetime.date.today().isoformat()} by `research/expansion/collect_decisions.py` from `research/expansion/reviews/*.md`. '
       'Every item below is quoted from a review report and is still open: the atlas snapshot (`data/atlas.json`) is immutable, so reversed or missing '
       'stage edges, stage texts that contradict their sources, and missing suppliers can only be recorded here or fixed upstream. Reports whose '
       'reviewer is still running are marked as such and will be regenerated.', '']
for f in sorted((ROOT / 'reviews').glob('*.md')):
    text = f.read_text().splitlines()
    sections, i = [], 0
    while i < len(text):
        m = re.match(r'^(#{1,6})\s+(.*)', text[i])
        if m and PATTERN.search(m.group(2)):
            level = len(m.group(1)); body = []; j = i + 1
            while j < len(text) and not re.match(r'^#{1,%d}\s' % level, text[j]):
                body.append(text[j]); j += 1
            # Context: the nearest preceding heading of a higher level names the packet.
            context = next((re.match(r'^#{1,6}\s+(.*)', text[k]).group(1) for k in range(i - 1, -1, -1) if re.match(r'^#{1,%d}\s' % (level - 1), text[k])), '')
            sections.append((context, m.group(2), '\n'.join(body).strip())); i = j
        else:
            i += 1
    if not sections:
        continue
    stamp = datetime.datetime.fromtimestamp(f.stat().st_mtime).strftime('%Y-%m-%d %H:%M')
    fresh = (datetime.datetime.now() - datetime.datetime.fromtimestamp(f.stat().st_mtime)).total_seconds() < 3 * 3600
    out.append(f'## {f.name}' + (' (reviewer still running; partial)' if fresh else '') + f' — last written {stamp}')
    out.append('')
    for context, heading, body in sections:
        out.append(f'### {heading}' + (f' — {context}' if context and context != heading else ''))
        out.append(''); out.append(body); out.append('')
(ROOT / 'DECISIONS.md').write_text('\n'.join(out).rstrip() + '\n')
items = sum(1 for line in out if re.match(r'^\s*(?:[-*]|\d+[.)])\s', line))
print('sections', sum(1 for line in out if line.startswith('### ')), 'list items', items)
