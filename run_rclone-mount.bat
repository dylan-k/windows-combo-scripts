@echo off
::-----------------------------------------------------------------------------
:RCLONE DRIVE MOUNTER
:: Mount some remote directories to local device
:: Run this at startup/login via task scheduler
::-----------------------------------------------------------------------------

start "" rclone mount --vfs-cache-mode writes OneDriveDeveloper:Config H:\Config --no-console
start "" rclone mount --vfs-cache-mode writes OneDriveDeveloper:Assets H:\Assets --no-console
