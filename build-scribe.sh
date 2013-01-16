#!/bin/sh
# you should run 'build-fb303' first...
#

set -e

[ -d scribe-debian ] || \
  git clone git://github.com/pbreton/scribe-debian.git

[ -d scribe ] || \
  git clone git://github.com/facebook/scribe.git scribe
[ -d scribe/debian ] || \
  mv scribe-debian/debian scribe/

cd scribe
if [ ! -f scribe-build-deps_1.0_all.deb ]; then
  mk-build-deps
  gdebi -n scribe-build-deps*.deb
  fi
dpkg-buildpackage -b
