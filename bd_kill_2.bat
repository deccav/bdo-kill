@echo off
cls
:start

echo Script Started

for /f "tokens=2" %%a in ('
    tasklist /FI "IMAGENAME eq BlackDesert64.exe" ^| findstr /i "BlackDesert64.exe"
') do set ProcessId=%%a
for /f "tokens=3,5" %%a in ('
    netstat -on
') do if %%b==%ProcessId% echo %%a

netstat > C:\bdnetstat.txt

for /f "tokens=3" %%f in ('find /c /i "%%a" "C:\bdnetstat.txt"') do set bdProcess=%%f

echo %bdProcess%

if "%bdProcess%"=="1" (
	echo Black Desert connected
	echo Looping
	sleep 5
	goto start
) else (
	echo Process Ended
	taskkill /im blackdesert64.exe
)

