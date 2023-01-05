#! /usr/bin/env nix-shell
#! nix-shell ./shell.nix -i bash
# shellcheck shell=bash

# Check if working tree is clean

set -e

REPO_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd "${REPO_DIR}"

if [[ $(git diff HEAD --stat) != '' ]]
then
  echo 'Git working tree is dirty:'
  git diff HEAD
  exit 1
else
  echo 'Git working tree is clean.'
fi
