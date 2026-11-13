#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
hugo --minify --panicOnWarning
python3 tools/check-site.py public
