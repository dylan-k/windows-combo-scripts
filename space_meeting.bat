::-----------------------------------------------------------------------------
:Meeting Space
:: Setup what's needed for a meeting: video, notes, etc.
::-----------------------------------------------------------------------------
@ECHO OFF

:: now the webcam app
wmic process where "name='XSplitVCam.exe'" get ProcessID | find /i "ProcessId" > nul || (START "Xsplit Vcam" /D "C:\Program Files\XSplit\VCam\x64\" XSplitVCam.exe)

:: run outlook and accessories
start /wait  H:\Config\Scripts\launch_outlook.bat

timeout 10

: minimize all the things
: source: https://stackoverflow.com/questions/53011931/call-scf-item-from-command-prompt
START "" "H:\Config\Scripts\show-desktop.vbs"

:: take notes
start /wait H:\Config\Scripts\write_daylog.bat

:: now zoom
wmic process where "name='Zoom.exe'" get ProcessID | find /i "ProcessId" > nul || (START "Zoom" /D "C:\Program Files\Zoom\bin\" Zoom.exe)

:: TODO
:: set microphone (wired) and sound (bluetooth) for a meeting
:: http://www.microsoftnow.com/2013/05/creating-a-shortcut-to-change-the-default-audio-device-in-windows.html

EXIT 
