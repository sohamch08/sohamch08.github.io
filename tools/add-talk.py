#!/usr/bin/env python3
"""Add talks and venues to the Markdown/shortcode source without rewriting other sections."""
import argparse
import datetime
import json
import os
from pathlib import Path
import re
import stat
import tempfile

YEAR = re.compile(r'^### ([1-9][0-9]{3}) \{\.year-header\}$', re.M)
ITEM = re.compile(r'^\{\{< talk title=(?P<parameter>"(?:\\.|[^"\\])*"|`[^`]*`) >\}\}\n(?P<body>.*?)^\{\{< /talk >\}\}', re.M | re.S)
ATTENDANCE = '{{< attendance >}}'


def quote(text):
    # Raw shortcode strings preserve quotes and LaTeX together.
    if ('"' in text or '\\' in text) and '`' not in text:
        return '`' + text + '`'
    if '"' in text or '\\' in text:
        return '"' + text.replace('&', '&amp;').replace('"', '&quot;') + '"'
    return json.dumps(text, ensure_ascii=False)


def title_of(item):
    parameter = item['parameter']
    return parameter[1:-1].replace('\\"', '"') if parameter.startswith('"') else parameter[1:-1]


def ask(prompt):
    return input(prompt).strip()


def venue(body):
    return '{{< venue >}}\n' + body.strip() + '\n{{< /venue >}}'


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--year', default=str(datetime.date.today().year), metavar='YYYY')
    args = parser.parse_args()
    if not re.fullmatch(r'[1-9][0-9]{3}', args.year):
        parser.error('--year requires a four-digit year')
    year = int(args.year)
    path = Path(os.environ.get('TALKS_FILE', Path(__file__).resolve().parents[1] / 'content/talks.md'))
    source = path.read_text()
    start = source.index('## Talks {#talks-presentations')
    end = source.index(ATTENDANCE, start)
    sections = list(YEAR.finditer(source, start, end))
    section = next((m for m in sections if int(m[1]) == year), None)
    section_end = next((m.start() for m in sections if section and m.start() > section.start()), end)
    items = list(ITEM.finditer(source, section.end(), section_end)) if section else []
    print(f'Using year: {year}')
    selected = None
    if items:
        print(f'Talks already recorded for {year}:')
        for number, item in enumerate(items, 1):
            print(f'  {number}) {title_of(item)}')
        choice = ask('Use an existing talk title? Enter its number, or leave blank for a new talk: ')
        if choice:
            if not choice.isdecimal() or len(choice) > 9 or not 1 <= int(choice) <= len(items):
                raise ValueError('invalid selection')
            selected = items[int(choice) - 1]
    title = title_of(selected) if selected else ask('Talk title: ')
    if not title:
        raise ValueError('title is required')
    occasion = ask('Occasion (e.g. STOC 2026): ')
    location = ask('Location (e.g. Salt Lake City): ')
    if not occasion or not location:
        raise ValueError('occasion and location are required')
    links = []
    for label in ['Slides', 'Poster']:
        url = ask(f'{label} link (leave blank to skip): ')
        if url:
            links.append(f'[{label}]({url})')
    url = ask('Additional link (leave blank to skip): ')
    if url:
        label = ask('Label for the additional link [Link]: ') or 'Link'
        links.append(f'[{label}]({url})')
    body = f'{occasion}, {location}'
    if links:
        body += '\n\n' + ' '.join(links)
    if selected:
        old_body = selected['body'].strip()
        if not old_body.startswith('{{< venue >}}'):
            old_body = venue(old_body)
        replacement = "{{< talk title=" + selected["parameter"] + " >}}\n" + venue(body) + "\n\n" + old_body + "\n{{< /talk >}}"
        updated = source[:selected.start()] + replacement + source[selected.end():]
    else:
        item = '{{< talk title=' + quote(title) + ' >}}\n' + body + '\n{{< /talk >}}\n\n'
        if section:
            insert = items[0].start() if items else section_end
        else:
            insert = next((m.start() for m in sections if int(m[1]) < year), end)
            item = f'### {year} {{.year-header}}\n\n' + item
        updated = source[:insert] + item + source[insert:]
    # All input is collected before an atomic, mode-preserving replacement.
    with tempfile.TemporaryDirectory(prefix=path.name + '.', dir=path.parent) as directory:
        temporary = Path(directory) / path.name
        temporary.write_text(updated)
        temporary.chmod(stat.S_IMODE(path.stat().st_mode))
        temporary.replace(path)
    print('Done. Review the change in content/talks.md.')


if __name__ == '__main__':
    try:
        main()
    except (EOFError, ValueError, OSError) as error:
        raise SystemExit(f'Error: {error or "input ended before the talk was complete"}')
