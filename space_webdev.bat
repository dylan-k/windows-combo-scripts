::-----------------------------------------------------------------------------
:Web Development Workspacepace
:: Setup what's needed for web dev: localhost server, coding tools, etc.
::-----------------------------------------------------------------------------
@ECHO OFF

start /wait H:\Config\Scripts\write_daylog.bat

@REM  if closed, open Todoist
wmic process where "name='Todoist.exe'" get ProcessID | find /i "ProcessId" > nul || (START /min "Todoist"  /D "C:\Users\Dylan\AppData\Local\Programs\todoist\" Todoist.exe)

: minimize all the things
: source: https://stackoverflow.com/questions/53011931/call-scf-item-from-command-prompt
START "" "H:\Config\Scripts\show-desktop.vbs"

%SystemRoot%\explorer.exe "H:\Sites"

:: if closed, open Local by Flywheel localhost server app
wmic process where "name='Local.exe'" get ProcessID | find /i "ProcessId" > nul || (START "Local" /D "C:\Program Files (x86)\Local\" Local.exe)

:: Filezilla for uploading files and browsing server
wmic process where "name='filezilla.exe'" get ProcessID | find /i "ProcessId" > nul || (START "FileZilla" /D "C:\Program Files\FileZilla FTP Client\" filezilla.exe)

:: Visual Studio Code for editing code
code

EXIT 
