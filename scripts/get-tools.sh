#!/bin/bash

# Download the tools from the server
wget https://github.com/smart-village-knezica/esp-tools/releases/download/v0.2.2/linux-tools-v0.2.2.tar.gz
# Extract to the current location
tar -xf linux-tools-v0.2.2.tar.gz
# Remove the downloaded archive
if [ -f "linux-tools-v0.2.2.tar.gz" ]; then
    rm linux-tools-v0.2.2.tar.gz
fi

