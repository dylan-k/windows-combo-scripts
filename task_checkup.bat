::-----------------------------------------------------------------------------
:Upgrade Applications
:: Automate some system checkups
::-----------------------------------------------------------------------------
@::!/dos/rocks

DISM /Online /Cleanup-image /Restorehealth
DISM /Online /Cleanup-image /startcomponentcleanup
sfc /scannow
wuauclt /detectnow /updatenow

:: EXIT
