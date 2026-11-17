#!/bin/sh
# Wraps index.html (a page fragment) in a full HTML document for hosting.
# Writes dist/index.html (used by Netlify) and docs/index.html (used by GitHub Pages).
set -e
mkdir -p dist
{
  printf '%s\n' '<!doctype html>' '<html lang="en">' '<head>' '<meta charset="utf-8">' \
    '<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">' \
    '<meta name="theme-color" content="#111111">' \
    '<style>:root{color-scheme:light;padding-top:env(safe-area-inset-top,0px);padding-bottom:env(safe-area-inset-bottom,0px)}body{margin:0;font:14px/1.5 system-ui,-apple-system,"Segoe UI",sans-serif}img{max-width:100%}[hidden]{display:none!important}</style>' \
    '</head>' '<body>'
  cat index.html
  printf '\n%s\n' '</body>' '</html>'
} > dist/index.html
mkdir -p docs
cp dist/index.html docs/index.html
