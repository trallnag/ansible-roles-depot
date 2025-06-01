Set-StrictMode -Version Latest

#
# Trust the PSGallery repository.
#

function Set-PSGalleryTrusted {
  if ((Get-PSRepository -Name PSGallery).InstallationPolicy -ne "Trusted") {
    Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
    Write-Output "status=changed"
  }
}

Set-PSGalleryTrusted


#
# Install the CompletionPredictor module.
#

function Install-CompletionPredictorModule {
  $moduleName = "CompletionPredictor"

  $module = Get-InstalledModule -Name $moduleName -ErrorAction SilentlyContinue

  if ($module -eq $null) {
    Install-Module -Name $moduleName
    Write-Output "status=changed"
  }
}

Install-CompletionPredictorModule
