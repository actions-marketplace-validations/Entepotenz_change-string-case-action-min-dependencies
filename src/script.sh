#!/usr/bin/env bash

set -o nounset
set -o errexit
set -o pipefail
if [ "${TRACE-0}" -eq 1 ]; then set -o xtrace; fi

readonly INPUT=$1

to_lowercase () {
  local input=$1

  echo "$input" | LC_ALL=en_US.UTF-8 tr '[:upper:]' '[:lower:]'
}

to_uppercase () {
  local input=$1

  echo "$input" | LC_ALL=en_US.UTF-8 tr '[:lower:]' '[:upper:]'
}

echo "lowercase=$(to_lowercase "$INPUT")" >> $GITHUB_OUTPUT
echo "uppercase=$(to_uppercase "$INPUT")" >> $GITHUB_OUTPUT
firstCharacter=$(to_uppercase "${INPUT::1}")
restOfString=$(to_lowercase "${INPUT:1}")
echo "capitalized=${firstCharacter}${restOfString}" >> $GITHUB_OUTPUT