ECHO OFF
color 70
CLS
set stepname=BOOT
title %stepname%

:FLSIMG
echo.
ECHO Select The BOOT from the following list.
ECHO.
SetLocal EnableDelayedExpansion
Set a=%~dp0
     for %%b in ("!a:~0,-1!") do (
      set par=%%~dpb
	  set parn=%%~nb
     for %%c in ("!par:~0,-1!") do (
      set gp=%%~dpc
      set gpn=%%~nc
)
)
Set _Source=%par%\BOOT\IMG
Set _Count=0
For /F "Tokens=* Delims=" %%I In ('Dir /A-D /B "%_Source%\*.img" 2^>Nul') Do (Set /A _Count+=1
Set _F!_Count!=%%I)
If %_Count%==0 Echo.No files found&pause&Goto :EOF
For /L %%I In (1,1,%_Count%) Do Echo.%%I. !_F%%I!
echo.
echo b. Go back.
echo.

:_Askimg
Echo.
set _Choice=~
Set /P _Choice=Please enter an input:
if %_Choice%==b goto :EOF
If %_Choice% GTR %_Count% Echo.Please enter a number between 1 and %_Count%&Goto :_Askimg
if %_Choice%==~ goto :_Askimg
Set _FileName=!_F%_Choice%!
REM ECHO.
REM ECHO Booting in fastboot mode.
REM ECHO.
REM adb reboot bootloader.
ECHO.
ECHO Reboot into Fastboot mode and connect.
ECHO Press Enter when in fastboot mode.
ECHO.
PAUSE.
ECHO Flashing BOOT.
ECHO.
essentials\fastboot flash boot BOOT/IMG/%_FileName%
essentials\adb kill-server
PAUSE
ECHO.
ECHO DONE! Press any key to go back
ECHO.
PAUSE
