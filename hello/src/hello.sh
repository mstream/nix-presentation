source "${LOAD_CONF_PATH}"

NAMES=( "${NAME_1}" "${NAME_2}" "${NAME_3}" "${NAME_4}" "${NAME_5}" )

for NAME in "${NAMES[@]}"
do
  "${BASH_SAY_HELLO_PATH}" "${NAME}"
  "${NODE_SAY_HELLO_PATH}" "${NAME}"
  "${PURESCRIPT_SAY_HELLO_PATH}" "${NAME}"
done
