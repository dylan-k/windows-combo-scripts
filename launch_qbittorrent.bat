::------------------------------------------------------------------------------
:Launch qBittorrent with Jackett
:: author: @dylan-k
::------------------------------------------------------------------------------
@ECHO OFF

:: if closed, open qBittorrent
wmic process where "name='qbittorrent.exe'" get ProcessID | find /i "ProcessId" > nul || (START "qBittorrent" /D "C:\Program Files\qBittorrent\" qbittorrent.exe)

:: if closed, open JackettTray
wmic process where "name='JackettConsole.exe'" get ProcessID | find /i "ProcessId" > nul || (START "Jackett" /D "C:\Users\dylan\scoop\apps\jackett\0.22.820\" JackettTray.exe)

EXIT
