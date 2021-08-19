#!/bin/bash


if [ "$#" -ne 0 ] && [ "$1" != "-" ]; then
    if [ -f "$1" ]; then
        my_temp="$( mktemp )"
        echo -n "0" >> "$my_temp"
        while read -r op num; do
            echo -n " $op $num)" >> "$my_temp"
            echo -n "($( cat "$my_temp" )" > "$my_temp"
        done < "$1"
        echo "" >> "$my_temp"
        echo "= $( bc "$my_temp" )"
        rm -f "$my_temp"
    else
        exit 1
    fi
else
    my_temp="$( mktemp )"
    echo -n "0" >> "$my_temp"
    while read -r op num; do
      echo -n " $op $num)" >> "$my_temp"
      echo -n "($( cat "$my_temp" )" > "$my_temp"
    done
    echo "" >> "$my_temp"
    echo "= $( bc "$my_temp" )"
    rm -f "$my_temp"
fi
