#! /usr/bin/env nix-shell
#! nix-shell -i bash -p bash nodejs

set -e

LIB_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd "${LIB_DIR}"
npm install --lockfile-version 2 --package-lock-only
npm exec -y node2nix@1.11.0 -- -16 --lock
