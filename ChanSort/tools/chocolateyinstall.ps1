﻿$ErrorActionPreference = 'Stop'

$packageName = 'ChanSort'
$url32       = 'https://github.com/PredatH0r/ChanSort/releases/download/v2016-08-10/ChanSort_2016-08-10.zip'
$checksum32  = ''
$toolsPath   = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $packageName
  url            = $url32
  checksum       = $checksum32
  checksumType   = 'sha256'
  unzipLocation  = $toolsPath
}
Install-ChocolateyZipPackage @packageArgs

$FileFullPath = get-childitem $toolsPath -recurse -include *.exe | select -First 1
  
Install-ChocolateyShortcut -shortcutFilePath "$env:ALLUSERSPROFILE\Microsoft\Windows\Start Menu\Programs\ChanSort.lnk" $FileFullPath
