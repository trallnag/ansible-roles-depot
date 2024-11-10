Set-StrictMode -Version Latest

#
# Set variables.
#

$shortcutName = "Kleopatra"
$executablePath = "C:\Program Files (x86)\Gpg4win\bin\kleopatra.exe"
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
$shortcut.Arguments = "--daemon"
$shortcut.WindowStyle = 7

$shortcut.Save()

#
# Hide the shortcut.
#

attrib +h $shortcutPath

#
# Start if not already running.
#

$process = Get-Process -Name kleopatra -ErrorAction SilentlyContinue

if (-not $process) {
    Start-Process `
        -WindowStyle Hidden `
        -FilePath $executablePath `
        -ArgumentList "--daemon"
}
