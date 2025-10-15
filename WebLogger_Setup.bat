@echo off
title Web Logger Setup
echo ====================================================
echo Web Logger Installer v1.0
echo ====================================================
echo .

REM === Main Logic ===
call :GetUserInput
call :UnZipFile "%zipPath%" "%destPath%"


:GetUserInput
    :: ------------------------------------------------------
    :: Retrieve user input for zip path and destination and validate both.
    :: ------------------------------------------------------
    echo [Step 1] Enter required paths
    echo .
    set /p zipPath="Enter full path to .zip file: "

    if not exist "zipPath%" (
        echo [ERROR] The file "%zipPath%" does not exist.
        pause
        exit /b 1
    )

    if not exist "%destPath"(
        echo [ERROR] The destination folder does not exist.
        pause exit /b 1
    )

    echo [OK] Using ZIP: %zipPath%
    echo [OK] Destination: %destPath%

:UnZipFile
    :: ------------------------------------------------------
    :: Unpacks the .zip using Powershell
    :: ------------------------------------------------------
    set "zipFile=%~1"
    set "extractTo=%~2"

    echo [Step 2] Extracting files...
    powershell -Command "Expand-Archive -Path '%zipFile%' -DestinationPath '%extractTo%' -Force" >nul 2>&1

    if %errorlevel neq 0 (
        echo [ERROR] Failed to extract %zipFile%.
        pause 
        exit /b 1
    )
    
    echo [SUCCESS] Files extracted to %extractTo%.
    exit /b 0






