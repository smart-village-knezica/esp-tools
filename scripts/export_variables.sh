#!/bin/bash

NINJA="$PROJECT_ROOT/linux/tools/ninja"
CMAKE="$PROJECT_ROOT/linux/tools/cmake/cmake-3.30.2-linux-x86_64/bin"
export IDF_TOOLS_PATH="$PROJECT_ROOT/linux"
export PATH=$NINJA:$CMAKE:$IDF_TOOLS_PATH:$PATH
IDF_PYTHON_DIR="$PROJECT_ROOT/linux/tools/idf-python/3.11.9/bin"
export PATH=$IDF_PYTHON_DIR:$PATH

