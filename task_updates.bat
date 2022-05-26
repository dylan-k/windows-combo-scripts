::-----------------------------------------------------------------------------
:Upgrade Applications
:: Automate as many upgrades as possible
::-----------------------------------------------------------------------------
@::!/dos/rocks

choco upgrade all
npm update -g
wuauclt /detectnow /updatenow

:: EXIT
