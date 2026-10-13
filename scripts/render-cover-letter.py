"""Render the PMD letter and record its source and PDF hashes."""

import hashlib
import html
import json
import re
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
tex = (ROOT / 'Draft/ennola-squareclasses-submission.tex').read_text(encoding='utf-8')
title = re.search(r'\\title\[[^\]]*\]\{([^}]+)\}', tex).group(1)
letter = source.read_text(encoding='utf-8').strip()
assert title in letter, 'The letter must use the current manuscript title.'
pdfmetrics.registerFont(TTFont('LetterGeorgia', 'C:/Windows/Fonts/georgia.ttf'))
style = ParagraphStyle('Letter', fontName='LetterGeorgia', fontSize=10.5, leading=14.3, spaceAfter=9)
signature_style = ParagraphStyle('Signature', parent=style, spaceAfter=2)
flowables = []
signature = False
for block in letter.split('\n\n'):
    if block in ('Best regards,', 'Yours sincerely,'):
        signature = True
    flowables.append(Paragraph(html.escape(block).replace('\n', '<br/>'), signature_style if signature else style))
    if block in ('Best regards,', 'Yours sincerely,'):
        flowables.append(Spacer(1, 8))
doc = SimpleDocTemplate(str(output), pagesize=A4, rightMargin=56, leftMargin=56, topMargin=48, bottomMargin=48, title='Cover letter - Publicationes Mathematicae Debrecen', author='Junyu Lu')
doc.build(flowables)
reader = PdfReader(output)
assert len(reader.pages) == 1, 'The cover letter exceeds one page.'
text = ' '.join(reader.pages[0].extract_text().split())
assert title in text
assert all(item in text for item in ('jy.lu@outlook.com', '0009-0001-4973-3198', 'OpenAI Codex', 'valid license'))

def file_record(path):
    return {'path': path.relative_to(ROOT).as_posix(), 'sha256': hashlib.sha256(path.read_bytes()).hexdigest()}

record = {'reportlab': reportlab.Version, 'source': file_record(source), 'pdf': file_record(output), 'pages': 1, 'title_matches_manuscript': True}
record_path = ROOT / 'build/cover-letter-pmd-record.json'
record_path.parent.mkdir(exist_ok=True)
record_path.write_text(json.dumps(record, indent=2) + '\n', encoding='utf-8')
print(json.dumps(record, indent=2))
