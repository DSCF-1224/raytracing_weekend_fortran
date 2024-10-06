#!/bin/sh -e
rm -rf build/
mkdir build
cd build
time cmake -DCMAKE_BUILD_TYPE=$1 ../src 
time make
time ./raytracing.exe
cd -

# EOF
