set -e

function normalizeGreeting() {
  GREETING="$1"
  echo -n "${GREETING}" | sed "s/[(][^)]*[)]/()/g" | sed -e 's/\x1b\[[0-9;]*m//g'
}

function shouldContain() {
  local STRING="$1"
  local SUBSTRING="$2"
  if [[ "${STRING}" != *"${SUBSTRING}"* ]]
  then
    echo "\"${STRING}\" does not contain \"${SUBSTRING}\""
    exit 1 
  fi
}

SAY_HELLO_LIBS=(
  bash
  java-sbt
  javascript-npm
  purescript-spago
  scala-sbt
)

for SAY_HELLO_LIB_1 in "${SAY_HELLO_LIBS[@]}"
do
  for SAY_HELLO_LIB_2 in "${SAY_HELLO_LIBS[@]}"
  do
    PERSON_NAME="John"
    CMD_1="say-hello-${SAY_HELLO_LIB_1}"
    CMD_2="say-hello-${SAY_HELLO_LIB_2}"
    OUT_1=$(normalizeGreeting "$("${CMD_1}" "${PERSON_NAME}")")
    OUT_2=$(normalizeGreeting "$("${CMD_2}" "${PERSON_NAME}")")
    shouldContain "${OUT_1}" "${PERSON_NAME}"
    shouldContain "${OUT_2}" "${PERSON_NAME}"
    if [[ "${OUT_1}" != "${OUT_2}" ]]
    then
      echo "${SAY_HELLO_LIB_1} library output \"${OUT_1}\" differs from ${SAY_HELLO_LIB_2} library output \"${OUT_2}\""
      exit 1 
    fi
  done
done

