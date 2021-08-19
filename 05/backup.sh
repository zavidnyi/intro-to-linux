#!/bin/bash


backup_dir="${BACKUP_DIR:-~/backup}"

for to_copy in "$@"
do
    filename="$(date +%F_%T | tr -t ':' '-')_$(realpath "$to_copy" | tr -t '/' '~')"
    if [ -d "$to_copy" ]
    then
        mkdir "$backup_dir/$filename"
        cp -R "$to_copy/*" "$backup_dir/$filename"
    else
        cp  "$to_copy" "$backup_dir/$filename"
    fi
    realpath "$backup_dir/$filename"
done
