#!/usr/bin/env sh

# A script which checks for common repository errors

set -e
script_dir=$(CDPATH="" cd -- "$(dirname -- "$0")" && pwd)
cd "${script_dir}"

shell_scripts=$(find . -name '*.sh')

markdown-link-check README.md
prettier --check README.md
prettier --check .github/workflows/*.yml
# shellcheck disable=SC2086
shellcheck -e SC1090 ${shell_scripts}
statix check

