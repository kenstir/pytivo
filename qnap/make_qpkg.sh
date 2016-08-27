#!/bin/sh
#
# make_qpkg.sh - build script for QNAP

set -e

# copy the code and the config into the qpkg shared directory
rm -rf qnap/shared
mkdir -p qnap/shared
tar cf - --exclude=qnap --exclude-vcs * | ( cd qnap/shared; tar xf - )
cp -p qnap/pyTivo.conf qnap/shared
cp -p qnap/pyTivo.sh qnap/shared

# create the package
cd qnap
qbuild
latest=`ls -t build/*.qpkg | head -1`
echo Built $latest
cp $latest /share/Download
echo Copied to /share/Download
