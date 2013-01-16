#!/bin/sh
# You must have run 'build-thrift' first...
#

set -e

[ -d fb303-debian ] || \
  git clone https://github.com/pbreton/fb303-debian.git

[ -d thrift/contrib/fb303/debian ] || \
  mv fb303-debian/debian thrift/contrib/fb303/

dpkg -i libthrift0_*deb libthrift-dev_*.deb

cd thrift
cp -a lib/cpp/src/thrift/cxxfunctional.h /usr/include/thrift/
cd contrib/fb303
if [ ! -f fb303-build-deps_1.0_all.deb ]; then
  mk-build-deps
  gdebi -n fb303-build-deps*.deb
  fi
dpkg-buildpackage -b
