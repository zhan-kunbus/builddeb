#!/bin/bash

set -x

export LD_PRELOAD=libeatmydata.so
export LD_LIBRARY_PATH=/usr/lib/libeatmydata
export DEBIAN_FRONTEND=noninteractive

WORK='/work'
apt-get update
apt-get -y upgrade

mkdir /tmp/deps
cd /tmp/deps
mk-build-deps --install --tool='apt-get -o Debug::pkgProblemResolver=yes --no-install-recommends --yes' $WORK/$PACKAGE/debian/control
cd $WORK/$PACKAGE
uid=$(stat -c '%u' .)
gid=$(stat -c '%g' .)
dpkg-buildpackage -us -uc
cd ..
chown $uid:$gid *.deb *.tar.* *.dsc *.asc *.buildinfo *.changes 2> /dev/null