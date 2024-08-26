:restart
: Command-line to disable, set title and screen size
@echo off
title zelez windows utilities
mode con: cols=130 lines=36

: Enables Colours
SetLocal EnableExtensions
For /F %%G In ('Echo Prompt $E ^| "%__AppDir__%cmd.exe"') Do Set "ESC=%%G"

: Enables Admin
if not "%1"=="am_admin" ( 
  powershell -Command "Start-Process -Verb RunAs -FilePath '%0' -ArgumentList 'am_admin'" 
  exit /b 
)

:::  ___ ___ _   ___ ___
::: |_  | __| | | __|_  |
:::  / /| _|| |_| _| / /
::: |___|___|___|___|___|
:::

: Startup screen
echo %ESC%[96m
cls
for /f "delims=: tokens=*" %%R in ('findstr /b ::: "%~f0"') do @echo(%%R
)
echo %ESC%[97mzelez windows utilities
echo %ESC%[37mVersion 1.1.0
echo.
echo Free and opensource made by %ESC%[96mzelez
echo %ESC%[97mMore features planed.
echo.
echo %ESC%[37mhttps://zelez.net
echo.
echo %ESC%[97mYou can always use the folowing options.
echo    %ESC%[96mB %ESC%[97mto go back.
echo    %ESC%[96mR %ESC%[97mto restart.
echo    %ESC%[96mQ %ESC%[97mto quit.
echo.
echo %ESC%[37mSource code
echo https://git.zelez.net/zelez/zwu
echo %ESC%[97m
REM
pause

: Main menu
:begin
echo %ESC%[96m
cls
for /f "delims=: tokens=*" %%R in ('findstr /b ::: "%~f0"') do @echo(%%R
)
echo %ESC%[97mzelez windows utilities
echo %ESC%[37mVersion 1.1.0
echo Change windows settings quickly via batch.
echo ==========================================================================================================
echo.
echo %ESC%[97mSelect a option from below:
echo.
echo    1) Windows 11 context menu editor
echo       %ESC%[37mChanges the default Windows 11 style richt click menu (On lower Windows does nothing).
echo.
echo    %ESC%[97m2) Windows Shit
echo       %ESC%[37mSecret Settings, Boot to bios and create a restore point.
echo.
echo    %ESC%[97m3) Power options
echo       %ESC%[37mCreate Ultimate Performance powerplan, Change, Delete or List powerplan(s).
echo.
echo    %ESC%[97m4) Windows firewall
echo       %ESC%[37mReset, turn off/on the windows firewall or show current state of all firewall profiles.
echo.
echo    %ESC%[97m5) PowerShell execution policies
echo       %ESC%[37mChange and view the current PowerShell execution policies.
echo.
echo    %ESC%[97mQ) Quit
echo       %ESC%[37mCloses the menu fully
echo ==========================================================================================================
echo %ESC%[97m
set /p "op=Type option: %ESC%[96m"
for %%B in ("b" "B") do if "%op%"==%%B goto :begin
for %%R in ("r" "R") do if "%op%"==%%R goto :restart
for %%X in ("q" "Q") do if "%op%"==%%X goto :opx
if "%op%"=="1" goto :w11cme
if "%op%"=="2" goto :ws
if "%op%"=="3" goto :po
if "%op%"=="4" goto :fw
if "%op%"=="5" goto :pep
goto :begin

: Windows 11 context menu editor
:w11cme
reg query "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" >nul
echo %ESC%[96m
cls
for /f "delims=: tokens=*" %%R in ('findstr /b ::: "%~f0"') do @echo(%%R
)
echo %ESC%[97mWindows 11 Context menu editor
echo Changes the Windows 11 style of the context (right click) menu.
echo ==========================================================================================================
if %errorlevel% equ 0 (
  echo %ESC%[92mWindows 10 Style is enabled
) else (
  echo %ESC%[92mWindows 11 Style is enabled
)
echo.
echo %ESC%[97mSelect a option from below:
echo.
echo    1) Windows 11 style
echo       %ESC%[37mChanges to the default Windows 11 style richt click menu.
echo.
echo    %ESC%[97m2) Windows 10 style
echo       %ESC%[37mChanges to the older Windows 10 style richt click menu
echo.
echo    %ESC%[97mB) Back
echo       %ESC%[37mGo back to the begin of the menu
echo ==========================================================================================================
echo %ESC%[97m
set /p "op1=Type option: %ESC%[96m"
for %%B in ("b" "B") do if "%op1%"==%%B goto :begin
for %%R in ("r" "R") do if "%op1%"==%%R goto :restart
for %%X in ("q" "Q") do if "%op1%"==%%X goto :opx
if "%op1%"=="1" goto :op11
if "%op1%"=="2" goto :op12
goto :w11cme

:op11
echo %ESC%[97m
cls
echo Adding the windows 11 context menu back.
reg.exe delete "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}" /f
REM
echo.
echo Restarting Windows explorer...
powershell $open_folders = @((New-Object -com shell.application).Windows()).Document.Folder.Self.Path; Stop-Process -Name explorer -Force;  foreach ($element in $open_folders){Invoke-Item $($element)}
REM
goto :w11cme

:op12
echo %ESC%[97m
cls
echo Removing the windows 11 context menu.
reg.exe add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve
REM
echo.
echo Restarting Windows explorer...
powershell $open_folders = @((New-Object -com shell.application).Windows()).Document.Folder.Self.Path; Stop-Process -Name explorer -Force;  foreach ($element in $open_folders){Invoke-Item $($element)}
REM
goto :w11cme

: Windows shit
:ws
echo %ESC%[96m
cls
for /f "delims=: tokens=*" %%R in ('findstr /b ::: "%~f0"') do @echo(%%R
)
echo %ESC%[97mWindows Shit
echo Secret Settings, Boot to bios and create a restore point.
echo ==========================================================================================================
echo.
echo %ESC%[97mSelect a option from below:
echo.
echo    1) Secret Settings
echo       %ESC%[37mCreate secret settings (God mode) folder on the Desktop.
echo.
echo    %ESC%[97m2) Boot to bios
echo       %ESC%[37mBoots you to your computer bios.
echo.
echo    %ESC%[97m3) Restore point
echo       %ESC%[37mOpen GUI to create a system restore point.
echo.
echo    %ESC%[97mB) Back
echo       %ESC%[37mGo back to the begin of the menu
echo ==========================================================================================================
echo %ESC%[97m
set /p "op2=Type option: %ESC%[96m"
for %%B in ("b" "B") do if "%op2%"==%%B goto :begin
for %%R in ("r" "R") do if "%op2%"==%%R goto :restart
for %%X in ("q" "Q") do if "%op2%"==%%X goto :opx
if "%op2%"=="1" goto :op21
if "%op2%"=="2" goto :op22
if "%op2%"=="3" goto :op23
goto :ws

:op21
echo %ESC%[97m
cls
echo %ESC%[97mCreating secret settings (God mode) folder on Desktop.
md "%USERPROFILE%\Desktop\.{ED7BA470-8E54-465E-825C-99712043E01C}"
ping 127.0.0.1 -n 3 > nul
goto :ws

:op22
echo %ESC%[97m
cls
echo %ESC%[91mPress Ctrl + C to cancel
echo.
echo %ESC%[97mBooting to BIOS in %ESC%[91m5 %ESC%[97msecconds.
ping 127.0.0.1 -n 2 > nul
echo %ESC%[97mBooting to BIOS in %ESC%[91m4 %ESC%[97msecconds.
ping 127.0.0.1 -n 2 > nul
echo %ESC%[97mBooting to BIOS in %ESC%[91m3 %ESC%[97msecconds.
ping 127.0.0.1 -n 2 > nul
echo %ESC%[97mBooting to BIOS in %ESC%[91m2 %ESC%[97msecconds.
ping 127.0.0.1 -n 2 > nul
echo %ESC%[97mBooting to BIOS in %ESC%[91m1 %ESC%[97mseccond.
ping 127.0.0.1 -n 2 > nul
cls
echo Booting to BIOS now.
shutdown /r /fw /t 2
goto :ws

:op23
echo %ESC%[97m
cls
echo Starting restore point GUI.
start rstrui.exe
ping 127.0.0.1 -n 3 > nul
goto :ws

: Power options
:po
echo %ESC%[96m
cls
for /f "delims=: tokens=*" %%R in ('findstr /b ::: "%~f0"') do @echo(%%R
)
echo %ESC%[97mPower options
echo Create Ultimate Performance powerplan Change, Delete or List powerplan(s).
echo ==========================================================================================================%ESC%[92m
powercfg /getactivescheme
echo.
echo.
echo %ESC%[97mSelect a option from below:
echo.
echo    1) Create Ultimate Performance powerplan
echo       %ESC%[37mCreates a Ultimate Performance powerplan.
echo.
echo    %ESC%[97m2) Change active powerplan
echo       %ESC%[37mChanges your current powerplan to a other.
echo.
echo    %ESC%[97m3) Delete a powerplan
echo       %ESC%[37mDeletes a powerplan.
echo.
echo    %ESC%[97m4) List powerplan(s)
echo       %ESC%[37mList all the powerplan(s).
echo.
echo    %ESC%[97mB) Back
echo       %ESC%[37mGo back to the begin of the menu
echo ==========================================================================================================
echo %ESC%[97m
set /p "op3=Type option: %ESC%[96m"
for %%B in ("b" "B") do if "%op3%"==%%B goto :begin
for %%R in ("r" "R") do if "%op3%"==%%R goto :restart
for %%X in ("q" "Q") do if "%op3%"==%%X goto :opx
if "%op3%"=="1" goto :op31
if "%op3%"=="2" goto :op32
if "%op3%"=="3" goto :op33
if "%op3%"=="4" goto :op34
goto :po

:op31
echo %ESC%[97m
cls
echo Adding Ultimate Performance powerplan
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61
powercfg /list
echo.
echo Copy and paste the GUID of the Ultimate Performance powerplan.
REM
set /p "scheme=Select power scheme GUID: "
powercfg /setactive "%scheme%"
REM
echo %ESC%[92m
powercfg /getactivescheme
REM
goto :po

:op32
echo %ESC%[97m
cls
powercfg /list
echo.
echo Copy and paste the GUID of the powerplan you wanna change to.
REM
set /p "scheme=Select power scheme GUID: "
powercfg /setactive "%scheme%"
REM
echo %ESC%[92m
powercfg /getactivescheme
REM
goto :po

:op33
echo %ESC%[97m
cls
powercfg /list
echo.
echo Copy and paste the GUID of the powerplan you wanna delete.
REM
set /p "scheme=Select power scheme GUID: "
powercfg /delete "%scheme%"
REM
powercfg /list
REM
ping 127.0.0.1 -n 6 > nul
goto :po

:op34
echo %ESC%[97m
cls
powercfg /list
pause
goto :po

: Firewall
:fw
echo %ESC%[96m
cls
for /f "delims=: tokens=*" %%R in ('findstr /b ::: "%~f0"') do @echo(%%R
)
echo %ESC%[97mWindows firewall
echo Reset, turn off/on the windows firewall or show current state of all firewall profiles.
echo ==========================================================================================================
echo.
echo %ESC%[97mSelect a option from below:
echo.
echo    1) Reset
echo       %ESC%[37mReset the windows firewall.
echo.
echo    %ESC%[97m2) Turn off
echo       %ESC%[37mTurns off the windows firewall.
echo.
echo    %ESC%[97m3) Turn on
echo       %ESC%[37mTurns on the windows firewall.
echo.
echo    %ESC%[97m4) Show profiles
echo       %ESC%[37mShows all windows firewall profiles.
echo.
echo    %ESC%[97mB) Back
echo       %ESC%[37mGo back to the begin of the menu
echo ==========================================================================================================
echo %ESC%[97m
set /p "op4=Type option: %ESC%[96m"
for %%B in ("b" "B") do if "%op4%"==%%B goto :begin
for %%R in ("r" "R") do if "%op4%"==%%R goto :restart
for %%X in ("q" "Q") do if "%op4%"==%%X goto :opx
if "%op4%"=="1" goto :op41
if "%op4%"=="2" goto :op42
if "%op4%"=="3" goto :op43
if "%op4%"=="4" goto :op44
goto :fw

:op41
echo %ESC%[97m
cls
echo Resetting all firewall profiles.
netsh advfirewall reset
REM
ping 127.0.0.1 -n 6 > nul
goto :fw

:op42
echo %ESC%[97m
cls
echo Turning off all firewall profiles.
netsh advfirewall set allprofiles state off
REM
ping 127.0.0.1 -n 6 > nul
goto :fw

:op43
echo %ESC%[97m
cls
echo Turning on all firewall profiles.
netsh advfirewall set allprofiles state on
REM
ping 127.0.0.1 -n 6 > nul
goto :fw

:op44
echo %ESC%[97m
cls
echo Displaying all firewall profiles.
netsh advfirewall show allprofiles
REM
pause
goto :fw

: PowerShell execution policies
:pep
FOR /F "tokens=* USEBACKQ" %%F IN (`Powershell Get-ExecutionPolicy CurrentUser`) DO (
SET executionpolicyCU=%%F
)
FOR /F "tokens=* USEBACKQ" %%F IN (`Powershell Get-ExecutionPolicy LocalMachine`) DO (
SET executionpolicyLM=%%F
)
echo %ESC%[96m
cls
for /f "delims=: tokens=*" %%R in ('findstr /b ::: "%~f0"') do @echo(%%R
)
echo %ESC%[97mPowerShell execution policies
echo Change and view the current PowerShell execution policies.
echo ==========================================================================================================
echo Current ExecutionPolicy CU: %ESC%[96m%executionpolicyCU% %ESC%[97mLM: %ESC%[96m%executionpolicyLM%
echo %ESC%[97mIt will change the ExecutionPolicy for Current User and Local Machine
echo.
echo %ESC%[97mSelect a option from below:
echo.
echo    1) Unrestricted
echo       %ESC%[37mAllow all scripts
echo.
echo    %ESC%[97m2) RemoteSigned
echo       %ESC%[37mAllow local scripts and remote signed scripts
echo.
echo    %ESC%[97m3) AllSigned
echo       %ESC%[37mAllow only signed scripts
echo.
echo    %ESC%[97m4) Restricted
echo       %ESC%[37mPermits individual commands, but does not allow scripts.
echo.
echo    %ESC%[97mB) Back
echo       %ESC%[37mGo back to the begin of the menu
echo ==========================================================================================================
echo %ESC%[97m
set /p "op5=Type option: %ESC%[96m"
for %%B in ("b" "B") do if "%op5%"==%%B goto :begin
for %%R in ("r" "R") do if "%op5%"==%%R goto :restart
for %%X in ("q" "Q") do if "%op5%"==%%X goto :opx
if "%op5%"=="1" goto :op51
if "%op5%"=="2" goto :op52
if "%op5%"=="3" goto :op53
if "%op5%"=="4" goto :op54
goto :pep

:op51
echo %ESC%[97m
cls
echo setting powershell ExecutionPolicy to: Unrestricted
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell -ArgumentList 'Set-ExecutionPolicy Unrestricted -Force -Scope CurrentUser' -Verb RunAs}"
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell -ArgumentList 'Set-ExecutionPolicy Unrestricted -Force -Scope LocalMachine' -Verb RunAs}"
Powershell Get-ExecutionPolicy CurrentUser
Powershell Get-ExecutionPolicy LocalMachine
ping 127.0.0.1 -n 3 > nul
goto :pep

:op52
echo %ESC%[97m
cls
echo setting powershell ExecutionPolicy to: RemoteSigned
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell -ArgumentList 'Set-ExecutionPolicy RemoteSigned -Force -Scope CurrentUser' -Verb RunAs}"
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell -ArgumentList 'Set-ExecutionPolicy RemoteSigned -Force -Scope LocalMachine' -Verb RunAs}"
Powershell Get-ExecutionPolicy CurrentUser
Powershell Get-ExecutionPolicy LocalMachine
ping 127.0.0.1 -n 3 > nul
goto :pep

:op53
echo %ESC%[97m
cls
echo setting powershell ExecutionPolicy to: AllSigned
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell -ArgumentList 'Set-ExecutionPolicy AllSigned -Force -Scope CurrentUser' -Verb RunAs}"
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell -ArgumentList 'Set-ExecutionPolicy AllSigned -Force -Scope LocalMachine' -Verb RunAs}"
Powershell Get-ExecutionPolicy CurrentUser
Powershell Get-ExecutionPolicy LocalMachine
ping 127.0.0.1 -n 3 > nul
goto :pep

:op54
echo %ESC%[97m
cls
echo setting powershell ExecutionPolicy to: Restricted
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell -ArgumentList 'Set-ExecutionPolicy Restricted -Force -Scope CurrentUser' -Verb RunAs}"
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell -ArgumentList 'Set-ExecutionPolicy Restricted -Force -Scope LocalMachine' -Verb RunAs}"
Powershell Get-ExecutionPolicy CurrentUser
Powershell Get-ExecutionPolicy LocalMachine
ping 127.0.0.1 -n 3 > nul
goto :pep

:opx
:End