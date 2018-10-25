@echo off
REM Version 1
REM Removes ESET Remote Administrator Agent
REM Intended for use as GPO, but could have other applications
REM By Robbie Ferguson // baldnerd.com
REM This program has to be run as administrator

echo "Uninstalling ESET Management Agent..."
REM Version 6 and under
wmic product where name="ESET Remote Administrator Agent" call uninstall
REM Version 7 and up
wmic product where name="ESET Management Agent" call uninstall

REM This part is based upon a script provided by ESET Support, uploaded by Jarred Jordan
echo "Don't worry if you get errors about missing registry keys."
echo "Just removing some that may be left behind. If they don't exist, no worries."
reg delete "HKEY_CLASSES_ROOT\Installer\Products\07F21F149AF55F34494F355BE44BEE4C" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Products\07F21F149AF55F34494F355BE44BEE4C" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\07F21F149AF55F34494F355BE44BEE4C" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{41F12F70-5FA9-43F5-94F4-53B54EB4EEC4}" /f
