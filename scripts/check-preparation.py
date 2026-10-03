"""Check source preservation and editorial scope; this is not a proof checker."""

from __future__ import annotations

import difflib
import hashlib
import json
from pathlib import Path
import re


ROOT = Path(__file__).resolve().parents[1]
AUDIT = ROOT / 'build' / 'submission-preparation-2026-10-02'
ORIGINAL = AUDIT / 'original' / 'Draft' / 'ennola-squareclasses.tex'
CANDIDATE = ROOT / 'Draft' / 'ennola-squareclasses-submission.tex'
MAIN = ROOT / 'Draft' / 'ennola-squareclasses.tex'


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def norm_notation(text: str) -> str:
    """Remove only the explicitly requested norm-notation differences."""
    text = re.sub(r'\\Nm_\{K(?:_a)?/\\Q\}', r'\\Nm', text)
    for argument in (r'\gamma', r'\varepsilon', r'\alpha', r'\beta'):
        text = text.replace(r'\Nm(' + argument + ')', r'\Nm' + argument)
    text = text.replace(r'and $\Nm$ maps this group', 'and norm maps this group')
    text = text.replace(r'taking norms to $\Q$ gives', 'taking norms gives')
    return text


def word_count(text: str) -> int:
    return len(text.split())


def relation(text: str) -> str:
    return text.split(r'\subsection*{Relation to earlier work}', 1)[1].split(r'\section{', 1)[0]


before = ORIGINAL.read_text(encoding='utf-8')
after = CANDIDATE.read_text(encoding='utf-8')
inventory = json.loads((AUDIT / 'initial-inventory.json').read_text(encoding='utf-8-sig'))
for entry in inventory:
    backup = AUDIT / 'original' / entry['path']
    assert sha256(backup).upper() == entry['sha256'].upper(), entry['path']

pattern = re.compile(r'\\begin\{(theorem|lemma|proposition|corollary|conjecture|proof)\}(.*?)\\end\{\1\}', re.S)
old_blocks = pattern.findall(before)
new_blocks = pattern.findall(after)
assert len(old_blocks) == len(new_blocks)
changed_blocks = []
counts = {}
for index, (old, new) in enumerate(zip(old_blocks, new_blocks), 1):
    assert old[0] == new[0]
    counts[old[0]] = counts.get(old[0], 0) + 1
    assert norm_notation(old[1]) == norm_notation(new[1]), f'Unexpected mathematical block change: {index}, {old[0]}'
    if old[1] != new[1]:
        changed_blocks.append({'index': index, 'environment': old[0], 'reason': 'explicit field-norm notation'})

labels_before = re.findall(r'\\label\{([^}]+)\}', before)
labels_after = re.findall(r'\\label\{([^}]+)\}', after)
assert labels_before == labels_after
assert len(labels_after) == len(set(labels_after))

def citation_keys(text: str) -> set[str]:
    return {key.strip() for group in re.findall(r'\\cite(?:\[[^\]]*\])*\{([^}]+)\}', text) for key in group.split(',')}

bib = (ROOT / 'Draft' / 'ennola.bib').read_text(encoding='utf-8')
old_bib = (AUDIT / 'original' / 'Draft' / 'ennola.bib').read_text(encoding='utf-8')
without_comments = lambda s: '\n'.join(line for line in s.splitlines() if not line.startswith('%'))
assert without_comments(bib) == without_comments(old_bib)
assert citation_keys(before) - citation_keys(after) == {'BosmaCannonPlayoust1997'}
assert not citation_keys(after) - citation_keys(before)
bib_keys = set(re.findall(r'@\w+\{([^,]+),', bib))
assert citation_keys(after) <= bib_keys

assert len(re.findall(r'\bMagma\b', after)) == 0
for omitted in ('Matching lower and upper rank bounds', 'This fibre has rank three', 'Exact computations give rank five'):
    assert omitted not in after
assert not re.search(r'\\Nm(?!_)(?:\(|\\(?:gamma|alpha|beta|varepsilon))', after)
trace_tokens = re.findall(r'(?i)\btrace\b|\\Tr\b', after)
assert not trace_tokens
assert r'\Nm_{L/\Q}' in after
assert r'\Nm\mathfrak c=\#(\mathcal O_L/\mathfrak c)' in after

report = {
    'date': '2026-10-02',
    'scope': 'Source preservation, labels, citation keys, bibliography entries, explicit norm notation and editorial word counts. Not mathematical proof validation.',
    'original_sha256': sha256(ORIGINAL),
    'candidate_sha256': sha256(CANDIDATE),
    'main_sha256': sha256(MAIN),
    'main_equals_original': MAIN.read_bytes() == ORIGINAL.read_bytes(),
    'main_equals_candidate': MAIN.read_bytes() == CANDIDATE.read_bytes(),
    'original_files_preserved': len(inventory),
    'mathematical_blocks': counts,
    'blocks_differing_only_in_explicit_norm_notation': changed_blocks,
    'labels_preserved': len(labels_after),
    'citation_keys_preserved': len(citation_keys(after)),
    'citation_keys_removed': sorted(citation_keys(before) - citation_keys(after)),
    'software_dependent_examples_removed': ['four exact-rank rational specializations', 'eleven integer rank-five examples', 'rank-three assertion at a=8'],
    'bibliography_entries_preserved': len(bib_keys),
    'relation_whitespace_tokens_before': word_count(relation(before)),
    'relation_whitespace_tokens_after': word_count(relation(after)),
    'body_magma_mentions_before': len(re.findall(r'\bMagma\b', before)),
    'body_magma_mentions_after': len(re.findall(r'\bMagma\b', after)),
    'trace_operators_in_manuscript': len(trace_tokens),
    'result': 'PASS'
}
(AUDIT / 'source-preservation.json').write_text(json.dumps(report, indent=2) + '\n', encoding='utf-8')
diff = difflib.unified_diff(before.splitlines(keepends=True), after.splitlines(keepends=True), fromfile='original/ennola-squareclasses.tex', tofile='submission/ennola-squareclasses.tex')
(AUDIT / 'manuscript.diff').write_text(''.join(diff), encoding='utf-8')
print(json.dumps(report, indent=2))
