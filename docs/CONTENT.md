# Writing page content

Write headings, paragraphs, links, and lists in Markdown. Hugo's page templates
turn their structure into the existing layouts. Keep HTML in `layouts/`.

## Home

Use a `#` heading for the introduction. The first `##` section shows the five
newest entries from the News page. The second `##` section contains the lookup list,
followed by `{{< lookup-keys >}}` for the generated key controls.

## News

Add a `[[params.entries]]` block in `content/news.md` for each announcement.
Set `date` to the announcement month in quotes (`"YYYY-MM"`) and `text` to a
sentence in Markdown. Set `type` to `talk`, `paper`, `award`, `teaching`, `ta`,
or `visit` to show the corresponding icon next to the date (for example, `Aug'26`).
Use `type = "ta"` for the classroom board icon on teaching assistant announcements.
Hugo sorts the entries by month for both the homepage
and the full archive at `/news/`.

In the `text` field, ordinary Markdown links appear in mint. Wrap a
conference name, fellowship, or other milestone in `**double asterisks**`
for soft gold. To link a conference name, use `[**STOC 2026**](https://acm-stoc.org/stoc2026/)`.
Dates and icons are gray automatically.

```toml
[[params.entries]]
date = "2026-06"
type = "talk"
text = "I presented our [paper on Reed-Solomon codes](/publications/) at **STOC 2026**."
```

## Contact

Keep `layout = "contact"` in front matter. Use `## Email`, followed by the email
paragraph. A backslash at the end of a line forces a line break. Keep
`{{< public-keys >}}` after the email section for the key controls.

## Coursework

Keep `layout = "courses"` in front matter. Use `##` for institutions and `###`
for semesters, followed by a Markdown course list:

```markdown
## TIFR

### Semester 3 — Aug–Dec 2025

- Advanced Coding Theory
- Pseudorandomness
```

Semester headings follow `Semester NUMBER — DATES YEAR`. A backslash at the end
of a course line puts its subtitle on the next line. Keep note links on the
course's first line. `new_tab_columns = ["CMI"]` in front matter makes that
institution's note links open in a new tab.

## Talks and events

Keep `layout = "talks"` in front matter. The first `##` section contains talks,
grouped by `###` year headings. Each `####` heading starts a talk:

```markdown
## Talks

### 2026

#### Introduction to High Dimensional Expanders

TIFR, Student Seminar

[Link](https://www.tcs.tifr.res.in/~student_seminar/talks/2026-10-16/)
```

For multiple venues, use a list instead of the venue paragraph. Separate each
venue from its links with a Markdown line break:

```markdown
#### Talk title

- First seminar, First city\
  [Slides](/assets/slides.pdf)
- Second seminar, Second city
```

The second `##` section contains the attendance introduction, `###` year
headings, and event lists. Each event is a linked name followed by a Markdown
line break and the venue.

The talk helper writes this format and keeps the newest talk or venue first.
Titles can contain quotation marks, Markdown formatting, and LaTeX.

## Miscellaneous

Keep `layout = "misc"` in front matter. Use `##` for sections and `###` for
internship dates. Each internship has a description paragraph and another
paragraph for the project details.

## Interactive features

Only three shortcode types remain: `publication` for publication metadata and
the abstract dialog, `public-keys` for contact-page key controls, and
`lookup-keys` for homepage key controls. Publication abstracts use Markdown.

The homepage's `new_tab_links` front-matter list preserves links that open in a
new tab. Other page headings and lists need no shortcode tags or classes.
