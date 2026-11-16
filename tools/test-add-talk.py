#!/usr/bin/env python3
"""Exercise the interactive helper on temporary copies of the Hugo talks page."""

import os
import re
import stat
import subprocess
import tempfile
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SOURCE = (ROOT / "content/talks.md").read_text()
ATTENDANCE = "## Workshops & Conferences attended"
YEAR = re.compile(r"^### ([0-9]{4})$", re.M)
ITEM = re.compile(r"^#### [^\n]+\n.*?(?=^#{2,4} |\Z)", re.M | re.S)


def year_section(text, year):
    talks = text.split(ATTENDANCE, 1)[0]
    start = talks.index(f"### {year}")
    next_year = YEAR.search(talks, start + 1)
    return talks[start : next_year.start() if next_year else len(talks)]


def descriptions(text):
    body = text.split("\n", 1)[1].strip()
    if body.startswith("- "):
        venues = re.split(r"^- ", body, flags=re.M)[1:]
        return [" ".join(value.split("\\\n", 1)[0].strip().split()) for value in venues]
    return [" ".join(body.split("\n\n", 1)[0].split())]


def links(text):
    return re.findall(r"\]\(([^)]*)\)", text)


class AddTalkTests(unittest.TestCase):
    def setUp(self):
        self.directory = tempfile.TemporaryDirectory()
        self.addCleanup(self.directory.cleanup)
        self.path = Path(self.directory.name) / "talks.md"
        self.reset()
        self.years = [
            int(year) for year in YEAR.findall(SOURCE.split(ATTENDANCE, 1)[0])
        ]

    def reset(self, content=SOURCE):
        self.path.write_text(content)
        self.path.chmod(0o644)

    def run_helper(self, answers, *args):
        return subprocess.run(
            ["bash", str(ROOT / "scripts/add-talk.sh"), *args],
            input="\n".join(answers) + "\n",
            text=True,
            capture_output=True,
            env={**os.environ, "TALKS_FILE": str(self.path)},
            cwd=self.directory.name,
            timeout=10,
        )

    def assert_success(self, result, original=SOURCE):
        self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
        updated = self.path.read_text()
        self.assertEqual(
            updated.split(ATTENDANCE, 1)[1], original.split(ATTENDANCE, 1)[1]
        )
        self.assertEqual(
            updated.split("## Talks\n", 1)[0], original.split("## Talks\n", 1)[0]
        )
        self.assertNotIn("{{<", updated)
        self.assertEqual(stat.S_IMODE(self.path.stat().st_mode), 0o644)
        self.assertEqual(list(self.path.parent.iterdir()), [self.path])
        return updated

    def test_new_years_remain_sorted_before_attendance(self):
        # Remove one year to exercise insertion between existing sections too.
        middle = self.years[len(self.years) // 2]
        without_middle = SOURCE.replace(year_section(SOURCE, middle), "")
        cases = [
            (max(self.years) + 1, SOURCE),
            (min(self.years) - 1, SOURCE),
            (middle, without_middle),
        ]
        for year, original in cases:
            with self.subTest(year=year):
                self.reset(original)
                result = self.run_helper(
                    ["Test talk", "Test seminar", "Test city", "", "", ""],
                    "--year",
                    str(year),
                )
                updated = self.assert_success(result, original)
                expected = sorted(
                    [int(y) for y in YEAR.findall(original.split(ATTENDANCE, 1)[0])]
                    + [year],
                    reverse=True,
                )
                self.assertEqual(
                    [int(y) for y in YEAR.findall(updated.split(ATTENDANCE, 1)[0])],
                    expected,
                )
                self.assertIn("Test talk", year_section(updated, year))

    def test_new_talk_is_first_in_existing_year(self):
        for year in self.years:
            with self.subTest(year=year):
                self.reset()
                result = self.run_helper(
                    [
                        "",
                        "Test talk",
                        "Test seminar",
                        "Test city",
                        "/assets/slides.pdf",
                        "https://example.org/poster",
                        "https://example.org/talk",
                        "Recording",
                    ],
                    "--year",
                    str(year),
                )
                updated = self.assert_success(result)
                blocks = ITEM.findall(year_section(updated, year))
                self.assertIn("Test talk", blocks[0])
                self.assertIn("(/assets/slides.pdf)", blocks[0])
                self.assertIn("[Poster]", blocks[0])
                self.assertIn("[Recording]", blocks[0])
                self.assertEqual(blocks[1:], ITEM.findall(year_section(SOURCE, year)))
                self.assertNotIn("<div", blocks[0])

    def test_add_venue_to_every_existing_talk(self):
        # Covers both layouts, multiline descriptions, links, and linkless talks.
        for year in self.years:
            original_blocks = ITEM.findall(year_section(SOURCE, year))
            for index, old_block in enumerate(original_blocks):
                with self.subTest(year=year, choice=index + 1):
                    self.reset()
                    result = self.run_helper(
                        [
                            f"{index + 1:02}",
                            "New seminar",
                            "New city",
                            "",
                            "",
                            "https://example.org/new",
                            "",
                        ],
                        "--year",
                        str(year),
                    )
                    updated = self.assert_success(result)
                    blocks = ITEM.findall(year_section(updated, year))
                    self.assertEqual(len(blocks), len(original_blocks))
                    self.assertEqual(
                        descriptions(blocks[index]),
                        ["New seminar, New city"] + descriptions(old_block),
                    )
                    self.assertEqual(
                        links(blocks[index]),
                        ["https://example.org/new"] + links(old_block),
                    )
                    self.assertEqual(
                        updated.replace(blocks[index], old_block, 1), SOURCE
                    )

    def test_quoted_title_and_latex_are_preserved(self):
        title = 'The "BPL" puzzle: $\\mathsf{BPL}$'
        result = self.run_helper(
            ["", title, "Test seminar", "Test city", "", "", ""],
            "--year",
            str(self.years[0]),
        )
        updated = self.assert_success(result)
        block = ITEM.findall(year_section(updated, self.years[0]))[0]
        self.assertEqual(block.splitlines()[0], "#### " + title)
        result = self.run_helper(
            ["1", "Another seminar", "Another city", "", "", ""],
            "--year",
            str(self.years[0]),
        )
        second_update = self.assert_success(result, updated)
        block = ITEM.findall(year_section(second_update, self.years[0]))[0]
        self.assertEqual(block.splitlines()[0], "#### " + title)
        self.assertEqual(
            descriptions(block)[:2],
            ["Another seminar, Another city", "Test seminar, Test city"],
        )

    def test_invalid_input_never_changes_source(self):
        cases = [
            ([], ["--year"]),
            ([], ["--year", "20xx"]),
            ([], ["--unknown"]),
            (["99999999999999999999"], []),
            (["0"], []),
            (["", "Test talk"], []),
        ]
        # Ensure the selection cases have an existing year's menu.
        for answers, args in cases:
            with self.subTest(answers=answers, args=args):
                self.reset()
                result = self.run_helper(answers, "--year", str(self.years[0]), *args)
                self.assertNotEqual(result.returncode, 0)
                self.assertEqual(self.path.read_text(), SOURCE)
                self.assertEqual(list(self.path.parent.iterdir()), [self.path])

    def test_help(self):
        result = self.run_helper([], "--help")
        self.assertEqual(result.returncode, 0)
        self.assertIn("--year YYYY", result.stdout)
        self.assertEqual(self.path.read_text(), SOURCE)


if __name__ == "__main__":
    unittest.main()
