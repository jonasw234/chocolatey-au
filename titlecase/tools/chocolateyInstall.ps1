$ErrorActionPreference = 'Stop';

$toolsPath   = Split-Path $MyInvocation.MyCommand.Definition
$download_dir = "$Env:TEMP\chocolatey\$packageName\$Env:ChocolateyPackageVersion"

$packageArgs = @{
  packageName    = 'titlecase'
  url32Bit       = 'https://github.com/wezm/titlecase/releases/download/v0.10.0/titlecase-v0.10.0-i686-pc-windows-msvc.zip'
  checksum32     = '2f69c67f25d0f4e4e1b1123ea37a6be724443bb62d3b3ebc1e4757199e6c5182'
  checksumType32 = 'sha256'
  url64Bit       = 'https://releases.wezm.net/titlecase/v3.3.0/titlecase-v3.3.0-x86_64-pc-windows-msvc.zip'
  checksum64     = '0db8f889d98f11d32cd0298c7e7a4681e1b2ab2fb6477f8cf5e4051153d5f622'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
