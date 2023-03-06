::-----------------------------------------------------------------------------
:backup using rsync for windows
:: requires rsync, installed rsync using ``choco install rsync'
::-----------------------------------------------------------------------------

:: @echo off

:: important settings
:: -----------------------------------------------------------------------------
:: robocopy "\\computerA\FolderA" "\\computerB\FolderB "/E /MIR

robocopy "C:\Program Files (x86)\MusicBee" "H:\Config\AppConfigs\MusicBee\musicbee-programfiles" /E /MIR


:: important files
:: -----------------------------------------------------------------------------

::user folder
:: rsync --verbose --recursive --update --exclude='.git/' --cvs-exclude --info=ALL --progress /cygdrive/c/Users/dylan/ /cygdrive/u/backup-user/ --log-file=/cygdrive/u/backup-user.log

:: documents
rsync --verbose --recursive --update --exclude='.git/' --cvs-exclude --info=ALL --progress /cygdrive/h/documents/ /cygdrive/u/backup-documents/ --log-file=/cygdrive/u/backup-documents.log

:: sites
rsync --verbose --recursive --update --exclude='.git/' --cvs-exclude --info=ALL --progress /cygdrive/h/sites/ /cygdrive/u/backup-sites/ --log-file=/cygdrive/u/backup-sites.log

:: creative
rsync --verbose --recursive --update --exclude='.git/' --cvs-exclude --info=ALL --progress /cygdrive/h/creative/ /cygdrive/u/backup-creative/ --log-file=/cygdrive/u/backup-creative.log

:: projects
rsync --verbose --recursive --update --exclude='.git/' --cvs-exclude --info=ALL --progress /cygdrive/h/projects/ /cygdrive/u/backup-projects/ --log-file=/cygdrive/u/backup-projects.log

:: notes
rsync --verbose --recursive --update --exclude='.git/' --cvs-exclude --info=ALL --progress /cygdrive/h/notes/ /cygdrive/u/backup-notes/ --log-file=/cygdrive/u/backup-notes.log

:: configs
rsync --verbose --recursive --update --exclude='.git/' --cvs-exclude --info=ALL --progress /cygdrive/h/config/ /cygdrive/u/backup-config/ --log-file=/cygdrive/u/backup-config.log

:: pictures
rsync --verbose --recursive --update --exclude='Lightroom/' --cvs-exclude --progress --info=ALL /cygdrive/m/pictures/ /cygdrive/u/backup-pictures/ --log-file=/cygdrive/u/backup-pictures.log

:: pictures: scans
rsync --verbose --recursive --update --exclude='Lightroom/' --cvs-exclude --progress --info=ALL /cygdrive/m/Scans/ /cygdrive/u/backup-scans/ --log-file=/cygdrive/u/backup-scans.log

:: music
:: rsync --verbose --recursive --ignore-existing --update  --delete --progress /cygdrive/m/music/ /cygdrive/u/backup-music/ --log-file=/cygdrive/u/backup-music.log





EXIT
