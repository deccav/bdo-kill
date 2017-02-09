@ECHO OFF
for /f "tokens=2" %%a in ('
    tasklist /FI "IMAGENAME eq BlackDesert64.exe" ^| findstr /i "BlackDesert64.exe"
') do set ProcessId=%%a
for /f "tokens=3,5" %%a in ('
    netstat -on
') do if %%b==%ProcessId% echo %%a
