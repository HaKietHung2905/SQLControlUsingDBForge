@echo off
REM --------------------------------------------------------------------------------------
REM -- Package DB scripts for deployment
REM --------------------------------------------------------------------------------------

if '%1'=='partial' goto SCHEMA_DATA
if '%1'=='all' goto ALL_SCRIPTS

:MENU
cls
echo.
echo       SELECT OPTION
echo.
echo       1. Schema and Data Only
echo       2. All Scripts (procedures, functions, triggers, schema and data)
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
echo Packaging schema and data for deployment...
7za a -r -tzip ".\Packages\schema_data.zip" ".\Schema and Data"
IF "%ERRORLEVEL%" == "0" (
    GOTO END
) ELSE (
    GOTO ERROR
)

:ALL_SCRIPTS
echo Packaging functions...
7za a -r -tzip ".\Packages\all_scripts.zip" ".\Functions"
echo Packaging jobs...
7za a -r -tzip ".\Packages\all_scripts.zip" ".\Jobs"
echo Packaging Schema and Data...
7za a -r -tzip ".\Packages\all_scripts.zip" ".\Schema and Data"
echo Packaging Stored Procedures...
7za a -r -tzip ".\Packages\all_scripts.zip" ".\Stored Procedures"
echo Packaging Triggers...
7za a -r -tzip ".\Packages\all_scripts.zip" ".\Triggers"
IF "%ERRORLEVEL%" == "0" (
    GOTO END
) ELSE (
    GOTO ERROR
)


:ERROR
echo An error occurred.
PAUSE

:END
echo Packaging finished. Please End or Push to Target DB.
PAUSE
