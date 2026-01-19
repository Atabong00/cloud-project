@echo off
setlocal

:: Possible PHP paths
set PHP_PATH_XAMPP=C:\xampp\php\php.exe
set PHP_PATH_WAMP=C:\wamp64\bin\php\php8.2.0\php.exe
set PHP_PATH_CUSTOM="C:\New folder\php\php.exe"
set PHP_CMD=php

:: Check Custom Found Path
if exist %PHP_PATH_CUSTOM% (
    set PHP_CMD=%PHP_PATH_CUSTOM%
    goto :Found
)

:: Check XAMPP
if exist "%PHP_PATH_XAMPP%" (
    set PHP_CMD="%PHP_PATH_XAMPP%"
    goto :Found
)

:: Check System PATH
where php >nul 2>nul
if %errorlevel% equ 0 (
    set PHP_CMD=php
    goto :Found
)

echo [ERROR] PHP not found.
echo Please ensure XAMPP is installed at C:\xampp
echo Or add PHP to your system PATH.
pause
exit /b

:Found
echo [INFO] Found PHP at: %PHP_CMD%
echo.
echo [INFO] Starting Local Development Server...
echo [INFO] URL: http://localhost:8000
echo.
echo NOTE: Keep this window open. 
echo       Press Ctrl+C to stop the server.
echo.

:: Launch Browser after a short delay
start "" "http://localhost:8000"

:: Start Server
%PHP_CMD% -S localhost:8000

endlocal
pause
