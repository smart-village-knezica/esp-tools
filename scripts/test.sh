#!/bin/bash

arg1=$1

SCRIPT_ROOT=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
PROJECT_ROOT="$SCRIPT_ROOT/.."

# Modify pyvenv.cfg to match new environment
(
    echo "home = $PROJECT_ROOT/linux/tools/idf-python/3.11.9/bin"
    echo "include-system-site-packages = false"
    echo "version = 3.11.9"
    echo "executable = $PROJECT_ROOT/linux/tools/idf-python/3.11.9/bin/python3.11"
    echo "command = $PROJECT_ROOT/linux/tools/idf-python/3.11.9/bin/python3 -m venv --clear $PROJECT_ROOT/linux/python_env/idf5.4_py3.11_env"
) > "$PROJECT_ROOT/linux/python_env/idf5.4_py3.11_env/pyvenv.cfg"

echo "Exporting enviornment variables..."
source scripts/export_variables.sh

echo "Printing tools location"
which ninja
which cmake
which python

IDF_PATH="$PROJECT_ROOT/esp-idf"
IDF_PYTHON="$PROJECT_ROOT/linux/python_env/idf5.4_py3.11_env/bin/python"
IDF_PY="$IDF_PATH/tools/idf.py"
ESPTOOL_PY="$IDF_PATH/components/esptool_py/esptool/esptool.py"

if [ "$arg1" = "version" ]; then
    echo "Getting ESP-IDF version..."
    source "$PROJECT_ROOT/esp-idf/export.sh"
    $IDF_PYTHON $IDF_PY --version
    exit
fi

if [ "$arg1" = "build" ]; then
    echo "Building example..."
    source "$PROJECT_ROOT/esp-idf/export.sh"
    cd "$PROJECT_ROOT/esp-idf/examples/get-started/blink"
    $IDF_PYTHON $IDF_PY build
    exit
fi
