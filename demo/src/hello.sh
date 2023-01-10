#!/usr/bin/env bash

set -e

CONF_PATHS=(
  "${LOCAL_BASH_LOAD_CONF_PATH}"
  "${LOCAL_DHALL_LOAD_CONF_PATH}"
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
  "${NAME_7}" 
)

SAY_HELLO_LIBS=(
  bash
  java-sbt
  javascript-npm
  purescript-spago
  scala-sbt
)

for NAME in "${NAMES[@]}"
do
  for SAY_HELLO_LIB in "${SAY_HELLO_LIBS[@]}"
  do
    "say-hello-${SAY_HELLO_LIB}" "${NAME}"
  done
done
