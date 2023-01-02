#! /usr/bin/env nix-shell
#! nix-shell ./shell.nix -i bash

# A script which checks for common repository errors

set -e

REPO_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd "${REPO_DIR}"

statix check
markdown-link-check ./README.md
