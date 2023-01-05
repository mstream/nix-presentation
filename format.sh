#! /usr/bin/env nix-shell
#! nix-shell ./shell.nix -i bash
# shellcheck shell=bash

# A script which formats nix files

set -e

REPO_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd "${REPO_DIR}"

prettier ./README.md
prettier .github/workflows/*.yml
nix fmt

