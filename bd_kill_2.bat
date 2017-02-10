@echo off
cls
:start

echo Script Started

netstat > C:\bdnetstat.txt

for /f "tokens=3" %%f in ('find /c /i "5.79.111.125" "C:\bdnetstat.txt"') do set bdProcess=%%f

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



