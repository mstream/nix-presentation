set -e

LIB_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd "${LIB_DIR}"
npm exec -y justinwoo/spago2nix -- generate
