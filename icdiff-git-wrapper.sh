#!/bin/sh

# The `diff` program is called by git with 7 parameters:
#   path old-file old-hex old-mode new-file new-hex new-mode
# We don't care about any of them except the file names.
# We `cat` b/c `icdiff` is interactive by default, and the term can do that.
exec icdiff "$2" "$5" | cat
