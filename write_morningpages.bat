::-----------------------------------------------------------------------------
:Morning Pages Launcher
:: Make a file with current date (yyyy-mm-dd_morning.txt) as filename
:: useful for "new note" or "new journal" task
:: hugo makes the file, using its archetype for journal
:: file's opened in Obsidian for editing
::-----------------------------------------------------------------------------
@echo off

:: get the date
set NOWYEAR=%date:~10,4%
set NOWMONTH=%date:~4,2%
set NOWDAY=%date:~7,2%

:: Include format yyyy-mm in filename
set FILEROOT=H:\Notes\
set FILEPATH=H:\Notes\content\journal\
set FILENAME=%NOWYEAR%-%NOWMONTH%-%NOWDAY%_morning.md

echo "filename is %fileNAME%"

if exist %FILEPATH%%FILENAME% (
    echo "file exists"
    rem sed '5 a #This is just a commented line' %FILEPATH%%FILENAME%
) else (
    echo "file doesn't exist"
    cd /d "%FILEROOT%"
    hugo new journal/%FILENAME%
)

START obsidian://open?vault=Notes^&file=content\journal\%FILENAME%

EXIT
