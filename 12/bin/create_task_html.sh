#!/bin/bash

set -ueo pipefail
cd out
echo "---"
echo "title: Tasks"
echo "---"
echo
for file in task-*.odt; do
    printf "* [Task %s](%s)\n" "$( echo "$file" | cut '-d-' -f2 | cut '-d.' -f1 )" "$file"
done