#!/bin/bash

set -x

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

export FLAVOUR="raspbian-stretch"

exec "$DIR/builddeb.sh" "$@"