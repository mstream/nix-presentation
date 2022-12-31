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
  bashSayHello "${NAME}"
  javaSayHello "${NAME}"
  nodeSayHello "${NAME}"
  purescriptSayHello "${NAME}"
  scalaSayHello "${NAME}"
done
