#!/bin/sh

REQUIREMENTS='nvim git rg python3'
ALL_OK=true

for req in $REQUIREMENTS; do
  if [ "$(command -v "${req}")" ]; then
    echo "${req} OK!"
  else
    echo "${req} NG!"
  fi
done

if [ ${ALL_OK} ]; then
  exit 0
else
  exit 1
fi
