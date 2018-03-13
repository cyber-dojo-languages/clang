#!/bin/bash
set -e

readonly EXPECTED=$(grep Version README.md | cut -d'=' -f2 | cut -d']' -f1)
readonly ACTUAL=$(docker run --rm -it cyberdojofoundation/clang sh -c 'cc --version')

if echo "${ACTUAL}" | grep -q "${EXPECTED}"; then
  echo "VERSION CONFIRMED as ${EXPECTED}"
else
  echo "VERSION EXPECTED: ${EXPECTED}"
  echo "VERSION   ACTUAL: ${ACTUAL}"
  exit 1
fi
