#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
python3 tools/test-add-talk.py
hugo --minify --panicOnWarning
python3 tools/check-site.py public
