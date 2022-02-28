echo Lazy File Integrity Checks for Windows Systems
@echo off
echo [=====================Checking health======================]
timeout>nul 1
@dism /online /cleanup-image /checkhealth
echo:
echo [=====================Scanning health======================]
timeout>nul 1
@dism /online /cleanup-image /scanhealth
echo:
echo [=====================Restoring health=====================]
timeout>nul 1
@dism /online /cleanup-image /restorehealth
echo:
echo [==============Starting file integrity checks==============]

sfc /scannow

echo [======================Creating SFC file===================]
findstr /c:"[SR]" %windir%\Logs\CBS\CBS.log > C:\sfclogs.txt"
echo [=====================Opening SFC file=====================]
echo:
timeout>nul 5
C:\sfclogs.txt
echo [==============Waiting for key press to exit===============]
echo Thanks for using this script, might have some more @ https://github.com/bbenblock/WindowsIDLEscripts
pause>nul
exit