#!/usr/bin/env bash
# Keep the public entry point; the editor understands the Markdown/shortcode format.
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
exec python3 "$SCRIPT_DIR/../tools/add-talk.py" "$@"
