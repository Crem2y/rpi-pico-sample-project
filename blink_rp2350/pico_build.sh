#!/bin/bash

if [ $(id -u) -ne 0 ]; then exec sudo bash "$0" "$@"; exit; fi

echo "Building..."

mkdir build; cd build &&

cmake .. &&
make -j$(nproc) &&

echo "Building Complete!"
