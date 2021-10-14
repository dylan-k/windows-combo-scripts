::-----------------------------------------------------------------------------
:Meeting Space
:: Setup what's needed for a meeting: video, notes, etc.
::-----------------------------------------------------------------------------
@ECHO OFF

:: take notes
wscript.exe "H:\Config\Scripts\invisible.vbs" ^
"H:\Config\Scripts\write_daylog.bat"

:: launch Xsplit
wmic process where "name='XSplitVCam.exe'" get ProcessID | find /i "ProcessId" > nul || (START "Zoom" /D "C:\Program Files\XSplit\VCam\x64\" XSplitVCam.exe)

:: run outlook and accessories
wscript.exe "H:\Config\Scripts\invisible.vbs" ^
"H:\Config\Scripts\launch_outlook.bat"

:: ECHO Setting White Background...
:: reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v WallPaper /t REG_SZ /d "" /f
:: reg add "HKEY_CURRENT_USER\Control Panel\Colors" /v Background /t REG_SZ /d "255 255 255" /f
:: RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters

:: wait because Obsidian is slow to start
TIMEOUT /T 5 /NOBREAK

:: minimize everything
wscript.exe "H:\Config\Scripts\show-desktop.vbs"

:: now zoom
wmic process where "name='Zoom.exe'" get ProcessID | find /i "ProcessId" > nul || (START "Zoom" /D "C:\Program Files\Zoom\bin\" Zoom.exe)

:: TODO
:: set microphone (wired) and sound (bluetooth) for a meeting
:: http://www.microsoftnow.com/2013/05/creating-a-shortcut-to-change-the-default-audio-device-in-windows.html

EXIT
