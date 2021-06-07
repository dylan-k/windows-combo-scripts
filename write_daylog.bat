::-----------------------------------------------------------------------------
:Daily Notes 
:: Make a file with current date (yyyy-mm-daylog.txt) as filename
:: useful for "new note" or "new journal" task
::-----------------------------------------------------------------------------
@echo off

:: get the date
set NOWYEAR=%date:~10,4%
set NOWMONTH=%date:~4,2%

:: Include format yyyy-mm in filename
set FILEROOT=H:\Notes\content\log\
set FILEPATH=H:\Notes\content\log\
set FILENAME=%NOWYEAR%-%NOWMONTH%_DAYLOG.md

echo "filename is %fileNAME%"
cd /d %FILEROOT% 

if exist %FILEPATH%%FILENAME% (
  echo "file exists"
  rem sed '5 a #This is just a commented line' %FILEPATH%%FILENAME%
) else (
  echo "file doesn't exist"
  hugo new log/%FILENAME%
)


:: START "" "%localappdata%\Programs\Microsoft VS Code\Code.exe" --goto "H:\Notes\notes.code-workspace" %FILEPATH%%FILENAME%:6

START /max obsidian://open?vault=Notes^&file=content\log\%FILENAME%

EXIT
