#!/bin/bash

proc_dir="${PROCFS_BASE:-/proc}"

cd "$proc_dir" || exit 1

tmp="$( mktemp )"
on_exit() {
        rm -f "$tmp"
        trap - EXIT
        exit 0
}
trap "on_exit" INT QUIT TERM EXIT


for pdir in *; do
        if [ -d "$pdir" ]; then
                (
                        cd "$pdir" || exit 1
                        wbytes="$( grep -s "wchar:" io | tr -d "wchar: " )" 
                        rbytes="$( grep -s "rchar:" io | tr -d "wchar: " )"
                        cmdl="$( tr -d "\000" 2>/dev/null < cmdline )"
                        if [ "$wbytes" = "" ]; then wbytes="-"; fi
                        if [ "$rbytes" = "" ]; then rbytes="-"; fi                        
                        if [ "$cmdl" = "" ]; then cmdl="-"; fi
                        echo "$pdir:$rbytes:$wbytes:$cmdl" >> "$tmp"
                )
        fi
done

sort -n "$tmp"