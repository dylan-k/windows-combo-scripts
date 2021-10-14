# -----------------------------------------------------------------------------
# Kill all Running Apps
# Quits all Applications (except for explorer and anything tray-minimized)
# source: https://stackoverflow.com/questions/9725629/
# -----------------------------------------------------------------------------

(New-Object -comObject Shell.Application).Windows() | foreach-object { $_.quit() };
Get-Process | Where-Object { $_.MainWindowTitle -ne "" } | stop-process;

Function Stop-UserProcesses {
  Param([string]$Computer = "localhost")
  $Cred = Get-Credential
  Invoke-Command -ComputerName $Computer -Credential $Cred -ScriptBlock { 
    #Get all processes
    $Processes = get-wmiobject win32_process | Where { ![string]::IsNullOrEmpty($_.commandline) } | Select *, @{l = 'Owner'; e = { $_.getowner().user } }
    #Filter out System and service processes
    $Processes = $Processes | Where { !($_.Owner -match "(?:SYSTEM|(?:LOCAL|NETWORK) SERVICE)") }
    #Get processes and filter on the Process ID and name = explorer, then pipe to stop-process
    Get-Process | Where { $Processes.ProcessID -contains $_.id -and $_.name -ne "explorer" } | Stop-Process
  }
}
Stop-UserProcesses;



stop-process powershell;


# comment
