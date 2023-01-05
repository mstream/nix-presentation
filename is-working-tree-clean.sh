#! /usr/bin/env nix-shell
#! nix-shell ./shell.nix -i bash
# shellcheck shell=bash

# Check if working tree is clean

set -e

REPO_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd "${REPO_DIR}"

[[ $(git diff head --stat) == '' ]] \
  || (echo 'Git working tree is dirty.' && exit 1)

