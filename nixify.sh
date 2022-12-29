#! /usr/bin/env nix-shell
#! nix-shell ./shell.nix -i bash

set -e

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd "${SCRIPT_DIR}"
for TARGET_DIR in node_lib purescript_lib
do
  "${TARGET_DIR}"/nixify.sh
done
