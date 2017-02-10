@echo off
cls

echo Launching Black Desert Online

start /b "" "D:\Games\BDO\Black Desert Online Launcher.exe"

timeout /t 180

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
