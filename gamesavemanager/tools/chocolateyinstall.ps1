﻿  $packageName= 'gamesavemanager'
  $toolsDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
  $url        =  '{{DownloadUrl}}'

  Install-ChocolateyZipPackage 'gamesavemanager' $url $toolsDir
  
  $FileFullPath = get-childitem $toolsDir -Recurse -Filter "gs_mngr*" -include *.exe | select -First 1
    

  Install-ChocolateyShortcut -shortcutFilePath "$env:USERPROFILE\Desktop\GameSave Manager 3.lnk" $FileFullPath