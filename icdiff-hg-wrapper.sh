#!/bin/bash

read -r -d '' help << 'EOM'
This is a icdiff wrapped for hg.

These doesn't seem to be a way to get hg diff to shell out, so you can install
this as a extdiff and call with `hg icdiff` or whatever with something like

    [extensions]
    hgext.extdiff =

    [extdiff]
    cmd.icdiff = $HOME/profile/icdiff-hg-wrapper.sh

The only two arguments given by hg are two filenames, usually one refers to
the working copy and one is a temporary file, but they both could be.
EOM

exec icdiff --line-numbers --recursive "$1" "$2"
