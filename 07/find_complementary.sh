#!/bin/bash

copy="$( mktemp )"
orgpat="$( mktemp )"
patcomp="$( mktemp )"

tail -n +2 "/srv/nswi177/arabidopsis.fasta" | tr -d "\n" > "$copy" || exit 7

grep -o "$1" "$copy" | sort -u > "$orgpat"

while read -r pat
do
        comp=""
        for i in $( seq 1 ${#pat} )
        do
                char="${pat:i-1:1}"
                case "$char" in
                        A)      
                                comp+="T"
                                ;;
                        T)
                                comp+="A"
                                ;;
                        C)
                                comp+="G"
                                ;;
                        G)
                                comp+="C"
                                ;;
                        '\n')
                                ;;
                        *)
                                comp+="$char"
                                ;;
                esac      
        done
        echo "$pat $comp" >> "$patcomp"
done < "$orgpat"
rm -f "$orgpat"

while read -r pat comp
do
        echo "$pat"
        line_n="$( mktemp )"
        grep -b -o "$comp" "$copy" | cut -d: -f1 > "$line_n"
        while read -r byte
        do
                echo "$(((byte / 70) + 2)):$comp"
        done < "$line_n"
        rm -f "$line_n"
done < "$patcomp"
rm -f "$copy"
rm -f "$patcomp"