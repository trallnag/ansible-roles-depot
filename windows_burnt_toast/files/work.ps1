param(
    [Parameter(Mandatory=$true)]
    [string]$IconPath
)

Set-StrictMode -Version Latest

if (-not (Test-Path -Path $IconPath -PathType Leaf)) {
    Write-Error "Given IconPath does not point to a file: `"$IconPath`"."
    exit 1
}

#
# Install the BurntToast module.
#

function Install-BurntToastModule {
    $moduleName = "BurntToast"
    $moduleVersion = "0.8.5"

    $module = Get-InstalledModule -Name $moduleName -ErrorAction SilentlyContinue

    if ($module -eq $null) {
        Install-Module `
            -Name $moduleName `
            -RequiredVersion $moduleVersion `
            -Scope CurrentUser
        Write-Output status=changed
    }
    elseif ($module.Version -ne $moduleVersion) {
        Uninstall-Module -Name $moduleName -AllVersions
        Install-Module `
            -Name $moduleName `
            -RequiredVersion $moduleVersion `
            -Scope CurrentUser
        Write-Output status=changed
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
    param(
        [Parameter(Mandatory = $true)]
        $AppID,

        [Parameter(Mandatory = $true)]
        $AppDisplayName,

        [Parameter(Mandatory = $false)]
        [int]$ShowInSettings = 0,

        [Parameter(Mandatory = $false)]
        $IconPath
    )

    $currentUserRegPath = "HKCU:\Software\Classes\AppUserModelId"

    if (!(Test-Path $currentUserRegPath)) {
        New-Item -Path $currentUserRegPath -Force
    }

    $regPath = Join-Path -Path $currentUserRegPath -ChildPath $AppID

    if (!(Test-Path $regPath)) {
        New-Item -Path $currentUserRegPath -Name $AppID -Force
    }

    $displayName = (Get-ItemProperty `
        -Path $regPath `
        -Name DisplayName `
        -ErrorAction SilentlyContinue
    ).DisplayName

    if ($displayName -ne $AppDisplayName) {
        New-ItemProperty `
            -Path $regPath `
            -Name DisplayName `
            -Value $AppDisplayName `
            -PropertyType String `
            -Force
    }

    $showInSettingsValue = (Get-ItemProperty `
        -Path $regPath `
        -Name ShowInSettings `
        -ErrorAction SilentlyContinue
    ).ShowInSettings

    if ($showInSettingsValue -ne $ShowInSettings) {
        New-ItemProperty `
            -Path $regPath `
            -Name ShowInSettings `
            -Value $ShowInSettings `
            -PropertyType DWORD `
            -Force
    }

    if ($IconPath -and (Test-Path $IconPath -PathType Leaf)) {
        New-ItemProperty `
            -Path $regPath `
            -Name IconUri `
            -Value $IconPath `
            -PropertyType String `
            -Force
    }
}

Register-NotificationApp `
    -AppID Trallnag.Toast `
    -AppDisplayName "Trallnag Toast" `
    -ShowInSettings 1 `
    -IconPath $IconPath
