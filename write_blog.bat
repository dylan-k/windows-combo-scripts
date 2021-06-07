::-----------------------------------------------------------------------------
:BLOG 
:: Quickly make a new blog post and get writing
::-----------------------------------------------------------------------------
@echo off


:: SETUP VARIABLES
:: ============================================================================

:: full path to blog
:: no trailing slash!
set root=H:\Sites\nocategories
set path=H:\Sites\nocategories\content\posts

:: get the date
set nowyear=%date:~10,4%
set nowmonth=%date:~4,2%
set nowday=%date:~7,2%

:: get the time
set CUR_HH=%time:~0,2%
if %CUR_HH% lss 10 (set CUR_HH=0%time:~1,1%)
set CUR_NN=%time:~3,2%
set CUR_SS=%time:~6,2%
set CUR_MS=%time:~9,2%


:: SETUP THE FILE
:: ============================================================================

:: Include format yyyy-mm-dd in file name
:: add the time to prevent overwrites (optional)
set file=%nowyear%-%nowmonth%-%nowday%_%CUR_HH%%CUR_NN%%CUR_SS%.md

cd %root%
C:\ProgramData\chocolatey\bin\hugo.exe new posts/%file%


:: LAUNCH
:: ============================================================================

:: open it up to start writing in vscode (ubuntu)
:: code --remote wsl+Ubuntu /mnt/e/Sites/nocategories /mnt/e/Sites/nocategories/:: README.md /mnt/e/Sites/nocategories/_posts/%file%

:: open to write in vscode (windows) %root%\README.md 
start "" "C:\Program Files\Microsoft VS Code\Code.exe" %root%\nocategories.code-workspace
start "" "C:\Program Files\Microsoft VS Code\Code.exe" --reuse-window %root%\README.md
start "" "C:\Program Files\Microsoft VS Code\Code.exe" --reuse-window --goto %path%\%file%:10
