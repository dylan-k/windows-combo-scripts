::-----------------------------------------------------------------------------
:Do a Windows checkup
:: all the crap windows support says to do as a reflex before they give up
::-----------------------------------------------------------------------------
@::!/dos/rocks

DISM /Online /Cleanup-Image /StartComponentCleanup
DISM /Online /Cleanup-Image /AnalyzeComponentStore
sfc /scannow
DISM /Online /Cleanup-Image /CheckHealth
DISM /Online /Cleanup-Image /ScanHealth
Dism /Online /Cleanup-Image /RestoreHealth

:: EXIT
