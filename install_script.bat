@echo off
# Define the PowerShell version
$PSVersion = Get-Host | Select-Object Version
if ($PSVersion.Version.Major -lt 5) {
    Write-Host "This version of PowerShell is not supported. Please update to PowerShell 5 or higher."
    Exit
}

# Check network connectivity
$WebClient = New-Object System.Net.WebClient
$Connectivity = $WebClient.DownloadString("http://www.msftncsi.com/ncsi.txt")
if ($Connectivity -ne "Microsoft NCSI") {
    Write-Host "No network connection detected. Please check your network settings and try again."
    Exit
}

# Define the working directory
$WorkDirectory = "$env:USERPROFILE\Downloads"

# Update Windows
Write-Host "Checking for Windows updates..."
$Updates = Get-WindowsUpdate -MaxUpdates 50
if ($Updates.Count -gt 0) {
    Write-Host "Downloading and installing $($Updates.Count) Windows updates..."
    Install-WindowsUpdate -AcceptAll -IgnoreReboot
}

# Define the packages to be installed
$Packages = @(
    "adobereader",
    "googlechrome",
    "jre8",
    "7zip.install",
    "microsoft-windows-terminal",
    "onlyoffice",
    "curl",
    "spotify",
    "amd-ryzen-chipset",
    "nvidia-display-driver",
    "qbittorrent",
    "openvpn",
    "steam",
    "discord",
    "bitwarden",
    "msvisualcplusplus2013-redist",
    "origin",
    "epicgameslauncher",
    "leagueoflegends",
    "teamspeak"
)

# Install Chocolatey if not installed yet
if (!(Get-Command choco -ErrorAction SilentlyContinue)) {
    Write-Host "Chocolatey was not found. Installing Chocolatey..."
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

# Install packages
foreach ($Package in $Packages) {
    Write-Host "Installing package $Package..."
    if ($Package -eq "nvidia-display-driver") {
        choco install --confirm $Package -y --no-restart
    } else {
        choco install --confirm $Package -y
    }
}

# Install Chocolatey Cleaner for cleanup
Write-Host "Installing Chocolatey Cleaner..."
choco install --confirm chocolatey-cleaner -y

# Clean Chocolatey cache
Write-Host "Cleaning Chocolatey cache..."
choco-cleaner -s

# Clean PowerShell history
Write-Host "Cleaning PowerShell history..."
Clear-History -CommandId * -ErrorAction SilentlyContinue

Write-Host "The script has been executed successfully."
