$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    packageName    = 'titlecase'
    url64Bit       = 'https://github.com/wezm/titlecase/releases/download/v0.10.0/titlecase-v0.10.0-x86_64-pc-windows-msvc.zip'
    checksum64     = '0e3711eafd4beee31ca09c6f013832fc8da54bd32befa3f12b07d8725a4b203e'
    checksumType64 = 'sha256'
    unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
