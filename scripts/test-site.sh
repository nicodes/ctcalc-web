#!/usr/bin/env bash
set -euo pipefail
test -s dist/index.html
if ! grep -q '<vercel-analytics' dist/index.html; then
  echo "::error::dist is missing Vercel Web Analytics"
  exit 1
fi
