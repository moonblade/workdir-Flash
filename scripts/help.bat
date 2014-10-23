ECHO OFF
color 70
CLS
set stepname=HELP
title %stepname%
:HELP
cls
Title %pname%
ECHO.
ECHO.
echo                        HELP
echo                    ------------
ECHO.
set /a cnt1=1
ECHO   %cnt1%. About the Tool
echo.
set /a cnt1=%cnt1%+1
ECHO   %cnt1%. Requirements
echo.
set /a cnt1=%cnt1%+1
ECHO   %cnt1%. Using the tool
echo.

echo.
set /a cnt1=%cnt1%+1
ECHO   %cnt1%. Go back to Main Menu

echo.
echo.
set M=~
SET /P M=Type your choice then press ENTER:
if %M%==~ call script\invalid.bat & goto help
set cnt=0
set /a cnt=%cnt%+1
IF %M%==%cnt% goto about
set /a cnt=%cnt%+1
IF %M%==%cnt% cls & type essentials\txt\help\prk.txt & pause & goto help
set /a cnt=%cnt%+1
IF %M%==%cnt% cls & type essentials\txt\help\use.txt & pause & goto help

set /a cnt=%cnt%+1
IF %M%==%cnt% goto :eof
call script\invalid.bat & goto help

:about
cls
echo.
echo.
set /p vers=<scripts\txt\version.txt
echo        Tool Name       : FLASH
echo.
echo        Description     : Simple Tool to Flash boot and recovery
echo.
echo        Type            : Batch
echo.
echo        Current Version : %vers%
echo. 
echo        Developer       : mnishamk @xda
echo.
echo        License         : GPL
echo.
echo.
pause
goto help



echo.
echo Done
echo.
pause

