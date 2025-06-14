$Env:__SuppressAnsiEscapeSequences = "1"
$Env:NO_COLOR = "1"
$Env:TERM = "dumb"
$ErrorActionPreference = "Stop"
Set-StrictMode -Version Latest

if ((Get-PSRepository -Name PSGallery).InstallationPolicy -ne "Trusted") {
  Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
  Write-Output "status=changed"
}
