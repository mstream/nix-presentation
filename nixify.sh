#!/usr/bin/env sh

# A script which turns non-nix libraries into nix derivations.
# These libraries use other build system for which a nix converter
# exist. Thus, for every modification of these build system 
# configurations, this script should be re-applied.

set -e
script_dir=$(CDPATH="" cd -- "$(dirname -- "$0")" && pwd)
cd "${script_dir}"

impure_modules="javascript_npm purescript_spago"

echo "${impure_modules}" | tr ' ' '\n' | while read -r impure_module
do 
  "say_hello/${impure_module}"/nixify.sh
done
