#!/bin/bash

# Get the path to the input folder (adjust as needed)
INPUT_FOLDER=$1

# Check if the input folder is provided
if [ -z "$INPUT_FOLDER" ]; then
  echo "Please provide the path to the input folder."
  exit 1
fi

# Resolve the absolute path to the input folder
SRC_DIR=$(realpath "$INPUT_FOLDER")

# Define the name of the build directory (customize if desired)
BUILD_DIR="build"

# Create the build directory if it doesn't exist
if [[ ! -d "$SRC_DIR/$BUILD_DIR" ]]; then
  mkdir -p "$SRC_DIR/$BUILD_DIR"
fi

# Navigate to the build directory
cd "$SRC_DIR/$BUILD_DIR"

# Check if CMake is installed (optional)
if ! command -v cmake &> /dev/null; then
  echo "CMake is not installed. Please install it first."
  exit 1
fi

# Use the generator based on available cores (configurable)
NUM_CORES=$(nproc)

# Generate CMake build files
cmake -B . -S "$SRC_DIR"

# Check if make is installed (optional)
if ! command -v make &> /dev/null; then
  echo "make is not installed. Please install it first."
  exit 1
fi

# Build the project using available cores
make -j $NUM_CORES

echo "Build completed successfully!"
