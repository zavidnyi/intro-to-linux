#!/bin/bash

set -ueo pipefail

msg() {
    echo "INFO: " "$@" >&2
}

usage() {
    echo "Usage: machine_state.sh [options] [machine-filter]"
    echo " -h --help            Print this help."
    echo " -i --input FILE      Read state from FILE."
    echo " -q --quiet --silent  No output, only exit code."
    exit "$1"
}

error() {
    echo "$1"
    exit "$2"
}

getopt_options="-o hqqi: -l help,quiet,silent,input:"
# shellcheck disable=SC2086
getopt -Q -q $getopt_options -- "$@" || error "" 101
# shellcheck disable=SC2086
eval set -- "$( getopt -q $getopt_options -- "$@" )"

logger=/dev/stdout
input=/srv/nswi177/machine.status

while [ $# -gt 0 ]; do
    case "$1" in
        -h|--help)
            usage 0
            ;;
        -i|--input)
            shift
            input="$1"
            if ! [ -e "$input" ]; then
                    error "" 102
            fi
            ;;
        -q|--quiet|--silent)
            logger=/dev/null
            ;;
        --)
            shift
            break
            ;;
        *)
            error "" 101
            ;;
    esac
    shift
done

input_dup="$( mktemp )"

if [ $# -gt 0 ]; then
    grep "$1" "$input" > "$input_dup" || error "" 2
else
    cat "$input" > "$input_dup"
fi

output="$( mktemp )"

finalexit=0


while read -r line; do
    machine_rec="$( mktemp )"
    machine_name="$( echo "$line" | cut -d: -f1 )"
    status=0
    grep "$machine_name" "$input_dup" > "$machine_rec" || continue
    while read -r st_line; do
        cur_status="$( echo "$st_line" | cut -d: -f3 )"
        if [ "$status" -eq 0 ]; then
            if [ "$cur_status" -eq 0 ]; then
                status=1
            else
                status=3
                finalexit=1
            fi
            continue
        fi

        if [ "$cur_status" -eq 0 ]; then
            if [ "$status" -eq 3 ]; then
                status=2
                break
            fi
        else
            finalexit=1
            if [ "$status" -eq 1 ]; then
                status=2
                break
            fi
        fi
    done < "$machine_rec"
    echo -n "$machine_name: " >> "$output"
    case "$status" in
        1)
            echo "UP" >> "$output"
            ;;
        2)
            echo "DEGRADED" >> "$output"
            ;;
        3)
            echo "DOWN" >> "$output"
            ;;
    esac
    tmp="$( mktemp)"
    cat "$input_dup" > "$tmp"
    grep -v "$machine_name" "$tmp" > "$input_dup" || break
    rm -f "$tmp"
    rm -f "$machine_rec"
done < "$input"

sort "$output" > "$logger"
rm -f "$input_dup"
rm -f "$output"
exit "$finalexit"