@echo off

if defined MSYSTEM (
    echo This script file is for Windows CMD.EXE shell only.
    goto :eof
)

call curl https://github.com/smart-village-knezica/esp-tools/releases/download/v0.1.0-rc1/windows-tools-v0.1.0.zip
call tar windows-tools-v0.1.0.zip
