@echo off
cls

echo Launching Black Desert Online

:: Change this to point to your BDO launcher executable
start /b "" "D:\Games\BDO\Black Desert Online Launcher.exe"

:: Make sure you're connected to a server before this number of seconds passes. 
:: This number can be changed to start the script at a different time.
timeout /t 600

:start
echo Script Started

set bdProcess=

for /f "tokens=2" %%a in ('
    tasklist /FI "IMAGENAME eq BlackDesert64.exe" ^| findstr /i "BlackDesert64.exe"
') do set ProcessId=%%a
for /f "tokens=3,5" %%a in ('
    netstat -on
') do if %%b==%ProcessId% set bdProcess=%%a

echo Server IP:
echo %bdProcess%

if [%bdProcess%] NEQ [] (
	echo Black Desert connected
	echo Looping
	timeout /t 5
	goto start
) else (
	echo Process Ended
	taskkill /pid %ProcessId%
)
