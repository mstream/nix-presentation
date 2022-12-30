#! /usr/bin/env nix-shell
#! nix-shell ./shell.nix -i bash

# A script which turns non-nix libraries into nix derivations.
# These libraries use other build system for which a nix converter
# exist. Thus, for every modification of these build system 
# configurations, this script should be re-applied.

set -e

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd "${SCRIPT_DIR}"
for TARGET_DIR in node_lib purescript_lib
do
  "${TARGET_DIR}"/nixify.sh
done
