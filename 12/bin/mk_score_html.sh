#!/bin/bash

set -ueo pipefail

sum_up () {
    sum=0
    for var in "$@"; do
        [ "$var" = '-' ] && continue
        (( sum+=var ))
    done
    echo "$sum"
}

echo "---"
echo "title: Score"
echo "---"
echo
echo '<table id="score-table">'
echo "  <thead>"
echo "      <tr>"
echo "          <th>Team</th>"
for task in $1; do
    printf "            <th>%s</th>\n" "$( sed -n "/^\-\-\-/,/^\-\-\-/ p"  "tasks/${task}.md" | grep "title:" | cut -d: -f2- )"
done
echo "          <th>Sum</th>"
echo "      </tr>"
echo "  </thead>"
echo "  <tbody>"

encountered=""

while read -r line ; do
    team_name="$( echo "$line" | cut '-d:' -f1)"
    if echo "$encountered" | grep "$team_name" >/dev/null; then continue;fi
    encountered+="$team_name"
    echo "      <tr>"
    printf "            <td>%s</td>\n" "$( grep "$team_name" "teams.csv" | cut -d" " -f3- )"
    team_entries="$( grep "$team_name" "score.csv")"
    sum=0
    for task in $1; do
        task_points="$( echo "$team_entries" | grep "$task" | cut -d: -f3 )" || task_points='-'
        sum="$( sum_up "$sum" "$task_points" )"
        printf "            <td>%s</td>\n" "$task_points"
    done
    printf "            <td>%s</td>\n" "$sum"
    echo "      </tr>"
done <"score.csv"

echo "  </tbody>"
echo "</table>"