#!/bin/bash

set -ueo pipefail

# Uncomment if you need to debug the generated script
#SPLITTER="tee /dev/stderr"

SPLITTER=${SPLITTER:-cat}

exit_code=0

usage() {
    printf "csv_calc.sh EXPR - Simple CSV calculator\n\n"
    printf "Reads CSV from standard input, adds column corresponding to provided EXPR.\n\n"
    printf "EXPR can refer existing columns and is evaluated inside \$(( )).\n\n"
    printf "See project homepage for more details.\n"
    exit "$1"
}

error() {
    echo "Invalid invocation, run with --help for manual." >>/dev/stderr
    exit "$1"
}

getopt_options="-o h -l help"
# shellcheck disable=SC2086
getopt -Q -q $getopt_options -- "$@" || error 101
# shellcheck disable=SC2086
eval set -- "$( getopt -q $getopt_options -- "$@" )"

while [ $# -gt 0 ]; do
    case "$1" in
        -h|--help)
            usage 0
            ;;
        --)
            shift
            break
            ;;
        *)
            error 101
            ;;
    esac
    shift
done

get_column() {
    echo "$1" | tr ',' '\n' | sed -n "${2}p"
}

prepare_row_computation() {
    local index column value
    echo "set -ueo pipefail"
    index=0
    for column in $( echo "$1" | tr ',' ' ' ); do
        index=$(( index + 1 ))
        value="$( get_column "$2" "$index" )"
        echo "$column='$value'"
    done
    # shellcheck disable=SC2016
    echo 'echo $((' "$3" '))'
}

if [ $# -eq 0 ]; then
    error 2
fi

expression="$( printf "%q" "$1" | tr ',' '\n' )"

read -r headers

new_col_name="$( echo "$expression" | cut '-d=' -f 1 )"
new_col_expression="$( echo "$expression" | cut '-d=' -f 2 )"

echo "$headers,$new_col_name"
while read -r csv_line; do
    col_value="$( \
        prepare_row_computation "$headers" "$csv_line" "$new_col_expression" \
        | $SPLITTER \
        | bash 2>/dev/null \
        || echo '-'
    )"
    if [ "$col_value" = "-" ]; then
        echo "Computation failed at $csv_line." >&2
        exit_code=1
        continue
    fi
    echo "$csv_line,$col_value"
done

exit "$exit_code"
