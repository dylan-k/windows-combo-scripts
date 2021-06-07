::-----------------------------------------------------------------------------
:Notes Space
:: Setup what's needed for brainstorming, note-taking, writing session
::-----------------------------------------------------------------------------
@ECHO off


: have todo list ready but minimized
wmic process where "name='Todoist.exe'" get ProcessID | find /i "ProcessId" > nul || (START /min "Todoist"  /D "C:\Users\Dylan\AppData\Local\Programs\todoist\" Todoist.exe)

: minimize all the things
: source: https://stackoverflow.com/questions/53011931/call-scf-item-from-command-prompt
START "" "H:\Config\Scripts\show-desktop.vbs"

start /wait H:\Config\Scripts\write_daylog.bat

EXIT
