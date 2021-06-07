::-----------------------------------------------------------------------------
:Launch Outlook and Calendar Sync
:: author: @dylan-k
:: See Also: https://github.com/phw198/OutlookGoogleCalendarSync
::-----------------------------------------------------------------------------

@ECHO OFF

:: if closed, open Outlook
wmic process where "name='OUTLOOK.EXE'" get ProcessID | find /i "ProcessId" > nul || (START /max "Microsoft Outlook" /D "C:\Program Files (x86)\Microsoft Office\root\Office16\" OUTLOOK.EXE /recycle)

:: if closed, open Calendar Sync
wmic process where "name='OutlookGoogleCalendarSync.exe'" get ProcessID | find /i "ProcessId" > nul || (START "Outlook Google Calendar Sync"  /D "C:\Users\Dylan\AppData\Local\OutlookGoogleCalendarSync\" OutlookGoogleCalendarSync.exe)

EXIT 
