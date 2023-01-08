set -e

LIB_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd "${LIB_DIR}"
rm -rf node_modules
npm install --lockfile-version 2 --package-lock-only
node2nix -- -16 --composition composition.nix --lock
