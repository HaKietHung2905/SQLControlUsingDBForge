@echo off
REM --------------------------------------------------------------------------------------
REM -- Deploying DB packages 
REM --------------------------------------------------------------------------------------

if '%1'=='partial' goto SCHEMA_DATA
if '%1'=='all' goto ALL_SCRIPTS

:MENU
cls
echo.
echo       SELECT OPTION
echo.
echo       1. Deploy Schema and Data Only
echo       2. Deploy All Scripts
echo       3. Quit
echo.
set choice=
set /p choice=      Enter option 1, 2, or 3 .. 
echo.
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto SCHEMA_DATA
if '%choice%'=='2' goto ALL_SCRIPTS
if '%choice%'=='3' goto END

::
echo.
echo.
echo "%choice%" is not a valid option - try again
echo.
pause
goto MENU
::


:SCHEMA_DATA
set /p server=Enter the target server: 
set /p database=Enter the database name: 
set /p username=Enter the username: 
set /p password=Enter the password: 

echo Deploying schema and data...
Powershell.exe -ExecutionPolicy Bypass -Command "./03_DbforgeAutomation.ps1 '%server%' '%database%' '%username%' '%password%' './Schema And Data'"

IF "%ERRORLEVEL%" == "0" (
    GOTO END
) ELSE (
    GOTO ERROR
)

:ALL_SCRIPTS
set /p server=Enter the target server: 
set /p database=Enter the database name: 
set /p username=Enter the username: 
set /p password=Enter the password: 

echo Deploying functions...
Powershell.exe -ExecutionPolicy Bypass -Command "./03_DbforgeAutomation.ps1 '%server%' '%database%' '%username%' '%password%' './Functions'"

echo Deploying jobs...
Powershell.exe -ExecutionPolicy Bypass -Command "./03_DbforgeAutomation.ps1 '%server%' '%database%' '%username%' '%password%' './Jobs'"

echo Deploying Stored Procedures...
Powershell.exe -ExecutionPolicy Bypass -Command "./03_DbforgeAutomation.ps1 '%server%' '%database%' '%username%' '%password%' './Stored Procedures/Client'"
Powershell.exe -ExecutionPolicy Bypass -Command "./03_DbforgeAutomation.ps1 '%server%' '%database%' '%username%' '%password%' './Stored Procedures'"

echo Deploying Triggers...
Powershell.exe -ExecutionPolicy Bypass -Command "./03_DbforgeAutomation.ps1 '%server%' '%database%' '%username%' '%password%' './Triggers'"

echo Deploying Schema and Data...
Powershell.exe -ExecutionPolicy Bypass -Command "./03_DbforgeAutomation.ps1 '%server%' '%database%' '%username%' '%password%' './Schema And Data'"

IF "%ERRORLEVEL%" == "0" (
    GOTO END
) ELSE (
    GOTO ERROR
)


:ERROR
echo An error occurred.
PAUSE

:END
echo Deployment Finished.
PAUSE
