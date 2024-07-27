#!/bin/bash

CWD=$(realpath .)
PKG="$(basename $(dirname "$CWD"))/$(basename "$CWD")"
VER=$(ls -t *.ebuild | head -n1 | sed 's/.*-\([0-9][^-].*\)\.ebuild$/\1/')
MSG="Update $PKG -> $VER"
git commit -eam "$MSG"
