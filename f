#!/bin/sh
search="$1"
shift
find . -follow -iregex \.\*"$search"\.\* "$@"
