#!/usr/bin/env sh

# Check if working tree is clean

set -e
script_dir=$(CDPATH="" cd -- "$(dirname -- "$0")" && pwd)
cd "${script_dir}"

diff_stat_out=$(git diff HEAD --stat)

if [ -n "${diff_stat_out}" ]
then
  echo 'Git working tree is dirty:'
  diff_out=$(git diff HEAD)
  echo 'vvvvvv'
  echo "${diff_out}"
  echo '^^^^^^'
  exit 1
else
  echo 'Git working tree is clean.'
fi
