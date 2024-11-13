#!/bin/bash

# Clean up generated files
find . -type f -name "*.o" -delete
find . -type f -name "*.gbc" -delete
find . -type f -name "*.map" -delete
find . -type f -name "*.sym" -delete
find . -type f -name "*.pic" -delete
find . -type f -name "*.1bpp" -delete
find . -type f -name "*.2bpp" -delete

# Check the script noshoes argument
if [ "$1" == "noshoes" ]; then
    echo "Running make with RUNSHOES=0"
    make RUNSHOES=0 RGBDS=../rgbds/
else
    echo "Running make with default settings (RUNSHOES enabled)"
    make RGBDS=../rgbds/
fi
