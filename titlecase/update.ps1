Import-Module Chocolatey-AU
. $PSScriptRoot\..\_scripts\all.ps1

$releases = 'https://api.github.com/repos/wezm/titlecase/releases/latest'

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url64bit\s*=\s*)('.*')"   = "`$1'$($Latest.URL64)'"
            "(?i)(^\s*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
    }
}

function global:au_GetLatest {
    $AllProtocols = [System.Net.SecurityProtocolType]'Tls11,Tls12'
    [System.Net.ServicePointManager]::SecurityProtocol = $AllProtocols

    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

    $re = 'https://.+/.+-windows-msvc.zip'
    $body = ($download_page.Content | ConvertFrom-Json).body
    $body -match $re
    $url64 = $matches[0]
    $version = $url64 -split '[-]|.zip' | Select-Object -First 1 -Skip 1
    $version = $version.substring(1)

    @{
        Version = $version
        URL64   = $url64
    }
}

Update-Package -ChecksumFor 64
