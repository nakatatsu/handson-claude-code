# WSLを再起動するスクリプト。起動例:
# powershell -ExecutionPolicy Bypass -File 02_restart_wsl.ps1

wsl --shutdown
wsl -e /bin/true
