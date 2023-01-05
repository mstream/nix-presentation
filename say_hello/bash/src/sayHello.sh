#!/usr/bin/env bash

# The shebang above is going to be replaced by Nix with a path to a 
# specific 'bash' package binary in the Nix store.

function withColor() {
  local COLOR_CODE="$1"
  local TEXT="$2"
  echo -e -n "\e[${COLOR_CODE}m${TEXT}\e[0m"
}

PERSON_NAME="$1"

if [ -z "${PERSON_NAME}" ]
then
  echo "The \"person name\" path parameter should be provided."
  exit 1
fi

withColor 37 "(Bash) "
withColor 34 "Hello "
withColor 31 "$1"
withColor 34 "!"
echo
