Set-StrictMode -Version Latest

if ((Get-PSRepository -Name PSGallery).InstallationPolicy -ne "Trusted") {
  Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
  Write-Output "status=changed"
}
