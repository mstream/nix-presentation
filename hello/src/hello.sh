source "${LOCAL_LOAD_CONF_PATH}"
source "${REMOTE_LOAD_CONF_PATH}"

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
  nodeSayHello "${NAME}"
  purescriptSayHello "${NAME}"
  scalaSayHello "${NAME}"
done
