# A script which formats nix files

set -e

REPO_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd "${REPO_DIR}"

prettier --write README.md
prettier --write .github/workflows/*.yml
nix fmt

