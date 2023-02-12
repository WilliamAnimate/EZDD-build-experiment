@echo off
title EZDD for SteamRE/depotdownloader
if not exist "%LOCALAPPDATA%\ECC\EZDD\first.launch" (
    mkdir "%LOCALAPPDATA%\ECC\EZDD\"
    cls
    @echo This file's existence means that you have read the readme and launched the app for the first time >> "%LOCALAPPDATA%\ECC\EZDD\first.launch"
    @echo A readme file will be displayed.
    pause
    cls
    @echo EZ DD aka Easy Depot Downloader readme
    @echo This is NOT a clone of SteamRE/depotdownloader. It is an addon to make things easier.
    @echo This project is in no way affiliated with the people at SteamRE.
    pause
    cls
    @echo PASSWORD NOTICE
    @echo we found out that the best way to keep your password safe is to
    @echo keep it inside a human brain, meaning we do not save your password.
    @echo we do keep your username tho, just so you dont have to type it in.
    pause
    cls
)

:choice
title Easy Depot Downloader
cls
@echo Welcome to the main menu of EZDD!
@echo Choose an option
@echo 1. Download a game
@echo 2. Move and activate a game
@echo 3. User Management
@echo 4. What is Steam activation?
set /P choice=5. quit
if "%choice%" EQU "1" SteamDD.bat
if "%choice%" EQU "2" COPYGAME.bat
if "%choice%" EQU "3" USERMAN.bat
if "%choice%" EQU "4" SVX.bat
if "%choice%" EQU "5" goto :bye 
goto :choice

:bye
@echo Bye!
timeout /T 2 /NOBREAK > nul