net start ClickToRunSvc
cd "C:\Program Files\Microsoft Office\root\Office16\" 
WINWORD.EXE
taskkill /f /im officeclicktorun.exe
taskkill /f /im osppsvc.exe
net stop ClickToRunSvcnet
EXIT
