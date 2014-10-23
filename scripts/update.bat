ECHO OFF
color 70
CLS
set stepname=update
title %stepname%

:start
set a=%~dp0
setlocal enabledelayedexpansion
     for %%b in ("!a:~0,-1!") do (
      set par=%%~dpb
	  set parn=%%~nb
     for %%c in ("!par:~0,-1!") do (
      set gp=%%~dpc
      set gpn=%%~nc
)
)
CLS
echo.
echo Checking for update.
echo.
pause
:a
title Update
set /p vers=<scripts\txt\version.txt
set vers=%vers: =%
essentials\wget --no-check-certificate https://dl.dropboxusercontent.com/u/93660483/FLASH/fversion.txt
if errorlevel 1 (
cls
echo.
echo Some error occured.
echo.
pause
goto :eof
)
move fversion.txt essentials\txt
set /p newvers=<essentials\txt\fversion.txt
set newvers=%newvers: =%
if %vers% lss %newvers% (
cls
echo.
echo There is an update available.
echo.
echo Downloading update
pause
cls
essentials\wget --no-check-certificate https://dl.dropboxusercontent.com/u/93660483/FLASH/FLASH-v%newvers%.zip
if errorlevel 1 (
cls
echo.
echo Some error occured.
echo.
pause
goto :eof
)
if not exist UPDATE mkdir UPDATE
move FLASH-v*.zip UPDATE
cls
echo.
echo Update Downloaded. You can find it in UPDATE\
REM Installing Update
echo.
pause
echo.

REM cd..
REM copy %gpn%\UPDATE\Rom-Porter-v%newvers%.zip 
REM if errorlevel 1 (
REM echo.
REM Echo Some Error Occured.
REM echo.
REM pause
REM goto :eof 
REM )
REM copy %gpn%\scripts\toolupd2.bat 
REM copy %gpn%\essentials\7za.exe
REM echo %gpn% >gpn.txt
REM start toolupd2.bat

goto next
) else (
cls
echo.
echo There is no update currently available.
echo.
pause
)


