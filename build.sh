#!/usr/bin/env bash

set -eou pipefail

# Clear build directory
rm -rf ./build
mkdir -p ./build

# Compile the DLL
odin build .     -out=./build/dll.dylib -debug -build-mode:dll

# Compile the EXE
odin build ./exe -out=./build/exe       -debug

# This works: -use-single-module
# Compile the DLL
# odin build .     -out=./build/dll.dylib -debug -build-mode:dll -use-single-module
# Compile the EXE
# odin build ./exe -out=./build/exe       -debug                 -use-single-module

# Run the EXE
./build/exe
