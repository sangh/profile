#!/bin/bash
search="$1"
if [[ '$' != "${search: -1:1}" ]]; then
    search="$search"'.*'
fi
if [[ '^' != "${search:0:1}" ]]; then
    search='.*'"$search"
fi

shift
bfs . -follow -iregex "$search" "$@"
