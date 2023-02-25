@echo off
title Installing software with Chocolatey

REM Install Chocolatey if it's not already installed
if not exist %systemdrive%\chocolatey (
    echo Installing Chocolatey...
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
)

REM Install packages with Chocolatey
echo Installing packages...
for %%p in (
    adobereader
    googlechrome
    flashplayerplugin
    jre8
    7zip.install
    microsoft-windows-terminal
    onlyoffice
    curl
    spotify
    amd-ryzen-chipset
    nvidia-display-driver
    qbittorrent
    openvpn
    steam
    discord
    bitwarden
    directx
    msvisualcplusplus2013-redist
    origin
    epicgameslauncher
    leagueoflegends
    teamspeak
    choco-cleaner
) do choco install --confirm %%p

Choco-Cleaner

echo Installation completed.
