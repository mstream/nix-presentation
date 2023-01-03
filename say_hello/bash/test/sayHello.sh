# The shebang above is going to be replaced by Nix with a path to a 
# specific 'bash' package binary in the Nix store.

ACTUAL=$(./src/sayHello.sh "John")
EXPECTED="(Bash) Hello John!"

if [ "${ACTUAL}" == "${EXPECTED}" ]
then 
  exit 0
else
  echo "'${ACTUAL}' != '${EXPECTED}'"
  exit 1
fi
