#!/bin/bash


exitcode=0

while [ $# -gt 0 ]
do
        if  ! [ -f "$1" ]; then
                exitcode=1
                shift
                continue
        fi
        filetype="$( file --mime-type "$1" )"
        echo "--- $( echo "$filetype" | cut -d: -f1 ) ---"
        case "$filetype" in
                "$( echo "$filetype" | grep "text/.*" )" )
                        head -n30 "$1"
                        ;;
                "$( echo "$filetype" | grep "image/.*" )"|"$( echo "$filetype" | grep "video/.*" )" )
                        exiftool "$1" | head -n30
                        ;;
                "$( echo "$filetype" | grep "application/pdf" )" )
                        pdftotext "$1" - | head -n30
                        ;;
                *)
                        file "$1" | head -n30
                        ;;
        esac
        echo
        shift
done

exit "$exitcode"