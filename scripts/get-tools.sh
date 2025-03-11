#!/bin/bash

# Download the tools from the server
wget https://github.com/smart-village-knezica/esp-tools/releases/download/v1.0.0/linux-tools-v1.0.0.tar.gz
# Extract to the current location
tar -xf linux-tools-v1.0.0.tar.gz
# Remove the downloaded archive
if [ -f "linux-tools-v1.0.0.tar.gz" ]; then
    rm linux-tools-v1.0.0.tar.gz
fi

