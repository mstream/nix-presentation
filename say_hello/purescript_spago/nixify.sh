#!/usr/bin/env sh

set -e
script_dir=$(CDPATH="" cd -- "$(dirname -- "$0")" && pwd)
cd "${script_dir}"

npm exec -y justinwoo/spago2nix -- generate
