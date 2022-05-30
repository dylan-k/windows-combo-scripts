::-----------------------------------------------------------------------------
:Daily Notes
:: Make a file with current date (yyyy-mm-daylog.txt) as filename
:: useful for "new note" or "new journal" task
::-----------------------------------------------------------------------------
@echo off

@REM :: get the date
@REM set NOWYEAR=%date:~10,4%
@REM set NOWMONTH=%date:~4,2%
@REM :: Include format yyyy-mm in filename

:: TODO: file path is different for work notes now
@REM set FILEROOT=H:\WALTERS\notes-walters\
@REM set FILEPATH=H:\WALTERS\notes-walters\log\
@REM set FILENAME=%NOWYEAR%-%NOWMONTH%_DAYLOG.md

@REM echo "filename is %fileNAME%"
@REM cd /d %FILEROOT%

@REM if exist %FILEPATH%%FILENAME% (
@REM   echo "file exists"
@REM   rem sed '5 a #This is just a commented line' %FILEPATH%%FILENAME%
@REM ) else (
@REM   echo "file doesn't exist"
@REM   hugo new log/%FILENAME%
@REM )


code H:\WALTERS\notes-walters\

:: START "" "%localappdata%\Programs\Microsoft VS Code\Code.exe" --goto "H:\Notes\notes.code-workspace" %FILEPATH%%FILENAME%:6

:: @REM START "" obsidian://open?vault=notes-walters^&file=content\log\%FILENAME%

:: START "" obsidian://open?vault=notes-walters

:: open VSCode to the notes workspace
:: and open the file with cursor below the frontmatter(line 6)
:: code --goto %FILEROOT%/notes.code-workspace %FILEPATH%%FILENAME%:6

::move nul 2>&0
EXIT
