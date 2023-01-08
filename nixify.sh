# A script which turns non-nix libraries into nix derivations.
# These libraries use other build system for which a nix converter
# exist. Thus, for every modification of these build system 
# configurations, this script should be re-applied.

set -e

IMPURE_MODULES=(
  say_hello/javascript_npm
  say_hello/purescript_spago
)

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd "${SCRIPT_DIR}"
for TARGET_DIR in "${IMPURE_MODULES[@]}"
do
  "${TARGET_DIR}"/nixify.sh
done
