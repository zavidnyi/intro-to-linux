#!/bin/bash

set -ueo pipefail

find [0-9][0-9]/ -type f | (
    exit_code=0
    while read -r fname; do
        if head -n 1 "$fname" | grep -q '^#!/bin/bash'; then
            shellcheck "$fname" || exit_code=1
        fi
    done
    exit $exit_code
)
