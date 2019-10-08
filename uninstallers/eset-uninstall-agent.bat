@echo off
REM By Robbie Ferguson // baldnerd.com
REM Removes ESET Management Agent (previously named ESET Remote Administrator Agent) from Windows machines
REM Intended for use as GPO, but could have other applications
REM PLEASE BE MINDFUL - This will remove your connection to your ESMC/ERA server. Depending on your policies, this could be a very bad thing.
REM This program must be run as administrator
REM Version 1.01

REM Tested successfully with:
REM - ESET Management Agent 7.0.553.0 EEE9596D-3139-4B63-B08B-3F17F0E345F0

echo "Uninstalling ESET Management Agent..."
echo "Trying version 6 and under..."
wmic product where name="ESET Remote Administrator Agent" call uninstall /nointeractive
echo "Trying version 7 and up..."
wmic product where name="ESET Management Agent" call uninstall /nointeractive

REM This part is based upon a script provided by ESET Support, uploaded by Jarred Jordan
REM Apparently ERA Agent 6.5.522.0 would leave some registry keys behind, so this should clear that up for affected systems
echo "Don't worry if you get errors about missing registry keys."
echo "Just removing some that may be left behind. If they don't exist, no worries."
reg delete "HKEY_CLASSES_ROOT\Installer\Products\07F21F149AF55F34494F355BE44BEE4C" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Products\07F21F149AF55F34494F355BE44BEE4C" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\07F21F149AF55F34494F355BE44BEE4C" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{41F12F70-5FA9-43F5-94F4-53B54EB4EEC4}" /f

echo "Done."
echo "Please reboot your computer to complete the removal."
