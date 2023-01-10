#!/usr/bin/env sh

withColor() {
  _color_code="$1"
  _text="$2"
  printf "\e[%sm%s\e[0m" "${_color_code}" "${_text}"
}

person_name="$1"

if [ -z "${person_name}" ]
then
  echo "The \"person name\" path parameter should be provided."
  exit 1
fi

withColor 37 "(Bash) "
withColor 34 "Hello "
withColor 31 "$1"
withColor 34 "!"
echo
