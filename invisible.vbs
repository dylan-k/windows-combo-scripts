'--------------------------------------------------------------
' Script Name: invisible.vbs
' Description: This script runs a specified command or script
'              without displaying a window.
'
' Example Usage:
'   wscript.exe "invisible.vbs" "notepad.exe"
'   wscript.exe "invisible.vbs" "launch_outlook.bat"
'
' The first example runs Notepad without showing a window.
' The third example runs a launcher script (launch_outlook.bat) invisibly.
'--------------------------------------------------------------

CreateObject("Wscript.Shell").Run """" & WScript.Arguments(0) & """", 0, False
