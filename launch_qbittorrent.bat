::------------------------------------------------------------------------------
:Launch qBittorrent with Jackett
:: author: @dylan-k
::------------------------------------------------------------------------------
@ECHO OFF

:: if closed, open qBittorrent
wmic process where "name='qbittorrent.exe'" get ProcessID | find /i "ProcessId" > nul || (START "qBittorrent" /D "C:\Users\dylan\scoop\apps\qbittorrent\current" qbittorrent.exe)

:: if closed, open JackettTray
wmic process where "name='JackettConsole.exe'" get ProcessID | find /i "ProcessId" > nul || (START "Jackett" /D "C:\Users\dylan\scoop\apps\jackett\current" JackettTray.exe)

EXIT
