#!/bin/sh
#
# make_qpkg.sh - build script for QNAP

set -e

# copy the code into the shared directory
mkdir -p qnap/shared
tar cvf - --exclude=qnap --exclude-vcs * | ( cd qnap/shared; tar xf - )

# create the package
qbuild
