#!/bin/sh
# running 'build-fb303' first could bring some necessary dependencies...
#

set -e

PACKAGES=" \
  javahelper liblog4j1.2-java \
  "

[ -d log4j-scribe-appender ] || \
  git clone git://github.com/wmf-analytics/log4j-scribe-appender.git

dpkg -i libthrift-java_*.deb thrift/contrib/libfb303-java_*.deb

apt-get install -y $PACKAGES

cd log4j-scribe-appender

dpkg-buildpackage -b

