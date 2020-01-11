@echo off

set start=%cd%
set dir="%~1"
if "%~1"=="" goto dirPrompt
goto checkPrompt
:dirPrompt
set /p "dir=Enter directory: "
:checkPrompt
if not exist %dir% (
        echo Invalid directory
        goto dirPrompt
)

cd %dir%

if not exist "flv" md "flv"
if not exist "processed" md "processed"
cd processed
if not exist "Full Service" md "Full Service"
if not exist "Full Service - MP3" md "Full Service - MP3"
if not exist "Preaching" md "Preaching"
if not exist "Specials" md "Specials"

cd %start%