ECHO OFF
color 70
CLS
set a=%~dp0
set u=temp\temp
setlocal enabledelayedexpansion
     for %%b in ("!a:~0,-1!") do (
      set par=%%~dpb
	  set parn=%%~nb
     for %%c in ("!par:~0,-1!") do (
      set gp=%%~dpc
      set gpn=%%~nc
)
)
:seta
cls
set cnt=~
set /p cnt=Enter name : FLASH-v
if %cnt%==~ (
echo.
echo Enter a valid version
echo.
pause
goto seta
)
echo %cnt% >scripts\txt\version.txt
set name=FLASH-v%cnt%
echo.
echo Creating the zip
echo.
if exist %u% RD /S /Q %u%
mkdir %u%
mkdir %u%\essentials
mkdir %u%\scripts
xcopy essentials\* %u%\essentials /e
xcopy scripts\* %u%\scripts /e
copy FLASH.bat %u%
copy essentials\7za.exe %u%
cd %u%
if exist essentials\intro.exe move essentials\intro.exe scripts
echo %cnt% >scripts\txt\version.txt
copy FLASH.bat essentials
rename essentials\FLASH.bat Source.txt

7za a -mx9 -tzip "%name%.zip" "*"
7za d %name%.zip 7za.exe
del 7za.exe

cd..
cd..
cd..
if not exist legacy\FLASH mkdir legacy\FLASH
copy "%gpn%\%u%\%name%.zip" legacy\FLASH
copy "%gpn%\%u%\%name%.zip" "P:\Dropbox\Public\FLASH"
echo %cnt% >"P:\Dropbox\Public\FLASH\fversion.txt"
RD /S /Q "%gpn%\temp"
echo.
echo Done
echo.
endlocal
pause