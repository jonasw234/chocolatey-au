$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName

$packageArgs = @{
    packageName    = $packageName
    fileType       = 'msi'
    url            = 'https://github.com/Suwayomi/Suwayomi-Server-preview/releases/download/v1.1.1-r1599/Suwayomi-Server-v1.1.1-r1599-windows-x86.msi'
    checksum       = '401797d4913edac889641c3db1fc885b70c97e0c9109600f8687404f1ec5df6f'
    checksumType   = 'sha256'
    url64bit       = 'https://github.com/Suwayomi/Suwayomi-Server-preview/releases/download/v1.1.1-r1651/Suwayomi-Server-v1.1.1-r1651-windows-x64.msi'
    checksum64     = 'fb8249500e8874e797b438a799d636504334357f36d7dad8cf87a233fdfb8445'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
}

Install-ChocolateyPackage @packageArgs
