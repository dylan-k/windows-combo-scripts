::-----------------------------------------------------------------------------
:Daily Notes 
:: Make a file with current date (yyyy-mm-daylog.txt) as filename
:: useful for "new note" or "new journal" task
::-----------------------------------------------------------------------------
@echo off

:: get the date
set NOWYEAR=%date:~10,4%
set NOWMONTH=%date:~4,2%
set NOWDAY=%date:~6,2%

:: set month name for the corresponding numbers

if %NOWMONTH%==01 set NOWMONTHNAME=January
if %NOWMONTH%==02 set NOWMONTHNAME=February
if %NOWMONTH%==03 set NOWMONTHNAME=March
if %NOWMONTH%==04 set NOWMONTHNAME=April
if %NOWMONTH%==05 set NOWMONTHNAME=May
if %NOWMONTH%==06 set NOWMONTHNAME=June
if %NOWMONTH%==07 set NOWMONTHNAME=July
if %NOWMONTH%==08 set NOWMONTHNAME=August
if %NOWMONTH%==09 set NOWMONTHNAME=September
if %NOWMONTH%==10 set NOWMONTHNAME=October
if %NOWMONTH%==11 set NOWMONTHNAME=November
if %NOWMONTH%==12 set NOWMONTHNAME=December

:: Include format yyyy-mm in filename
set FILEROOT=H:\Notes\
set FILEPATH=H:\Notes\content\log\
set FILENAME=%NOWYEAR%-%NOWMONTH%_DAYLOG.md

echo "filename is %fileNAME%"
cd /d %FILEROOT% 

if exist %FILEPATH%%FILENAME% (
  echo "file exists"
) else (
  echo "file doesn't exist"
  echo "creating file..."
  (
    echo ---
    echo title="Daylog for %NOWMONTHNAME%, %NOWYEAR%"
    echo date="%NOWYEAR%-%NOWMONTH%"
    echo ---
  ) > %FILEPATH%%FILENAME%
)


:: START "" "%localappdata%\Programs\Microsoft VS Code\Code.exe" --goto "H:\Notes\notes.code-workspace" %FILEPATH%%FILENAME%:6

START "" obsidian://open?vault=Notes^&file=content\log\%FILENAME%

::move nul 2>&0
EXIT
