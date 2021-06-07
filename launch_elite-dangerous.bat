::-----------------------------------------------------------------------------
:Launch Elite Dangerous, and Supporting Apps
:: author: @dylan-k
:: See Also     :- https://gist.github.com/carcheky/530fd85ffff6719486038542a8b5b997
::-----------------------------------------------------------------------------

@ECHO OFF

: minimize all the things
START "" "H:\Config\Scripts\show-desktop.vbs"

: start some utility apps
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

START "EDMC Elite Dangerous Market Connector" /D "M:\Games\Elite Dangerous\market-connector-EDMC\" EDMarketConnector.exe
timeout 10

START "Elite Discovery" /D "C:\Program Files\EDDiscovery" EDDiscovery.exe

START "Voice Attack" /D "C:\Program Files (x86)\Steam\steamapps\common\VoiceAttack\" VoiceAttack.exe
timeout 10

START "Elite G19s" /D "C:\Users\Dylan\AppData\Local\Programs\EliteG19s\" EliteG19s.Windows.exe


START "First Contact" /D "C:\Program Files (x86)\Sidsoft\FirstContact\" FirstContact.exe
timeout 5

START "Elite Observatory" /D "C:\Users\Dylan\AppData\Local\Elite Observatory\" Observatory.exe
timeout 5


:: START "Elite Scout" /D "M:\Games\Elite Dangerous\Elite Dangerous Scout" EDScout.exe
:: timeout 5

: start the game
: START "" "C:\Program Files (x86)\Steam\Steam.exe" -applaunch 359320
START steam://rungameid/359320

: ok now open some web apps
START "" "C:\Users\Dylan\AppData\Local\BraveSoftware\Brave-Browser\Application\brave.exe" --new-window^
 https://eddb.io/trade/single^
 https://eddb.io/trade/loops

EXIT
