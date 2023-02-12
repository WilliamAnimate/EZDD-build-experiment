@echo off
cls
title Copy Downloaded game
set /P id=Enter the depot id here or type in r to go back

if "%id%" EQU "r" goto :bye


:steampathchk
if exist "%appdata%\..\local\ecc\steamdd\pa.th" (
goto :copy
)
cls
set /P p=What is the common folder path?
@echo %p% >> "%appdata%\..\local\ecc\steamdd\pa.th"

:copy
cls
title Steam Validation and copy process
set /P path=<"%appdata%\..\local\ecc\steamdd\pa.th"
@echo We will now open 2 directories, the first directory is your common folder
@echo the second directory is the folder the game was downloaded to
@echo in the common folder, locate the folder of the game you have downloaded.
@echo you will be prompted to enter it, it is case sensitive
@echo in the depot download folder - after you have entered the folder name
@echo rename the folder you see into the SAME FOLDER NAME
@echo if you are confused about all this, please select the "What is Steam Activation in the home menu"
pause
start %path%
start .\depots\%id%

@echo please look into the common folder for the folder name of the game you want to validate.
set /P folnm=IT IS CASE SENSITIVE 
@echo Please rename the folder you see in your depot downloader folder to %folnm%
@echo as soon you rename the folder, we will recase the folder and begin the validation process

:checkifrename
if not exist .\depots\%depot%\%folnm% (
    goto :checkifrename
)
cd .\depots\%depot%
rename %folnm% recasing
rename recasing %folnm%

cls
@echo Please move %folnm% to the common folder
cd /d "%path%"
rename "%folnm%" "%folnm%CURRENT"

:newfolchk
if not exist %folnm% (
    goto :newfolchk
)
@echo Please wait until the moving process has completed
pause
cls
cd %folnm%
dir *.exe
@echo shown above is the directory of the depot downloaded game
set /P exenm=Please type in the executable name of which launches the game 
cls
title instruction on Validation
@echo the game will now launch
@echo please wait for the game to be reopned by steam, when that happens, steam validation is a success
@echo if you are confused, please select the "What is Steam Activation in the main menu"
@echo please note that some games will not require validation, but will be launched anyways
pause
%exenm%

:bye
EZDD
