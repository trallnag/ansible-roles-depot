Set-StrictMode -Version Latest
cscs
if ((Get-PSRepository -Name PSGallery).InstallationPolicy -ne "Trusted") {
  Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
  Write-Output "status=changed"
}
