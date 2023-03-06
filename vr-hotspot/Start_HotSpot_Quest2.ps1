# Declare variable for control the HotSpot
$connectionProfile = [Windows.Networking.Connectivity.NetworkInformation, Windows.Networking.Connectivity, ContentType = WindowsRuntime]::GetInternetConnectionProfile()
$tetheringManager = [Windows.Networking.NetworkOperators.NetworkOperatorTetheringManager, Windows.Networking.NetworkOperators, ContentType = WindowsRuntime]::CreateFromConnectionProfile($connectionProfile)

# Enable Scan (need it to enable HotSpot)
# To get the name of the wifi network, used below, do this:
# netsh wlan show settings
Start-Sleep -Seconds 2
netsh wlan set autoconfig enabled=yes interface="Wi-Fi 2"

# Start Mobile Hotspot
$tetheringManager.StartTetheringAsync()
Start-Sleep -Seconds 2

# Disable Scan (need it to remove latency when Windows do a scheduled network scan)
netsh wlan set autoconfig enabled=no interface="Wi-Fi 2"
