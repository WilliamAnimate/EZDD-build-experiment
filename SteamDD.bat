@echo off

mkdir "%appdata%\..\local\ecc\SteamDD
title SteamDD
cls

:abrt
set /P abort=Abort or Continue? (A OR C)  
IF "%abort%" EQU "A" EZDD
IF "%abort%" EQU "C" goto :appinfo
goto :abrt

:appinfo
set /P app=What is the app id you wish to download? 
set /P depot=Enter the Depot you will like to download 
set /P manifest=Enter the Manifest in the depot you would like to download 

:choice
cls
set /P usrsv=Do you wish to use a saved username slot (1), or enter the name in yourself (2)? 
if "%usrsv%" EQU "1" goto :retsv
if "%usrsv%" EQU "2" goto :usrent
goto :choice

:usrent
set /P usrname=What is your username? 

:pass
cls
set /P password=What is your password? 

goto :depot


:depot
@echo on
depotdownloader.exe -app %app% -depot %depot% -manifest %manifest% -username %usrname% -password %password%
@echo off
pause
goto :bye


:retsv
cls
dir "%LOCALAPPDATA%\ECC\EZDD\user"
set /P slot=Which slot? or r to go back

if "%slot%" EQU "r" goto :choice

if not exist "%LOCALAPPDATA%\ECC\EZDD\user\%slot%.txt" (
    @echo Slot %slot% doesn't exist!
    pause
    goto :retsv
)
set /P usrname=<"%LOCALAPPDATA%\ECC\EZDD\user\%slot%.txt"
set /P usrok=%usrname% will be used, Is that ok? (y/n) 
if "%usrok%" EQU "y" goto :pass
if "%usrok%" EQU "n" goto :retsv

:bye
EZDD