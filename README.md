# Soham Chatterjee's website

This branch rebuilds the existing site with Hugo. The site uses a shared dark theme with mint accents, sidebar navigation,
and simple sections inspired by the coursework page. Content, URLs, images,
and PDFs are retained. The site adapts the original Chirpy theme.

## Preview and build

Install [Hugo](https://gohugo.io/installation/) and
[standalone Dart Sass](https://sass-lang.com/install/#install-anywhere-standalone),
with both `hugo` and `sass` on `PATH`. Local builds are verified with Fedora's
Hugo 0.162.1; the Pages workflow uses Hugo 0.169.0. Both use Dart Sass 1.93.3.

On Fedora, install Hugo with `sudo dnf install hugo`. For Dart Sass, download
the standalone archive for your operating system and architecture from the
[official releases](https://github.com/sass/dart-sass/releases/tag/1.93.3),
extract it, and add the extracted `dart-sass` directory to `PATH`.
For example, if extracted to `~/.local/share/dart-sass`, add this to `~/.zshrc`
(or `~/.bashrc` for Bash), then open a new terminal:

```sh
export PATH="$HOME/.local/share/dart-sass:$PATH"
```

On macOS with Homebrew:

```sh
brew install hugo sass/sass/sass
```

The Node version of Sass cannot replace standalone Dart Sass for Hugo's
embedded compiler protocol.
Hugo compiles the Sass directly, following its
[official Sass workflow](https://gohugo.io/functions/css/sass/).

Verify the installed tools and start the preview:

```sh
hugo version
sass --version
hugo server --disableFastRender
```

Open the URL printed by Hugo, usually `http://localhost:1313/`.
To build and check the production output:

```sh
bash tools/test.sh
```

The build is written to `public/`. Python 3 is needed for the link and output
checks. Ruby, Bundler, and Jekyll are not needed to preview or build the website.
Offline caching is enabled in production and disabled in development so edits
appear immediately.

### Sass errors

If Hugo reports `TOCSS-DART` with `unexpected EOF when executing "sass"`, check
which executable it finds:

```sh
command -v sass
sass --version
```

The permission hint in this error is generic. A leftover RubyGems launcher
such as `~/.gems/bin/sass` can exit with `Gem::GemNotFoundException` before
Hugo connects to the compiler, causing the same error. Ensure the standalone
Dart Sass directory comes before Ruby or Node Sass executables on `PATH`.

## Edit the site

- `content/_index.md`: homepage.
- `content/*.md`: the six navigation pages. Front matter controls title, URL,
  navigation order (`weight`), and page-specific styles (`styles`). Text, links,
  and lists use Markdown; reusable shortcodes preserve the custom layouts.
- `layouts/`: Hugo page templates, shared partials, and public-key shortcodes.
- `assets/scss/`: the original theme Sass, compiled by Hugo.
- `assets/css/fonts.css` and `static/assets/fonts/`: self-hosted Montserrat fonts.
- `assets/css/site.css`: shared colors, typography, navigation, and layout.
- `assets/css/home.css`: homepage sections and lookup-list spacing.
- `assets/css/contact.css`: contact details and public-key layout.
- `assets/css/talks.css`: talks and event layouts.
- `static/assets/css/`: other page-specific layouts using the shared theme variables.
- `static/assets/`: PDFs, images, and prebuilt JavaScript.
- `assets/gpg_key.asc` and `assets/id_ed25519.pub`: public key files used for
  copying, viewing, and downloading. `data/public_keys.yml` stores their paths
  and display metadata. See [public-key instructions](docs/PUBLIC_KEYS.md).
- `hugo.toml`: site identity, canonical URL, and build settings.

Add a talk interactively with:

```sh
./scripts/add-talk.sh
./scripts/add-talk.sh --year 2025
```

The helper edits `content/talks.md` and defaults to the current year. Select an
existing title to add another venue, or leave the selection blank to add a new
talk. New talks and venues appear first within their year or title; year sections
stay in descending order, before the workshops and conferences section. Links
are optional and can be external URLs or site paths such as `/assets/slides.pdf`.
Set `TALKS_FILE` to try the helper on a copy of the page.

### Writing content

Keep HTML in the Hugo templates under `layouts/`, and write page content in
Markdown. Shortcodes handle the layout and interactive controls:

- Home: `updates` / `update` and `lookup-keys`.
- Contact: `email` and `public-keys`.
- Publications: `publication`; its body is the abstract in Markdown.
- Coursework: `course-columns` / `course-column` / `semester`; semester bodies
  are Markdown lists. A backslash at the end of a course line puts its subtitle
  on the next line.
- Talks: `talk`, with a venue paragraph followed by optional Markdown links.
  Use nested `venue` blocks for a talk given at several venues. The `attendance`
  block contains year headings and Markdown event lists.
- Miscellaneous: `internship`, with a description paragraph and a second
  paragraph for the project details.

For example:

```markdown
{{< talk title="Introduction to High Dimensional Expanders" >}}
TIFR, Student Seminar

[Link](https://www.tcs.tifr.res.in/~student_seminar/talks/2026-10-16/)
{{< /talk >}}
```

The talk helper (`scripts/add-talk.sh`, backed by `tools/add-talk.py`) writes
this format and keeps the newest talk or venue first. Python 3 is required.
It uses backtick-quoted parameters for titles containing quotation marks or LaTeX.
The homepage's `new_tab_links` front-matter list preserves the links that open
in a new tab. Course columns can set `newtab="true"` for their note links.

## Rebuild theme JavaScript

The browser bundles are checked in, so Node is optional for ordinary site work.
Only after editing `assets/js-source/`, run:

```sh
npm ci
npm run build:js
```

Commit the changed bundles alongside their sources. The theme's original MIT
license notices are retained. The bundled Bootstrap stylesheet is retained in
`assets/scss/vendors/_bootstrap.scss` to keep the CSS identical to the original.

## GitHub Pages

The Pages workflow builds `main` with Hugo and Dart Sass, checks the generated
files, and uploads `public/`. GitHub Pages uses **GitHub Actions** as its source.
Only `main` can deploy, including manually triggered workflow runs.

The `jekyll` branch preserves the complete Jekyll setup from before the Hugo
migration. Switch to it with `git switch jekyll` to work with the old site, and
return with `git switch main`. Changes on `jekyll` do not deploy to the live
site. Keep edits to the two versions on their respective branches.
