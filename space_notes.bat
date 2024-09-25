::-----------------------------------------------------------------------------
:Notes Space
:: Setup what's needed for brainstorming, note-taking, writing session
::-----------------------------------------------------------------------------
@ECHO off


: have todo list ready but minimized
wmic process where "name='Todoist.exe'" get ProcessID | find /i "ProcessId" > nul || (START /min "Todoist"  /D "C:\Users\Dylan\AppData\Local\Programs\todoist\" Todoist.exe)

:: minimize everything
wscript.exe "H:\Config\Scripts\show-desktop.vbs"

code H:\Notes\

EXIT
