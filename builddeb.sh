#!/bin/bash
set -x

WORK="$(realpath "$1/..")"
PACKAGE="$(basename $1)"

docker run --rm --cpu-shares 512 -v $WORK:/work -e PACKAGE=$PACKAGE builddeb