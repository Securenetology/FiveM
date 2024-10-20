#Backsup FiveM Settings
#Created by Dax : 03302024
#Updated by Dax : 06282024

#Set Varibales for Script

#Set Varibale for desktop
$DesktopPath = [Environment]::GetFolderPath("Desktop")

#Set Varibale for AppData Roaming
$AppDataRoaming = $env:APPDATA

#Set Varibale for AppData Local
$AppDataLocal = $env:LOCALAPPDATA

#Set Varibale for time
$Date = Get-Date -UFormat "%m.%d.%Y"

#Set Varibale for Date and Time
$DateTime = Get-Date -Format "dddd MM/dd/yyyy HH:mm"

#Set Variable for GTA V Custom Sound Location
$Sounds = "C:\Program Files (x86)\Steam\steamapps\common\Grand Theft Auto V\x64\audio\sfx"

#Set Variable for FiveM Mod location
$Mods = "$AppDataLocal\FiveM\FiveM.app\mods"

#Set Variable for FiveM plugin location
$Plugins = "$AppDataLocal\FiveM\FiveM.app\plugins"

#Set Variable for CitizenFX.ini
$CitizenFX = "$AppDataLocal\FiveM\FiveM.app\CitizenFX.ini"

#Display operation message
Write-Host "Begining Backup Operation" -ForegroundColor Green -BackgroundColor DarkMagenta

#Create Backup Folder
New-Item -Path "$DesktopPath" -Name "FiveM-Config-Backup-$Date" -ItemType Directory | Out-Null
Write-Host "Creating Folder for Backup Operations" -ForegroundColor Green -BackgroundColor DarkMagenta

#Set Varibale for Backup Path
$BackupLocation = "$DesktopPath\FiveM-Config-Backup-$Date"

#Backup Citizen FX Directory (Contains keybinds, GTA Settings, etc. )
Copy-Item -Path "$AppDataRoaming\CitizenFX" -Destination "$BackupLocation" -Recurse | Out-Null
Write-Host "CitizenFX has been backed up to $BackupLocation" -ForegroundColor Green -BackgroundColor DarkMagenta

#Backup Custom Sound Packs
Copy-Item -Path "$Sounds" -Destination "$BackupLocation" -Recurse | Out-Null
Write-Host "Custom Sounds have been backed up to $BackupLocation" -ForegroundColor Green -BackgroundColor DarkMagenta

#Backup Mods
Copy-Item -Path "$Mods" -Destination "$BackupLocation" -Recurse | Out-Null
Write-Host "Custom Sounds have been backed up to $BackupLocation" -ForegroundColor Green -BackgroundColor DarkMagenta

#Backup plugins
Copy-Item -Path "$Plugins" -Destination "$BackupLocation" -Recurse | Out-Null
Write-Host "Custom Sounds have been backed up to $BackupLocation" -ForegroundColor Green -BackgroundColor DarkMagenta

#Backup CitizenFX.ini
Copy-Item -Path "$CitizenFX" -Destination "$BackupLocation" -Recurse | Out-Null
Write-Host "CitizenFX.ini has been backed up to $BackupLocation" -ForegroundColor Green -BackgroundColor DarkMagenta

#Create shortcuts for quick connect when restored
$TargetFile = "$env:LOCALAPPDATA\FiveM\FiveM.exe"
$ShortcutFile = "$BackupLocation\FiveM - NERP.ink"
$WScriptShell = New-Object -ComObject WScript.Shell
$Shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$Shortcut.TargetPath = $TargetFile
#Set the additional parameters for the shortcut  
$Shortcut.Arguments = "/argument=-pure_1  +connect join.newenergyrp.com"
$Shortcut.Save()
Write-Host "Shortcuts have been created for quick connect at $BackupLocation" -ForegroundColor Green -BackgroundColor DarkMagenta

#Write complete message
Write-Host "All files have been backed up to $BackupLocation on $DateTime" -ForegroundColor Green -BackgroundColor DarkMagenta


# Refrence for restore operations


# Sound Folder GTA V : = "C:\Program Files (x86)\Steam\steamapps\common\Grand Theft Auto V\x64\audio\sfx

# Mods, Plugins and CitizenFX.ini : C:\Users\CYoung\AppData\Local\FiveM\FiveM.app

# Backup Citizen FX Directory : C:\Users\CYoung\AppData\Roaming\CitizenFX
