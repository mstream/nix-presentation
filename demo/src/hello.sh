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

for NAME in "${NAMES[@]}"
do
  bash-say-hello "${NAME}"
  java-sbt-say-hello "${NAME}"
  javascript-npm-say-hello "${NAME}"
  purescript-spago-say-hello "${NAME}"
  scala-sbt-say-hello "${NAME}"
done
