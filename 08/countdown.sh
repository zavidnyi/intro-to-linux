#!/bin/bash

sec="$1"

abort() {
        echo "Aborted"
        exit 17
}

trap "abort" INT TERM

while [ "$sec" -gt 0 ]; do
        echo "$sec"
        ((sec--));
        sleep 1
done