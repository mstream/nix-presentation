#!/usr/bin/env sh

# The shebang above is going to be replaced by Nix with a path to a 
# specific 'bash' package binary in the Nix store.

actual=$(./src/sayHello.sh "John")

shouldContain() {
  _str="$1"
  _substr="$2"
  if ! (echo "${_str}" | grep -q "${_substr}")
  then
    echo "\"${_str}\" does not contain \"${_substr}\""
    exit 1 
  fi
}

shouldContain "${actual}" "(Bash)" 
shouldContain "${actual}" "Hello" 
shouldContain "${actual}" "John" 

