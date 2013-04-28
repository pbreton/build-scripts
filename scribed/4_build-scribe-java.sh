#!/bin/sh
# You should run 'build-scribe' first...
#
# debian/rules
# debian/control
# lib/java/build.xml
#

set -e

#[ -d scribe-wmf ] || \
#  git clone git://github.com/wmf-analytics/scribe.git scribe-wmf

[ -d scribe/lib/java ] || \
  cp -a scribe-wmf/lib/java scribe/lib/

[ -d scribe/if/fb303 ] || \
  cp -a thrift/contrib/fb303 scribe/if/

cd scribe
dpkg-buildpackage -b

