#!/bin/bash

if ! echo 0 | bc -q -l >&/dev/null; then
    if ! echo 0 | bc -l >&/dev/null; then
        echo "\"bc -q -l\" or \"bc -l\" not found, not using any switches."
		bc=bc
    else
        bc='bc -l'
    fi
else
    bc='bc -l -q'
fi


if [ -z "$*" ]; then
	$bc
else
    echo "$(echo "$@" | $bc | tr -d '\n')" "=" "$*"
fi
