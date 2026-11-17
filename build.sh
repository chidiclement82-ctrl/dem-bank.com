#!/bin/sh
# Wraps index.html (a page fragment) in a full HTML document for hosting.
# Writes dist/index.html (used by Netlify) and docs/index.html (used by GitHub Pages).
set -e
mkdir -p dist
{
  printf '%s\n' '<!doctype html>' '<html lang="en">' '<head>' '<meta charset="utf-8">' \
    '<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">' \
    '<meta name="theme-color" content="#F4F3F0" media="(prefers-color-scheme: light)">' \
    '<meta name="theme-color" content="#0B0B0B" media="(prefers-color-scheme: dark)">' \
    '<meta name="apple-mobile-web-app-capable" content="yes">' '<meta name="mobile-web-app-capable" content="yes">' \
    '<meta name="apple-mobile-web-app-title" content="DEM Bank">' '<meta name="apple-mobile-web-app-status-bar-style" content="default">' \
    '<meta name="format-detection" content="telephone=no">' \
    "<link rel=\"apple-touch-icon\" href=\"data:image/png;base64,$(base64 -w0 icon.png)\">" \
    "<link rel=\"icon\" type=\"image/png\" href=\"data:image/png;base64,$(base64 -w0 icon.png)\">" \
    '<style>:root{color-scheme:light;padding-top:env(safe-area-inset-top,0px);padding-bottom:env(safe-area-inset-bottom,0px)}body{margin:0;font:14px/1.5 system-ui,-apple-system,"Segoe UI",sans-serif}img{max-width:100%}[hidden]{display:none!important}</style>' \
    '</head>' '<body>'
  cat index.html
  printf '\n%s\n' '</body>' '</html>'
} > dist/index.html
mkdir -p docs
cp dist/index.html docs/index.html
