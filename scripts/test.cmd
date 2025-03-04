@echo off

if defined MSYSTEM (
    echo This script file is for Windows CMD.EXE shell only.
    goto :eof
)

SETLOCAL EnableDelayedExpansion

set arg1=%~1

echo Print current directory
echo %~dp0

echo Creating a new virtual drive...
subst X: %~dp0

:: Modify pyvenv.cfg to match new environment
(
    echo home = X:\windows\tools\idf-python\3.11.2
    echo include-system-site-packages = false
    echo version = 3.11.2
    echo executable = X:\windows\tools\idf-python\3.11.2\python.exe
    echo command = X:\windows\tools\idf-python\3.11.2\python.exe -m venv X:\windows\python_env\idf5.4_py3.11_env
) > X:\windows\python_env\idf5.4_py3.11_env\pyvenv.cfg

set IDF_TOOLS_PATH=X:\windows
set PATH=%IDF_TOOLS_PATH%;%PATH%
set IDF_PATH=X:\esp-idf
set IDF_PYTHON=X:\windows\python_env\idf5.4_py3.11_env\Scripts\python.exe
set IDF_GIT=X:\windows\tools\idf-git\2.44.0\cmd\git.exe

set PREFIX=%IDF_PYTHON% %IDF_PATH%
DOSKEY idf.py=%PREFIX%\tools\idf.py $*
DOSKEY esptool.py=%PREFIX%\components\esptool_py\esptool\esptool.py $*
DOSKEY espefuse.py=%PREFIX%\components\esptool_py\esptool\espefuse.py $*
DOSKEY espsecure.py=%PREFIX%\components\esptool_py\esptool\espsecure.py $*
DOSKEY otatool.py=%PREFIX%\components\app_update\otatool.py $*
DOSKEY parttool.py=%PREFIX%\components\partition_table\parttool.py $*

:: Clear PYTHONPATH as it may contain libraries of other Python versions
if not "%PYTHONPATH%"=="" (
    echo Clearing PYTHONPATH, was set to %PYTHONPATH%
    set PYTHONPATH=
)

:: Clear PYTHONHOME as it may contain path to other Python versions which can cause crash of Python using virtualenv
if not "%PYTHONHOME%"=="" (
    echo Clearing PYTHONHOME, was set to %PYTHONHOME%
    set PYTHONHOME=
)

:: Set PYTHONNOUSERSITE to avoid loading of Python packages from AppData\Roaming profile
if "%PYTHONNOUSERSITE%"=="" (
    echo Setting PYTHONNOUSERSITE, was not set
    set PYTHONNOUSERSITE=True
)

set IDF_PYTHON_DIR=X:\windows\python_env\idf5.4_py3.11_env\Scripts
set IDF_GIT_DIR=X:\windows\tools\idf-git\2.44.0\cmd

:: Add Python and Git paths to PATH
set "PATH=%IDF_PYTHON_DIR%;%IDF_GIT_DIR%;%PATH%"
echo Using Python in %IDF_PYTHON_DIR%
%IDF_PYTHON% --version
where python
echo Using Git in %IDF_GIT_DIR%
%IDF_GIT% --version
where git

if not "%USERNAME%"=="%USERNAME: =%" (
    echo Username contains spaces, renaming it to esp...
    set USERNAME=esp
)

if "%arg1%" == "version" (
    echo Getting ESP-IDF version...
    call %IDF_PATH%\export.bat
    call idf.py --version
    goto :unmount_drive
)

if "%arg1%" == "build" (
    echo Building example...
    call %IDF_PATH%\export.bat
    cd /d X:\esp-idf\examples\get-started\blink
    call idf.py build
    goto :unmount_drive
)

:unmount_drive
subst X: /d
Endlocal
exit /b
