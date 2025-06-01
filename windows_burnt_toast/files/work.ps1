Set-StrictMode -Version Latest

#
# Install the BurntToast module.
#

function Install-BurntToastModule {
  $moduleName = "BurntToast"
  $moduleVersion = "0.8.5"

  $module = Get-InstalledModule -Name $moduleName -ErrorAction SilentlyContinue

  if ($module -eq $null) {
    Install-Module -Name $moduleName -RequiredVersion $moduleVersion -Scope CurrentUser
    Write-Output "status=changed"
  } elseif ($module.Version -ne $moduleVersion) {
    Uninstall-Module -Name $moduleName -AllVersions
    Install-Module -Name $moduleName -RequiredVersion $moduleVersion -Scope CurrentUser
    Write-Output "status=changed"
  }
}

Install-BurntToastModule

#
# Register notification app.
#
# Based on: https://github.com/Windos/BurntToast/issues/236.
#

function Register-NotificationApp {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$true)]
        $AppID,

        [Parameter(Mandatory=$true)]
        $AppDisplayName,

        [Parameter(Mandatory=$false)]
        [int]$ShowInSettings=0,

        [Parameter(Mandatory=$false)]
        $IconPath
    )

    $CurrentUserRegPath = "HKCU:\Software\Classes\AppUserModelId"
    if (!(Test-Path $CurrentUserRegPath)) {
        New-Item -Path $CurrentUserRegPath -Force
    }

    $RegPath = Join-Path -Path $CurrentUserRegPath -ChildPath $AppID
    if (!(Test-Path $RegPath)) {
        New-Item -Path $CurrentUserRegPath -Name $AppID -Force
    }

    $DisplayName = (Get-ItemProperty -Path $RegPath -Name DisplayName -ErrorAction SilentlyContinue).DisplayName
    if ($DisplayName -ne $AppDisplayName) {
        New-ItemProperty -Path $RegPath -Name DisplayName -Value $AppDisplayName -PropertyType String -Force
    }

    $ShowInSettingsValue = (Get-ItemProperty -Path $RegPath -Name ShowInSettings -ErrorAction SilentlyContinue).ShowInSettings
    if ($ShowInSettingsValue -ne $ShowInSettings) {
        New-ItemProperty -Path $RegPath -Name ShowInSettings -Value $ShowInSettings -PropertyType DWORD -Force
    }

    if ($IconPath -and (Test-Path $IconPath -PathType Leaf)) {
        New-ItemProperty -Path $RegPath -Name IconUri -Value $IconPath -PropertyType String -Force
    }
}

$iconPath = Get-Item -Path Env:\ICON_PATH

Register-NotificationApp `
    -AppID Trallnag.Toast `
    -AppDisplayName "Trallnag Toast" `
    -ShowInSettings 1 `
    -IconPath $iconPath
