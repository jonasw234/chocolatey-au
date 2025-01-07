$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName

$packageArgs = @{
    packageName  = $packageName
    fileType     = 'exe'
    url          = 'https://github.com/xiaoyifang/goldendict-ng/releases/download/v24.09.1-Release.ca9dd133/goldendict-Qt6.7.2.exe'
    checksum     = 'f32247bc31e2766d728035f804b395c3f1e21a8856aa2d38a229145917c3c512'
    checksumType = 'sha256'
    silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
