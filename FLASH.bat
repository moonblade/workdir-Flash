ECHO OFF
color 70
CLS

:MAIN
if not exist BOOT\IMG mkdir BOOT\IMG
if not exist RECOVERY\IMG mkdir RECOVERY\IMG
CLS
ECHO.
ECHO.
set /a cnt=0
set pname=FLASH
Title %pname%
ECHO.
ECHO.
ECHO                             ^+================^+ 
ECHO                                   %pname%
ECHO                             ^+================^+ 
ECHO                                          - By mnishamk
ECHO.
ECHO                                   MAIN MENU   
ECHO                                   =========
set /a cnt1=1
rem see how i used a variable in place of just typing it, so i can press ctrl+D and just change the text.
rem This way i can enter an option in between without any editing.
rem yet another example to show that i am lazy.
ECHO   %cnt1%. Flash Boot
echo.
set /a cnt1=%cnt1%+1
ECHO   %cnt1%. Flash Recovery
echo.
set /a cnt1=%cnt1%+1
ECHO   %cnt1%. Check for Updates.
echo.
set /a cnt1=%cnt1%+1
ECHO   %cnt1%. Help
echo.
ECHO   x. Exit

REM choosing the option
echo.
echo.
set M=~
SET /P M=Type your choice then press ENTER:
set /a cnt=%cnt%+1

REM For flashing boot
IF %M%==%cnt% call scripts\boot.bat && goto main

REM For flashing recovery
set /a cnt=%cnt%+1
IF %M%==%cnt% call scripts\recovery.bat && goto main

Rem Checking for update
set /a cnt=%cnt%+1
IF %M%==%cnt% call scripts\update.bat && goto main

REM Help
set /a cnt=%cnt%+1
IF %M%==%cnt% call scripts\help.bat && goto main

IF %M%==create call scripts\create.bat && goto main

REM Of course, when you gotta go, You gotta go. :D
IF %M%==x goto exit



EXIT


:INVALID
 ECHO.
 ECHO invalid option.
 ECHO.
 PAUSE
 GOTO MENU


:EXIT
