@echo off
rem Starts parasited_updater.py with whatever Python 3 is installed.
rem Installs into the folder above this one. Arguments are passed on, e.g. update_onWindows.bat --reconfigure
cd /d "%~dp0"
py -3 --version >nul 2>nul && (py -3 parasited_updater.py %* & goto end)
python --version >nul 2>nul && (python parasited_updater.py %* & goto end)
echo Python 3 was not found.
echo Install it from https://www.python.org/downloads/ and tick "Add python.exe to PATH" in the installer.
:end
pause
