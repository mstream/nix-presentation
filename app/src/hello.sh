source "${LOAD_CONF_PATH}"

for NAME in "${NAME_1}" "${NAME_2}" "${NAME_3}" "${NAME_4}" "${NAME_5}"
do
  "${BASH_SAY_HELLO_PATH}" "${NAME}"
  "${NODE_SAY_HELLO_PATH}" "${NAME}"
done
