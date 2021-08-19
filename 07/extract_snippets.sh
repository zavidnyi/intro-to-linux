#!/bin/bash
exitcode=0


while [ "$#" -gt 0 ]
do
        n=1
        snippets="$( mktemp )"
        dirname=""
        if [ "$1" = "-" ]; then
                dirname="./stdin"
                mytmp="$( mktemp )"
                while read -r line; do
                        echo "$line" >> "$mytmp"
                done
                sed -n "/^\`\`\`/,/^\`\`\`/ p" "$mytmp" > "$snippets"
                rm -f "$mytmp"
        else
                if ! [ -f "$1" ] ; then
                        exitcode=1
                        shift
                        continue
                fi
                dirname="$( dirname "$( realpath "$1" )")/$( basename "$1" .md )"
                sed -n "/^\`\`\`/,/^\`\`\`/ p" "$1" > "$snippets"
        fi

        mkdir -p "$dirname"

        first=true
        cursb=""
        curfilename="";

        while read -r line; do

                border="${line:0:3}"
                if [ "$border" = "\`\`\`" ]; then
                        if [ "$first" = true ]; then
                                extension=""
                                first=false
                                lang="${line:3}"
                                case "$lang" in
                                        shell|sh|bash)
                                                cursb="#!/bin/bash"
                                                extension=".sh"
                                                ;;
                                        python|python3)
                                                cursb="#!/usr/bin/env python3"
                                                extension=".py"
                                                ;;
                                        *)
                                                cursb=""
                                                ;;
                                esac
                                curfilename="$dirname/$( printf "%02d" "$n" )$extension"
                        else
                                first=true
                                ((n++))
                                cursb=""
                        fi
                        continue
                fi

                if [ "$cursb" != "" ] && [ "$border" != "#!/" ]; then
                        echo "$cursb" >> "$curfilename"
                fi
                cursb=""
                echo "$line" >> "$curfilename"
        done <  "$snippets"

        rm -f "$snippets"
        shift
done

exit "$exitcode"
