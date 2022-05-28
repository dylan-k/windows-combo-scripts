::-----------------------------------------------------------------------------
:Start each day with some setup
:: Open Outlook, Notes, Todo and otherwise prep for a workday.
:: Has a Scheduled Task set to run every day at 8am
:: On weekend mornings, option for different routine
::-----------------------------------------------------------------------------

::@echo off

FOR /F "TOKENS=1,* DELIMS==" %%v IN ('WMIC Path Win32_LocalTime Get /FORMAT:VALUE') DO IF "%%v" == "DayOfWeek" SET DayOfWeek=%%w

SET "hour=%time:~-11,2%"

:: Sunday
IF %DayOfWeek% == 0 ( GOTO DAYOFF )
:: Monday
IF %DayOfWeek% == 1 ( GOTO WORKDAY )
:: Tuesday
IF %DayOfWeek% == 2 ( GOTO WORKDAY )
:: Wednesday
IF %DayOfWeek% == 3 ( GOTO WORKDAY )
:: Thursday
IF %DayOfWeek% == 4 ( GOTO WORKDAY )
:: Friday
IF %DayOfWeek% == 5 ( GOTO WORKDAY )
:: Saturday
IF %DayOfWeek% == 6 ( GOTO DAYOFF )

:: Functions
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:WORKDAY
    ECHO Hello there.
    ECHO It's day number %DayOfWeek% this week.
    ECHO It's a WORKDAY.
    ECHO It's hour number %hour% today.

    IF %hour% GEQ 6 IF %hour% LEQ 17 (
        start /wait H:\Config\Scripts\launch_outlook.bat
        start /wait H:\Config\Scripts\space_worknotes.bat
        @REM if closed, open Todoist
        wmic process where "name='Todoist.exe'" get ProcessID | find /i "ProcessId" > nul || (START "Todoist"  /D "C:\Users\Dylan\AppData\Local\Programs\todoist\" Todoist.exe)
        GOTO End
    ) ELSE (
        ECHO quittin' time
      )
    GOTO END

:DAYOFF

  ECHO It's the weekend.
  ECHO Today is day number %DayOfWeek% this week.
  start /wait H:\Config\Scripts\space_notes.bat
  @REM if closed, open Todoist
  wmic process where "name='Todoist.exe'" get ProcessID | find /i "ProcessId" > nul || (START "Todoist"  /D "C:\Users\Dylan\AppData\Local\Programs\todoist\" Todoist.exe)
  GOTO End

:END

:: now restart explorer in case anything hangs
taskkill /im explorer.exe /f
start explorer.exe

: minimize all the things
START "" "H:\Config\Scripts\show-desktop.vbs"

::EXIT
