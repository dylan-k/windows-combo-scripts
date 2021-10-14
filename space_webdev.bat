::-----------------------------------------------------------------------------
:Web Development Workspacepace
::Setup what's needed for web dev: localhost server, coding tools, etc.
::-----------------------------------------------------------------------------
@ECHO OFF

%SystemRoot%\explorer.exe "H:\Sites"

:: if closed, open DevKinsta localhost server app
:: DevKinsta opens Docker automatically
wmic process where "name='DevKinsta.exe'" get ProcessID | find /i "ProcessId" > nul || (START "Local" /D "C:\Program Files\DevKinsta\" DevKinsta.exe)

:: Filezilla for uploading files and browsing server
wmic process where "name='filezilla.exe'" get ProcessID | find /i "ProcessId" > nul || (START "FileZilla" /D "C:\Program Files\FileZilla FTP Client\" filezilla.exe)

: minimize all the things
: source: https://stackoverflow.com/questions/53011931/call-scf-item-from-command-prompt
START "" "H:\Config\Scripts\show-desktop.vbs"

:: Visual Studio Code for editing code
code

EXIT 
