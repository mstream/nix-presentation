#! /usr/bin/env nix-shell
#! nix-shell -i bash -p bash nodejs nodePackages.node2nix

set -e

LIB_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd "${LIB_DIR}"
npm install --lockfile-version 2 --package-lock-only
node2nix -- -16 --lock
