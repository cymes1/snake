#!/bin/bash

# creating a directory build if not exist
mkdir -p build
cd build || exit

# creating a directory for the lava engine build
mkdir -p lava
cd lava || exit

# running cmake for the lava engine
if ! cmake ../../lava-engine; then
  exit 1
fi

# running make for lava engine
if ! make; then
  exit 1
fi
mkdir -p ../build
mkdir -p ../build/lib
cp build/lib/liblava.so ../build/lib/liblava.so
cd ..

# copy program resources
if [ -d build/bin/res ]; then
  rm -r build/bin/res/
fi
cp -r ../res build/bin/

# running cmake for the program
if ! cmake ..; then
  exit 1
fi

# running make for the program
if ! make; then
  exit 1
fi

# running program
cd build/bin || exit
./snake

# returning to root directory
cd ..
