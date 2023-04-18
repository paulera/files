@echo off

FOR /F "usebackq skip=2 tokens=1,2*" %%A IN (`REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\chrome.exe" /ve`) DO (
    set CHROME_PATH=%%C
)


if [%~1]==[] powershell -command "& \"%CHROME_PATH%\" --app=[System.Web.HTTPUtility]::UrlEncode(\"https://www.youtube.com/embed/$(Get-Clipboard)\")"

if NOT [%~1]==[] powershell -command "& \"%CHROME_PATH%\" --app=[System.Web.HTTPUtility]::UrlEncode(\"https://www.youtube.com/embed/%*\")"