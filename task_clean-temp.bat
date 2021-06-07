::-----------------------------------------------------------------------------
:Do a Windows Temp File Cleanup
:: Windows has too many places for temp files. Clean them all!
::-----------------------------------------------------------------------------
@ECHO OFF

DEL /S /Q "%TMP%\*.*"
DEL /S /Q "%TEMP%\*.*"
DEL /S /Q "%WINDIR%\Temp\*.*"
DEL /S /Q "%USERPROFILE%\Local Settings\Temp\*.*"
DEL /S /Q "%USERPROFILE%\Appdata\Local\BraveSoftware\Brave-Browser\User Data\Default\Cache"
DEL /S /Q "%LocalAppData%\Temp"

DEL /S /Q "C:\Program Files (x86)\Google\Temp"
DEL /S /Q "C:\Program Files (x86)\Steam\steamapps\temp"
DEL /S /Q "U:\Games\steamapps\temp"
DEL /S /Q "C:\ProgramData\Microsoft\Windows\WER\Temp"
DEL /S /Q "C:\Users\All Users\Microsoft\Windows\WER\Temp"
DEL /S /Q "C:\Windows\Temp"
DEL /S /Q "C:\Windows\System32\DriverStore\Temp"
DEL /S /Q "C:\Windows\WinSxS\Temp"

cleanmgr /VERYLOWDISK /sagerun:0
ipconfig /flushdns

EXIT
