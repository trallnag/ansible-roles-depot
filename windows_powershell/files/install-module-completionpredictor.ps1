Set-StrictMode -Version Latest

$moduleName = "CompletionPredictor"

$module = Get-InstalledModule -Name $moduleName -ErrorAction SilentlyContinue

if ($module -eq $null) {
  Install-Module -Name $moduleName -Repository PSGallery
  Write-Output "status=changed"
}
