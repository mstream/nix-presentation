#!/usr/bin/env sh

# A script which formats nix files

set -e
script_dir=$(CDPATH="" cd -- "$(dirname -- "$0")" && pwd)
cd "${script_dir}"

prettier --write README.md
prettier --write .github/workflows/*.yml
nix fmt

