"""Validate a staged PMD letter before replacing the PDF and its hash record."""

import hashlib
import html
import json
import re
import tempfile
from pathlib import Path

import reportlab
from pypdf import PdfReader
from reportlab.lib.pagesizes import A4
from reportlab.lib.styles import ParagraphStyle
from reportlab.pdfbase import pdfmetrics
from reportlab.pdfbase.ttfonts import TTFont
from reportlab.platypus import Paragraph, SimpleDocTemplate, Spacer

ROOT = Path(__file__).resolve().parents[1]
source = ROOT / 'Submission/cover-letter-pmd.md'
output = source.with_suffix('.pdf')
manuscript = ROOT / 'Draft/ennola-squareclasses-submission.tex'
explanation = ROOT / 'Computations/finite-verification.md'


def require(condition, message):
    if not condition:
        raise ValueError(message)


def file_record(path):
    return {'path': path.relative_to(ROOT).as_posix(), 'sha256': hashlib.sha256(path.read_bytes()).hexdigest()}


def plain_tex_field(tex, name):
    match = re.search(r'^\\' + name + r'(?:\[[^\]\n]*\])?\{(.+)\}\s*$', tex, re.MULTILINE)
    require(match is not None, f'Missing single-line manuscript {name}.')
    value = match.group(1).replace('$2^n$', '2^n').replace('$2^{n}$', '2^n')
    require(not re.search(r'[\\${}]', value), f'Unsupported TeX in manuscript {name}; update the renderer explicitly.')
    return value


def compact(value):
    # PDF extraction separates superscript glyphs and wrapped lines with spaces.
    return ''.join(value.split()).replace('2^n', '2n')


dependencies = {name: file_record(path) for name, path in (
    ('source', source), ('manuscript', manuscript), ('software_explanation', explanation)
)}
tex = manuscript.read_text(encoding='utf-8')
title = plain_tex_field(tex, 'title')
address = plain_tex_field(tex, 'address')
letter = source.read_text(encoding='utf-8').strip()
require(title in letter, 'The letter must use the current manuscript title.')
required_text = (address, 'jy.lu@outlook.com', '0009-0001-4973-3198', 'OpenAI Codex')
require(all(item in letter for item in required_text), 'The letter must contain the current address, contact details and AI disclosure.')
require('valid license' in explanation.read_text(encoding='utf-8'), 'The separate computation explanation must retain the supplied license confirmation.')
pdfmetrics.registerFont(TTFont('LetterGeorgia', 'C:/Windows/Fonts/georgia.ttf'))
style = ParagraphStyle('Letter', fontName='LetterGeorgia', fontSize=10.5, leading=14.3, spaceAfter=9)
signature_style = ParagraphStyle('Signature', parent=style, spaceAfter=2)
flowables = []
signature = False
for block in letter.split('\n\n'):
    if block in ('Best regards,', 'Yours sincerely,'):
        signature = True
    markup = html.escape(block).replace('2^n', '2<super>n</super>').replace('\n', '<br/>')
    flowables.append(Paragraph(markup, signature_style if signature else style))
    if block in ('Best regards,', 'Yours sincerely,'):
        flowables.append(Spacer(1, 8))
build = ROOT / 'build'
build.mkdir(exist_ok=True)
staging = Path(tempfile.mkdtemp(prefix='cover-letter-', dir=build)).resolve()
require(staging.is_relative_to(build.resolve()), 'The staging directory must remain inside build/.')
candidate = staging / output.name
doc = SimpleDocTemplate(str(candidate), pagesize=A4, rightMargin=56, leftMargin=56, topMargin=48, bottomMargin=48, title='Cover letter - Publicationes Mathematicae Debrecen', author='Junyu Lu')
doc.build(flowables)
reader = PdfReader(candidate)
require(len(reader.pages) == 1, 'The cover letter exceeds one page; the delivered PDF was preserved.')
text = compact(reader.pages[0].extract_text())
require(all(compact(item) in text for item in (title, *required_text)), 'The rendered letter is missing required text; the delivered PDF was preserved.')
for entry in dependencies.values():
    require(file_record(ROOT / entry['path']) == entry, 'A source changed during rendering; rerun before replacing the PDF.')
record = {
    'status': 'pass', 'reportlab': reportlab.Version, **dependencies,
    'pdf': {'path': output.relative_to(ROOT).as_posix(), 'sha256': file_record(candidate)['sha256']},
    'pages': 1, 'title': title, 'title_matches_manuscript': True,
    'address_matches_manuscript': True, 'license_confirmation_in_explanation': True,
}
candidate_record = staging / 'record.json'
candidate_record.write_text(json.dumps(record, indent=2) + '\n', encoding='utf-8')
require(output.resolve().is_relative_to(ROOT), 'The output must remain inside the project.')
candidate.replace(output)
candidate_record.replace(build / 'cover-letter-pmd-record.json')
print(json.dumps(record, indent=2))
