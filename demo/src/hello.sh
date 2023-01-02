CONF_PATHS=(
  "${LOCAL_LOAD_CONF_PATH}"
  "${REMOTE_LOAD_CONF_PATH}"
)

for CONF_PATH in "${CONF_PATHS[@]}"
do
  source "${CONF_PATH}"
done

NAMES=( 
  "${NAME_1}" 
  "${NAME_2}" 
  "${NAME_3}" 
  "${NAME_4}" 
  "${NAME_5}" 
  "${NAME_6}" 
)

SAY_HELLO_EXECUTABLES=(
  say-hello-bash
  say-hello-java-sbt
  say-hello-javascript-npm
  say-hello-purescript-spago
  say-hello-scala-sbt
)

for NAME in "${NAMES[@]}"
do
  for SAY_HELLO_EXECUTABLE in "${SAY_HELLO_EXECUTABLES[@]}"
  do
    "${SAY_HELLO_EXECUTABLE}" "${NAME}"
  done
done
