#!/usr/bin/env bash
# Build the DureClaw whitepapers: Markdown → HTML (pandoc) → PDF (Chrome headless).
# Two editions: Korean-centric (KO) and English-centric (EN).
# Chrome is used for pixel-perfect Korean rendering and box-drawing diagrams.
set -euo pipefail
cd "$(dirname "$0")/.."

CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
mkdir -p build

build_one() { # build_one <src.md> <out.pdf>
  src="$1"; pdf="$2"; html="build/$(basename "${src%.md}").html"
  echo "→ pandoc: $src → $html"
  pandoc "$src" -f markdown+raw_html -t html5 --template=src/template.html -o "$html"
  echo "→ chrome: $html → $pdf"
  "$CHROME" --headless=new --disable-gpu --no-pdf-header-footer \
    --virtual-time-budget=6000 \
    --print-to-pdf="$pdf" "file://$(pwd)/$html" 2>/dev/null
  echo "✓ $pdf ($(du -h "$pdf" | cut -f1))"
}

build_one src/whitepaper.ko.md DureClaw-Whitepaper-v1.0-KO.pdf
build_one src/whitepaper.en.md DureClaw-Whitepaper-v1.0-EN.pdf
