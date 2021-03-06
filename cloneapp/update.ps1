﻿import-module au

#cd .\cloneapp

$releases = 'http://www.mirinsoft.com/index.php/component/jdownloads/viewdownload/39-cloneapp-portable/180-cloneapp?Itemid=235'

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]url32\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^[$]checksum32\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
     }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $content = $download_page.Content

    $pattern = '(?<=align="top"\ width="32"\ height="32")[\S\s]*CloneApp Version:(?<Version>[\d\.]+)'
    $url32 = 'http://mirinsoft.com/index.php/component/jdownloads/finish/39-cloneapp-portable/180-cloneapp?Itemid=235'
    $version = [regex]::Match($content, $pattern).groups['Version'].value
    return @{ URL32 = $url32; Version = $version }
}

update