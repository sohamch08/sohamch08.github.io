# Soham Chatterjee's website

Source for [sohamch08.github.io](https://sohamch08.github.io/), a personal academic
website with research, publications, coursework, talks, projects, and contact
details. Built with Hugo, a customized Chirpy design, and self-hosted fonts.

## Run locally

Install [Hugo](https://gohugo.io/installation/),
[standalone Dart Sass](https://sass-lang.com/install/#install-anywhere-standalone),
and Python 3. Make sure `hugo`, `sass`, and `python3` are on your `PATH`.
Use standalone Dart Sass; Node and Ruby Sass executables do not work with Hugo's
embedded compiler protocol. CI uses Hugo **0.169.0** and Dart Sass **1.93.3**.

From the repository root:

```sh
hugo server --disableFastRender
```

Open [localhost:1313](http://localhost:1313/). To build and run the repository's
checks:

```sh
bash tools/test.sh
```

The generated site is written to `public/`.

## Repository guide

| Path                 | Contents                                                    |
| -------------------- | ----------------------------------------------------------- |
| `content/`           | Markdown pages; `_index.md` is the homepage                 |
| `layouts/`           | Hugo templates, partials, and shortcodes                    |
| `assets/`            | Theme Sass, shared CSS, JavaScript sources, and public keys |
| `static/`            | PDFs, images, fonts, page-specific CSS, and browser scripts |
| `data/`              | Contact details and public-key metadata                     |
| `hugo.toml`          | Site settings and build configuration                       |
| `scripts/`, `tools/` | Content helpers and build checks                            |
| `.github/workflows/` | GitHub Pages build and deployment                           |

Edit page text in `content/`; front matter controls titles, URLs, navigation
order, and layouts. Keep presentation in `layouts/` and styles in `assets/` or
`static/assets/css/`.
See [content authoring](docs/CONTENT.md) for the Markdown heading structure.

Add a talk interactively:

```sh
./scripts/add-talk.sh
```

The helper updates `content/talks.md` and can add venues to existing talks.
Use `--year 2025` to choose a year. See
[public-key instructions](docs/PUBLIC_KEYS.md) to update contact keys.

## JavaScript and deployment

Browser bundles are committed, so Node.js is optional. After editing
`assets/js-source/`, rebuild and commit the generated bundles:

```sh
npm ci
npm run build:js
```

GitHub Actions builds, checks, and deploys site changes on `main` to GitHub Pages.
Set the repository's Pages source to **GitHub Actions**. The `jekyll` branch
preserves the previous site and does not deploy.
