#!/usr/bin/env bash
# Build the DureClaw whitepaper PDF: Markdown → HTML (pandoc) → PDF (Chrome headless).
# Chrome is used for pixel-perfect Korean rendering and box-drawing diagrams.
set -euo pipefail
cd "$(dirname "$0")/.."

SRC="src/whitepaper.md"
HTML="build/whitepaper.html"
PDF="DureClaw-Whitepaper-v1.0.pdf"
CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"

mkdir -p build
echo "→ pandoc: $SRC → $HTML"
pandoc "$SRC" -f markdown+raw_html -t html5 --template=src/template.html -o "$HTML"

echo "→ chrome headless: $HTML → $PDF"
"$CHROME" --headless=new --disable-gpu --no-pdf-header-footer \
  --virtual-time-budget=6000 \
  --print-to-pdf="$PDF" "file://$(pwd)/$HTML" 2>/dev/null

echo "✓ $PDF ($(du -h "$PDF" | cut -f1))"
