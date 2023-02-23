@echo of

Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

choco install --confirm adobereader
choco install --confirm googlechrome
choco install --confirm flashplayerplugin
choco install --confirm jre8
choco install --confirm 7zip.install
choco install --confirm microsoft-windows-terminal
choco install --confirm onlyoffice
choco install --confirm curl
choco install --confirm spotify
choco install --confirm amd-ryzen-chipset
choco install --confirm nvidia-display-driver
choco install --confirm qbittorrent
choco install --confirm openvpn
choco install --confirm steam
choco install --confirm discord
choco install --confirm bitwarden
choco install --confirm directx
choco install --confirm msvisualcplusplus2013-redist
choco install --confirm origin
choco install --confirm epicgameslauncher
choco install --confirm leagueoflegends

choco install --confirm teamspeak

choco install --confirm choco-cleaner
Choco-Cleaner

