$Env:__SuppressAnsiEscapeSequences = "1"
$Env:NO_COLOR = "1"
$Env:TERM = "dumb"
$ErrorActionPreference = "Stop"
Set-StrictMode -Version Latest

#
# Set variables.
#

$shortcutName = "GPG Agent"
$executablePath = "C:\Program Files (x86)\GnuPG\bin\gpg-connect-agent.exe"
$startupPath = [System.Environment]::GetFolderPath("Startup")
$shortcutPath = [System.IO.Path]::Combine($startupPath, $shortcutName)
$shortcutPath += ".lnk"

#
# Remove existing shortcut.
#

if (Test-Path $shortcutPath) {
    Remove-Item $shortcutPath -Force
}

#
# Create new shortcut.
#

$WScriptShell = New-Object -ComObject WScript.Shell

$shortcut = $WScriptShell.CreateShortcut($shortcutPath)
$shortcut.TargetPath = $executablePath
$shortcut.Arguments = "/bye"
$shortcut.WindowStyle = 7

$shortcut.Save()

#
# Start if not already running.
#

$process = Get-Process -Name gpg-agent -ErrorAction SilentlyContinue

if (-not $process) {
    Start-Process `
        -WindowStyle Hidden `
        -FilePath $executablePath `
        -ArgumentList "/bye"
}
