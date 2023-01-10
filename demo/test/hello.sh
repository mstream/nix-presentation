#!/usr/bin/env sh

set -e

normalizeGreeting() {
  GREETING="$1"
  printf "%s" "${GREETING}" \
    | sed "s/[(][^)]*[)]/()/g" \
    | sed -e 's/\x1b\[[0-9;]*m//g'
}

shouldContain() {
  _str="$1"
  _substr="$2"
  if ! (echo "${_str}" | grep -q "${_substr}")
  then
    echo "\"${_str}\" does not contain \"${_substr}\""
    exit 1 
  fi
}

say_hello_libs="bash java-sbt javascript-npm purescript-spago scala-sbt"

echo "${say_hello_libs}" | tr ' ' '\n' | while read -r lib_1
do
  echo "${say_hello_libs}" | tr ' ' '\n' | while read -r lib_2
  do
    preson_name="John"
    cmd_1="say-hello-${lib_1}"
    cmd_2="say-hello-${lib_2}"
    out_1=$(normalizeGreeting "$("${cmd_1}" "${preson_name}")")
    out_2=$(normalizeGreeting "$("${cmd_2}" "${preson_name}")")
    shouldContain "${out_1}" "${preson_name}"
    shouldContain "${out_2}" "${preson_name}"
    if [ "${out_1}" != "${out_2}" ]
    then
      printf \
        "%s library output \"%s\" differs from %s library output \"%s\"\n" \
        "${lib_1}" \
        "${out_1}" \
        "${lib_2}" \
        "${out_2}"
      exit 1 
    fi
  done
done

