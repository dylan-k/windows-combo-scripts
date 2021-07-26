:------------------------------------------------------------------------------
:Kill Adobe Crapware Processes
: Developed by :- krishna247india
: Download URL :- https://github.com/krishna247india/AdobeKiller.git
: See Also     :- https://gist.github.com/carcheky/530fd85ffff6719486038542a8b5b997
:------------------------------------------------------------------------------
@echo off
net session >nul 2>&1
    if %errorLevel% == 0 (
        echo.
    ) else (
        GOTO :NoAdmin
    )
TASKKILL /F /IM "Creative Cloud.exe" /T
TASKKILL /F /IM "AcroRd32.exe" /T
TASKKILL /F /IM "AdobeARM.exe" /T
TASKKILL /F /IM "Adobe Desktop Service.exe" /T
TASKKILL /F /IM "Adobe CEF Helper.exe" /T
TASKKILL /F /IM "Adobe Installer.exe" /T
TASKKILL /F /IM "AdobeUpdateService.exe" /T
TASKKILL /F /IM "CoreSync.exe" /T
TASKKILL /F /IM "AdobeIPCBroker.exe" /T
TASKKILL /F /IM "Adobe Installer.exe" /T
TASKKILL /F /IM "CCLibrary.exe" /T
TASKKILL /F /IM "AdobeNotificationClient.exe" /T
TASKKILL /F /IM "RuntimeBroker.exe" /T
TASKKILL /F /IM "AdobeIPCBroker.exe" /T
TASKKILL /F /IM "AdobeUpdateService.exe" /T
TASKKILL /F /IM "CCXProcess.exe" /T
TASKKILL /F /IM "backgroundTaskHost.exe" /T
TASKKILL /F /IM "AGSService.exe" /T
TASKKILL /F /IM "AGMService.exe" /T
TASKKILL /F /IM "LogTransport2.exe" /T
TASKKILL /F /IM "AdobeGCClient.exe" /T
TASKKILL /F /IM "acrotray.exe" /T
TASKKILL /F /IM "AcrobatNotificationClient.exe" /T
TASKKILL /F /IM "AdobeCollabSync.exe" /T
TASKKILL /F /IM "AcroTray.exe" /T
TASKKILL /F /IM "AdobeExtensionsService.exe" /T
net stop AdobeARMService
net stop AdobeUpdateService
net stop AGMService
net stop AGSService
net stop CoreSync
net stop AdobeIPCBroker
net stop Adobe CEF Helper


EXIT

:: ECHO|SET /p =" -       Press any key to exit ..."
:: Pause >NUL
:: goto :eof
:: :NoAdmin
:: ECHO.
:: ECHO"  - You must run this script in Administrator mode"
:: ECHO.
:: ECHO.
:: ECHO.
:: ECHO|SET /p =" -       Press any key to exit ..."
:: Pause >NUL
:: ECHO   GoodBye
:: ECHO.
:: ECHO.
