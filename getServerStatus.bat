@echo off
del serverStatus.log
echo |set /p="Started..."
echo:
echo|set /p="Checking all Server's latest Status" > serverStatus.log
echo: >> serverStatus.log
echo %DATE% %TIME% >> serverStatus.log
echo: >> serverStatus.log

for /f %%i in (servers.txt) do (
    echo |set /p="Testing %%i"
    echo:
    echo %%i >> serverStatus.log
    echo: >> serverStatus.log
    (ssh -t %%i "uptime && date") 1>>serverStatus.log 2>&1
    echo: >> serverStatus.log
    echo: >> serverStatus.log
)

echo|set /p="End of the Script" >> serverStatus.log