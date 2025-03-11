@echo off

if defined MSYSTEM (
    echo This script file is for Windows CMD.EXE shell only.
    goto :eof
)

:: Download the tools from the server
call curl -LO https://github.com/smart-village-knezica/esp-tools/releases/download/v1.0.0/windows-tools-v1.0.0.zip
:: Extract to the current location
call tar -xf windows-tools-v1.0.0.zip
:: Remove the ZIP archive
if exist windows-tools-v1.0.0.zip (
    del windows-tools-v1.0.0.zip
)

