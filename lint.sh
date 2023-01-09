#!/usr/bin/env sh

# A script which checks for common repository errors

set -e
script_dir=$(CDPATH="" cd -- "$(dirname -- "$0")" && pwd)
cd "${script_dir}"

markdown-link-check README.md
prettier --check README.md
prettier --check .github/workflows/*.yml
shellcheck ./*.sh
statix check

