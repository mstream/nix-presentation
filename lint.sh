#! /usr/bin/env nix-shell
#! nix-shell ./shell.nix -i bash
# shellcheck shell=bash

# A script which checks for common repository errors

set -e

REPO_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd "${REPO_DIR}"

markdown-link-check ./README.md
prettier --check ./README.md
prettier --check .github/workflows/*.yml
shellcheck ./*.sh
statix check

