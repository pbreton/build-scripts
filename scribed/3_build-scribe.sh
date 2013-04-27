#!/bin/sh
# you should run 'build-fb303' first...
#

set -e

PACKAGES=" \
  libboost-system-dev libboost-filesystem-dev \
  "

[ -d scribe-debian ] || \
  git clone https://github.com/pbreton/scribe-debian.git

[ -d scribe ] || \
  git clone git://github.com/facebook/scribe.git scribe
[ -d scribe/debian ] || \
  mv scribe-debian/debian scribe/

dpkg -i ./thrift/contrib/libfb303-dev_*.deb \
  ./thrift/contrib/python-fb303_0.9.0_all.deb \
  ./thrift/contrib/libfacebook-fb303-perl_0.9.0_all.deb

apt-get install -y $PACKAGES

cd scribe
if [ ! -f scribe-build-deps_1.0_all.deb ]; then
  mk-build-deps
  gdebi -n scribe-build-deps*.deb
  fi
dpkg-buildpackage -b

