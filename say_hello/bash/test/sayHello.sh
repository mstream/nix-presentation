# The shebang above is going to be replaced by Nix with a path to a 
# specific 'bash' package binary in the Nix store.

ACTUAL=$(./src/sayHello.sh "John")

function shouldContain() {
  local STRING="$1"
  local SUBSTRING="$2"
  if [[ "${STRING}" != *"${SUBSTRING}"* ]]
  then
    echo "\"${STRING}\" does not contain \"${SUBSTRING}\""
    exit 1 
  fi
}

shouldContain "${ACTUAL}" "(Bash)" 
shouldContain "${ACTUAL}" "Hello" 
shouldContain "${ACTUAL}" "John" 

