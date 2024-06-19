#!/bin/sh

if [ $# -ne 1 ]; then
    echo "Usage: ./ab_server.sh {path to file of tags}"
    exit 1
fi

tag_format='--tag='
input_tags=""
command="./ab_server --debug --plc=ControlLogix --path=1,0"

while IFS= read -r line || [ -n "$line" ]; do
    line_mod=$(echo "$line" | tr -d '\r')
    if ! echo "$line_mod" | grep -Eq '^[a-zA-Z0-9_]+:[A-Z]+\[[0-9]+\]$'; then
        echo "Wrong TAG: $line"
        echo "Exit Program"
        exit 1
    else
        echo "TAG: $line"
    fi
    one_tag=$(echo "$tag_format$line_mod")
    input_tags="$input_tags $one_tag"
done < "$1"

echo "Run Command: $command $input_tags"

# Using `eval` to run the command with the tags
eval "$command $input_tags"