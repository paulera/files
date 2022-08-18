:: calls google chrome searching for the params,
:: or for what is in the clipboard if nothing is provided

@echo off
if [%~1]==[] powershell -command "& \"C:\Program Files\Google\Chrome\Application\chrome.exe\" [System.Web.HTTPUtility]::UrlEncode(\"https://www.google.com/search?q=$(Get-Clipboard)\")"
if NOT [%~1]==[] powershell -command "& \"C:\Program Files\Google\Chrome\Application\chrome.exe\" [System.Web.HTTPUtility]::UrlEncode(\"https://www.google.com/search?q=%*\")"
