::-----------------------------------------------------------------------------
:Daily Notes 
:: Make a file with current date (yyyy-mm-daylog.txt) as filename
:: useful for "new note" or "new journal" task
::-----------------------------------------------------------------------------
@echo off

@REM :: get the date
@REM set NOWYEAR=%date:~10,4%
@REM set NOWMONTH=%date:~4,2%
@REM set NOWDAY=%date:~6,2%

@REM :: set month name for the corresponding numbers

@REM if %NOWMONTH%==01 set NOWMONTHNAME=January
@REM if %NOWMONTH%==02 set NOWMONTHNAME=February
@REM if %NOWMONTH%==03 set NOWMONTHNAME=March
@REM if %NOWMONTH%==04 set NOWMONTHNAME=April
@REM if %NOWMONTH%==05 set NOWMONTHNAME=May
@REM if %NOWMONTH%==06 set NOWMONTHNAME=June
@REM if %NOWMONTH%==07 set NOWMONTHNAME=July
@REM if %NOWMONTH%==08 set NOWMONTHNAME=August
@REM if %NOWMONTH%==09 set NOWMONTHNAME=September
@REM if %NOWMONTH%==10 set NOWMONTHNAME=October
@REM if %NOWMONTH%==11 set NOWMONTHNAME=November
@REM if %NOWMONTH%==12 set NOWMONTHNAME=December

@REM :: Include format yyyy-mm in filename
@REM set FILEROOT=H:\Notes\
@REM set FILEPATH=H:\Notes\content\log\
@REM set FILENAME=%NOWYEAR%-%NOWMONTH%_DAYLOG.md

@REM echo "filename is %fileNAME%"
@REM cd /d %FILEROOT% 

@REM if exist %FILEPATH%%FILENAME% (
@REM   echo "file exists"
@REM ) else (
@REM   echo "file doesn't exist"
@REM   echo "creating file..."
@REM   (
@REM     echo ---
@REM     echo title="Daylog for %NOWMONTHNAME%, %NOWYEAR%"
@REM     echo date="%NOWYEAR%-%NOWMONTH%"
@REM     echo ---
@REM   ) > %FILEPATH%%FILENAME%
@REM )


@REM :: START "" "%localappdata%\Programs\Microsoft VS Code\Code.exe" --goto "H:\Notes\notes.code-workspace" %FILEPATH%%FILENAME%:6

@REM START "" obsidian://open?vault=Notes^&file=content\log\%FILENAME%
START "" obsidian://open?vault=notes
::move nul 2>&0
EXIT
