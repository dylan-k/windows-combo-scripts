::-----------------------------------------------------------------------------
:backup using rsync for windows
:: requires rsync, installed rsync using ``choco install rsync'
::-----------------------------------------------------------------------------

:: @echo off

::user folder
rsync --archive --verbose --exclude='.git/' --cvs-exclude --info=ALL /cygdrive/c/Users/dylan/ /cygdrive/u/backup-user/ --log-file=/cygdrive/u/backup-user.log

:: documents
rsync --archive --verbose --exclude='.git/' --cvs-exclude --info=ALL /cygdrive/h/documents/ /cygdrive/u/backup-documents/ --log-file=/cygdrive/u/backup-documents.log

:: sites
rsync --archive --verbose --exclude='.git/' --cvs-exclude --info=ALL /cygdrive/h/sites/ /cygdrive/u/backup-sites/ --log-file=/cygdrive/u/backup-sites.log

:: creative
rsync --archive --verbose --exclude='.git/' --cvs-exclude --info=ALL /cygdrive/h/creative/ /cygdrive/u/backup-creative/ --log-file=/cygdrive/u/backup-creative.log

:: projects
rsync --archive --verbose --exclude='.git/' --cvs-exclude --info=ALL /cygdrive/h/projects/ /cygdrive/u/backup-projects/ --log-file=/cygdrive/u/backup-projects.log

:: notes
rsync --archive --verbose --exclude='.git/' --cvs-exclude --info=ALL /cygdrive/h/notes/ /cygdrive/u/backup-notes/ --log-file=/cygdrive/u/backup-notes.log

:: configs
rsync --archive --verbose --exclude='.git/' --cvs-exclude --info=ALL /cygdrive/h/config/ /cygdrive/u/backup-config/ --log-file=/cygdrive/u/backup-config.log

:: pictures
rsync --archive --verbose --exclude='Lightroom/' --cvs-exclude --info=ALL /cygdrive/m/pictures/ /cygdrive/u/backup-pictures/ --log-file=/cygdrive/u/backup-pictures.log

:: pictures
rsync --archive --verbose --cvs-exclude --info=ALL /cygdrive/m/scans/ /cygdrive/u/backup-scans/ --log-file=/cygdrive/u/backup-scans.log

:: music
rsync --archive --verbose --exclude='.git/' --cvs-exclude --info=ALL /cygdrive/m/music/ /cygdrive/u/backup-music/ --log-file=/cygdrive/u/backup-music.log

EXIT 
