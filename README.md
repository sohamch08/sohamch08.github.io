# Soham Chatterjee's website

This branch rebuilds the existing site with Hugo. The original Chirpy styles,
fonts, sidebar, content, URLs, scripts, images, and PDFs are retained. The footer
keeps the original theme attribution for visual parity; page metadata identifies
Hugo as the generator.

## Preview and build

Install Hugo 0.169.0 and the standalone Dart Sass 1.93.3 binary. On macOS:

```sh
brew install hugo sass/sass/sass
hugo server --disableFastRender
```

Alternatively, install the pinned tools with `mise install`. The Node version of
Sass cannot replace standalone Dart Sass for Hugo's embedded compiler protocol.
Hugo compiles the Sass directly, following its
[official Sass workflow](https://gohugo.io/functions/css/sass/).

Open the URL printed by Hugo, usually `http://localhost:1313/`.
To build and check the production output:

```sh
bash tools/test.sh
```

The build is written to `public/`. Python 3 is needed for the link and output
checks. Ruby, Bundler, and Jekyll are not needed to preview or build the website.
Offline caching is enabled in production and disabled in development so edits
appear immediately.

## Edit the site

- `content/_index.md`: homepage.
- `content/*.md`: the six navigation pages. Front matter controls title, URL,
  icon, and navigation order (`weight`). Existing HTML is retained within the
  Markdown to preserve the design precisely.
- `layouts/`: Hugo page templates, shared partials, and public-key shortcodes.
- `assets/scss/`: the original theme Sass, compiled by Hugo.
- `static/assets/css/`: page-specific styles.
- `static/assets/`: PDFs, images, and prebuilt JavaScript.
- `data/public_keys.yml`: key text and metadata. Hugo generates the download
  files from this same data. See [public-key instructions](docs/PUBLIC_KEYS.md).
- `hugo.toml`: site identity, canonical URL, and build settings.

The `scripts/add-talk.sh` helper edits `content/talks.md`.

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
