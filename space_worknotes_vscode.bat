::-----------------------------------------------------------------------------
:Daily Notes
:: Make a file with current date (yyyy-mm-daylog.txt) as filename
:: useful for "new note" or "new journal" task
::-----------------------------------------------------------------------------
:: @echo off


:: get the date's year, month number, and month name
set NOWYEAR=%date:~10,4%
set NOWMONTH=%date:~4,2%
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


:: filename using year and month numbers
set FILEROOT=H:\Notes\
set FILEPATH=H:\Notes\log\
set FILENAME=%NOWYEAR%-%NOWMONTH%.md

cd /d %FILEROOT%

:: create the file, if it does not yet exist
if exist %FILEPATH%%FILENAME% (
  echo "file exists at %FILENAME%"
) else (
  echo "file doesn't exist. making it..."
  (
  echo ---
  echo title: "Log for %NOWMONTHNAME%, %NOWYEAR%"
  echo date: %NOWYEAR%-%NOWMONTH%
  echo tags: log, periodic, periodic/monthly
  echo ---
  )>%FILEPATH%%FILENAME%
)




::move nul 2>&0
EXIT
