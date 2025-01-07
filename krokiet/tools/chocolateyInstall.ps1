$ErrorActionPreference = 'Stop'

$packageToolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$toolsDir = Get-ToolsLocation

$installPath = Join-Path $toolsDir 'krokiet'
$binPath = Join-Path $installPath 'krokiet.exe'
$iconPath = Join-Path $packageToolsDir 'icon_about.ico'

$desktopShortcutPath = "$($ENV:PUBLIC)\Desktop\Krokiet.lnk"
$startmenuShortcutPath = "$($ENV:ProgramData)\Microsoft\Windows\Start Menu\Programs\Krokiet.lnk"

$url64 = 'https://github.com/qarmin/czkawka/releases/download/8.0.0/windows_krokiet_gui_winversion.exe'
$checksum64 = 'af2d3672ac86d2c5b9a56caacdd1e39fd721f91925b2e111d1d3fc7ab4562fb4'
$checksumType64 = 'sha256'

# Ensure the installation path exists
if (-not (Test-Path -Path $installPath)) {
    New-Item -ItemType Directory -Force -Path $installPath | Out-Null
}

# Download the .exe file directly to the install path
Get-ChocolateyWebFile -PackageName krokiet -Url64bit $url64 -Checksum64 $checksum64 -ChecksumType64 $checksumType64 -FileFullPath $binPath

$shortcutArgs = @{
    targetPath       = $binPath
    workingDirectory = $installPath
    iconLocation     = $iconPath
    windowStyle      = '1'
}

Install-ChocolateyShortcut @shortcutArgs -ShortcutFilePath $desktopShortcutPath
Install-ChocolateyShortcut @shortcutArgs -ShortcutFilePath $startmenuShortcutPath
