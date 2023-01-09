#!/usr/bin/env sh

set -e
script_dir=$(CDPATH="" cd -- "$(dirname -- "$0")" && pwd)
cd "${script_dir}"

rm -rf node_modules
npm install --lockfile-version 2 --package-lock-only
node2nix -- -16 --composition composition.nix --lock
