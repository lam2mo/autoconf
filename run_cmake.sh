#!/bin/bash

# clean and recreate src folder
rm -rf src
mkdir -p src

# set up source file
cat << EOF > src/test.c
#include <stdio.h>
int main()
{
    printf("hi!\n");
    return 0;
}
EOF

# set up CMakeLists.txt
cat << EOF > src/CMakeLists.txt
cmake_minimum_required (VERSION 2.6)
project (test)
add_executable(test test.c)
install (TARGETS test DESTINATION bin)
EOF

