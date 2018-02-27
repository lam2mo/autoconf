#!/bin/bash

# make src folder
rm -rf src
mkdir -p src

# copy source file
cp test.c src/test.c

# set up Makefile.am
echo "bin_PROGRAMS=test"    >src/Makefile.am
echo "test_SOURCES=test.c"  >>src/Makefile.am

# set up configure.ac
echo "AC_INIT([test], [1.0], [lam2mo@jmu.edu])"     > src/configure.ac
echo "AM_INIT_AUTOMAKE([-Wall])"                    >> src/configure.ac
echo "AC_PROG_CC"                                   >> src/configure.ac
echo "AC_CONFIG_FILES([Makefile])"                  >> src/configure.ac
echo "AC_OUTPUT"                                    >> src/configure.ac

# files that are apparently necessary
touch src/NEWS
touch src/README
touch src/AUTHORS
touch src/INSTALL
touch src/COPYING
touch src/ChangeLog

# run autoconf
(cd src && autoreconf --install)

# delete unnecessary files
rm -r src/autom4te.cache
rm src/aclocal.m4

