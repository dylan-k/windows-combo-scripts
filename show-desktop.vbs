'--------------------------------------------------------------
' Script Name: show-desktop.vbs
' Description: This script minimizes all open windows, effectively
'              showing the desktop. It is useful for hiding/minimizing
'              all windows before launching a workspace or other tasks.
'
' Example Usage (at command line or as an include within a script):
'   wscript.exe "show-desktop.vbs"
'
' This example runs the script to minimize all open windows and show the desktop.
' source: https://stackoverflow.com/questions/53011931/
'--------------------------------------------------------------

set objShell = CreateObject("shell.application")
    objShell.ToggleDesktop
set objShell = nothing
