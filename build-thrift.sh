#!/bin/sh

set -e

PACKAGES=" \
  git dpkg-dev devscripts gdebi \
  "

apt-get install -y $PACKAGES

[ -d thrift ] || \
  git clone git://github.com/pbreton/thrift.git

cd thrift
if [ ! -f thrift-build-deps_1.0_all.deb ]; then
  mk-build-deps
  gdebi -n thrift-build-deps*.deb
  fi
[-f libthrift-dev_1.0.0-dev_amd64.deb ] || \
  dpkg-buildpackage -b
