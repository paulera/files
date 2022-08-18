@if (@X)==(@Y) @end /* JScript comment

@echo off 

REM This script runs a command if it is not yet running. Otherwise, it brings
REM the current stance into focus.
REM Usage: run1 [/nostart] <command> <params>
REM       /nostart - doesn't use the command "start" to run, causing the prompt to hang
REM
REM Example: run1.bat c:\Windows\notepad.exe c:\User\paulo\Documents\todo.txt

REM Known bugs:
REM Doesn't work with Google Chrome.
REM Weird behaviour in some cases of paths with spaces or other special chars
REM Need to better figure out how to work with quotes

REM Sources:
REM 
REM Replace all backslashes in a string with double
REM https://alt.msdos.batch.narkive.com/LNB84uUc/replace-all-backslashes-in-a-string-with-double-backslash
REM
REM WMIC ProcessID Batch - StackOverflow
REM https://stackoverflow.com/questions/47789319/wmic-processid-batch
REM
REM Using command line/batch to switch to/focus on app - StackOverflow
REM https://stackoverflow.com/questions/35988863/using-command-line-batch-to-switch-to-focus-on-app
REM
REM reading batch file parameters with equal sign and semi-colon
REM https://stackoverflow.com/questions/16274823/reading-batch-file-parameters-with-equal-sign-and-semi-colon

setlocal

rem @echo on

set START=1
set "BINARY="
set "PARAMS="
set "processid=none"

if ["%~1"]==["/?"] (
    ECHO This script runs a command if it is not yet running. Otherwise, it brings
    ECHO the current stance into focus.
    ECHO.
    ECHO Usage: run1 [/nostart] ^<command^> [params]
    ECHO       /nostart - doesn't use the command START to run, causing the prompt to hang
    ECHO.
    ECHO Example:
    ECHO       Example: run1.bat c:\Windows\notepad.exe c:\User\paulo\Documents\todo.txt
    ECHO.
    GOTO END
) ELSE IF ["%~1"]==["/nostart"] (
    set START=0
    set BINARY=%~2
    IF NOT ["%~3"]==[""] set "PARAMS=%~3"
    IF NOT ["%~4"]==[""] set "PARAMS=%PARAMS% %~4"
    IF NOT ["%~5"]==[""] set "PARAMS=%PARAMS% %~5"
    IF NOT ["%~6"]==[""] set "PARAMS=%PARAMS% %~6"
    IF NOT ["%~7"]==[""] set "PARAMS=%PARAMS% %~7"
    IF NOT ["%~8"]==[""] set "PARAMS=%PARAMS% %~8"
    IF NOT ["%~9"]==[""] set "PARAMS=%PARAMS% %~9"
) ELSE (
    set BINARY=%~1
    IF NOT ["%~2"]==[""] set "PARAMS=%~2"
    IF NOT ["%~3"]==[""] set "PARAMS=%PARAMS% %~3"
    IF NOT ["%~4"]==[""] set "PARAMS=%PARAMS% %~4"
    IF NOT ["%~5"]==[""] set "PARAMS=%PARAMS% %~5"
    IF NOT ["%~6"]==[""] set "PARAMS=%PARAMS% %~6"
    IF NOT ["%~7"]==[""] set "PARAMS=%PARAMS% %~7"
    IF NOT ["%~8"]==[""] set "PARAMS=%PARAMS% %~8"
    IF NOT ["%~9"]==[""] set "PARAMS=%PARAMS% %~9"
)


rem set BINARY="%BINARY:\=\\%"
rem IF NOT ["%PARAMS%"]==[""] set PARAMS=%PARAMS:\=\\%
set BINARY_QUERY=%BINARY:\=\\%
IF NOT ["%PARAMS%"]==[""] set PARAMS_QUERY=%PARAMS:\=\\%

for /f "usebackq tokens=* delims=" %%a in (
    `wmic process where "CommandLine = '%BINARY_QUERY%  %PARAMS_QUERY%'" get ProcessID /Format:value`
) do (
    for /f "tokens=* delims=" %%z in ("%%a") do set "%%z"
)

IF "%processid%"=="none" (
    IF "%START%"=="1" (
        cmd /c start %BINARY% %PARAMS%
    ) ELSE (
        %BINARY% %PARAMS%
    )
    
) ELSE (
    ECHO Process found: PID %processid%
    cscript //E:JScript //nologo "%~f0" "%~nx0" "%processid%"
)

:END

exit /b %errorlevel% 
endlocal

@if (@X)==(@Y) @end JScript comment */

var sh=new ActiveXObject("WScript.Shell"); 
if (sh.AppActivate(WScript.Arguments.Item(1)) == 0) {
    sh.SendKeys("% r"); 
}

