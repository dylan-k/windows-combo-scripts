
Network Settings for PCVR
================================================================================

For best connection, give the Oculus its own wifi connection to the PC. For this I use a network card, the Aorus GC-WBAX210. It is a Wifi6 card, for futureproofing.

Share the computer's hardwired internet connection to a mobile hotspot, and only connect the headset to that hotspot.

Important notes:

  - due to a bug: Before connecting the headset to hotspot/wifi, connect your phone to the hotspot, and then disconnect it, to get the network card running at full speed.
  - If there's intermittent latency, it's probably because Windows is searching for devices every minute or so. Use the script at `H:\Config\Scripts\vr-hotspot\Start_HotSpot_Quest2.ps1` to prevent this. (run as administrator)


Commands
-------------------------------------------------------------------------------

Powershell commands (do one at a time):


`netsh wlan show settings`

Note the name of the interface. Minw is "Wi-Fi 2"
Note whether it says "auto configuration logic is enabled"
If enabled, disable it thus:

`netsh wlan set autoconfig enabled=no interface="Wi-Fi 2"`


```powershell
$connectionProfile = [Windows.Networking.Connectivity.NetworkInformation,Windows.Networking.Connectivity,ContentType=WindowsRuntime]::GetInternetConnectionProfile()
$tetheringManager = [Windows.Networking.NetworkOperators.NetworkOperatorTetheringManager,Windows.Networking.NetworkOperators,ContentType=WindowsRuntime]::CreateFromConnectionProfile($connectionProfile)
 
Start-Sleep -Seconds 2
netsh wlan set autoconfig enabled=yes interface="Wi-Fi"

$tetheringManager.StartTetheringAsync()
Start-Sleep -Seconds 2

netsh wlan set autoconfig enabled=no interface="Wi-Fi"
```


## Wifi Card Device Properties

In Windows device manager, right click on the Aorus/Intel network adapter, choose advanced properties. Use these settings for best results:

```yaml
  a/b/g Wireless Mode:          1. 5GHz
  n/ac/ax Wireless Mode:        4. 802.11ax
  ARP offload:                  Enabled
  Channel Width for 2.4G:       Auto
  Channel WIdth for 5G:         Auto
  Fat Channel Intolerant:       Enabled
  Global BG Scan blocking:      Alwyays
  GTK rekeying:                 Enabled
  MIMO Power Save Mode:         No SMPS
  Mixed Mode Protection:        CTS-to-self Enabled
  NS offload for WoWLAN:        Enabled
  Packet Coalescing:            Enabled
  Preferred Band:               1. No Preference
  Roaming Aggressiveness:       1. Lowest
  Sleep on WoWLAN Disconnect:   Disabled
  Throughput Booster:           Enabled
  Transmit Power:               5. Highest
  U-SPSD support:               Disabled
  Wake on Magic Packet:         Enabled
  Wake on Pattern MAtch:        Enabled
```

source: <https://www.youtube.com/watch?v=_vnfA4FKs88>
