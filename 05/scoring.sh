#!/bin/bash

set -ueo pipefail

msg() {
    echo "INFO: " "$@" >&2
}

usage() {
    echo "Usage: $2 [options]"
    echo "..."
    exit "$1"
}

getopt_options="-o vho: -l verbose,version,help,output:"
# shellcheck disable=SC2086 # we want option splitting
getopt -Q $getopt_options -- "$@" || usage 1 "$0"
# shellcheck disable=SC2086 # we want option splitting
eval set -- "$( getopt -q $getopt_options -- "$@" )"

logger=:
output_file=/dev/stdout

while [ $# -gt 0 ]; do
    case "$1" in
        -h|--help)
            usage 0 "$0"
            ;;
        -o|--output)
            output_file="$1"
            shift
            ;;
        -v|--verbose)
            logger=msg
            ;;
        --version)
            echo "scoring.sh 0.1"
            exit 0
            ;;
        --)
            shift
            break
            ;;
        *)
            echo "Unknown option $1" >&2
            exit 1
            ;;
    esac
    shift
done

my_temp="$( mktemp -d )"

$logger "Starting the script"

echo -n "" >"$output_file"
for inp in "$@"; do
    while read -r cmd args; do
        case "$cmd" in
            \#*)
                ;;
            add)
                echo "$args" | (
                    read -r team _ score
                    $logger "Read $team has $score..."
                    echo "$score" >>"$my_temp/$team.txt"
                )
                ;;
            summary)
                echo "$args" >>"$output_file"
                for team_file in "$my_temp/"*.txt; do
                    echo "  $( basename "$team_file" .txt ): $( paste -sd+ <"$team_file" | bc )" >>"$output_file"
                done
                ;;
            podium)
                pod="$(mktemp)"
                echo "Medal podium" >> "$output_file"
                for team_file in "$my_temp/"*.txt; do
                    echo "$( basename "$team_file" .txt ) $( paste -sd+ <"$team_file" | bc )" >>"$pod"
                done
                sort -k 2n  "$pod" | tac | cut -d ' ' -f1 | head -n 3 |  while read -r line; do echo "  $line" >> "$output_file"; done
                rm -f "$pod"
                ;;
            csv)
              echo "team,score" >> "$args"
              for team_file in "$my_temp/"*.txt; do
                  echo "$( basename "$team_file" .txt ),$( paste -sd+ <"$team_file" | bc )" >>"$args"
              done
                ;;
            *)
                ;;
        esac
    done <"$inp"
done


rm -rf "$my_temp"
