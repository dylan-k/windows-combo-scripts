::-----------------------------------------------------------------------------
:backup using rsync for windows
:: requires rsync, installed rsync using ``choco install rsync'
::-----------------------------------------------------------------------------

:: Settings
@echo off
set RSYNC_OPTIONS=--verbose --recursive --times --update --exclude='.git/' --cvs-exclude --progress --info=ALL --stats --ignore-errors
set LOG_DIR=/cygdrive/u/logs
set TIMESTAMP=%date:~-4%-%date:~4,2%-%date:~7,2%_%time:~0,2%-%time:~3,2%

:: robocopy example for specific applications
robocopy "C:\Program Files (x86)\MusicBee" "H:\Config\AppConfigs\MusicBee\musicbee-programfiles" /E /MIR

:: Important Files
:: -----------------------------------------------------------------------------

:: User Folder
rsync %RSYNC_OPTIONS% /cygdrive/c/Users/dylan/ /cygdrive/u/backup-user/ --log-file=%LOG_DIR%/backup-user-%TIMESTAMP%.log

:: Documents
rsync %RSYNC_OPTIONS% /cygdrive/h/documents/ /cygdrive/u/backup-documents/ --log-file=%LOG_DIR%/backup-documents-%TIMESTAMP%.log

:: Sites
rsync %RSYNC_OPTIONS% /cygdrive/h/sites/ /cygdrive/u/backup-sites/ --log-file=%LOG_DIR%/backup-sites-%TIMESTAMP%.log

:: Creative
rsync %RSYNC_OPTIONS% /cygdrive/h/creative/ /cygdrive/u/backup-creative/ --log-file=%LOG_DIR%/backup-creative-%TIMESTAMP%.log

:: Projects
rsync %RSYNC_OPTIONS% /cygdrive/h/projects/ /cygdrive/u/backup-projects/ --log-file=%LOG_DIR%/backup-projects-%TIMESTAMP%.log

:: Notes
rsync %RSYNC_OPTIONS% /cygdrive/h/notes/ /cygdrive/u/backup-notes/ --log-file=%LOG_DIR%/backup-notes-%TIMESTAMP%.log

:: Configs
rsync %RSYNC_OPTIONS% /cygdrive/h/config/ /cygdrive/u/backup-config/ --log-file=%LOG_DIR%/backup-config-%TIMESTAMP%.log

:: Pictures
rsync %RSYNC_OPTIONS% --exclude='Lightroom/' /cygdrive/m/pictures/ /cygdrive/u/backup-pictures/ --log-file=%LOG_DIR%/backup-pictures-%TIMESTAMP%.log

:: Pictures: Scans
rsync %RSYNC_OPTIONS% --exclude='Lightroom/' /cygdrive/m/Scans/ /cygdrive/u/backup-scans/ --log-file=%LOG_DIR%/backup-scans-%TIMESTAMP%.log

:: Music (uses --delete)
:: rsync %RSYNC_OPTIONS% --ignore-existing --delete /cygdrive/m/music/ /cygdrive/u/backup-music/ --log-file=%LOG_DIR%/backup-music-%TIMESTAMP%.log

EXIT
