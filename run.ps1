# Dell Remove
$dell_remove = Get-AppxPackage | Select-String "Dell" | Remove-AppxPackage
$program = Get-WmiObject -Class Win32_Product | Where-Object{$_.Name -eq "Dell Optimizer"}
$program1 = Get-WmiObject -Class Win32_Product | Where-Object{$_.Name -eq "Dell Digital Delivery Services"}
$program2 = Get-WmiObject -Class Win32_Product | Where-Object{$_.Name -eq "Dell SupportAssist OS Recovery Plugin for Dell Update"}
$program3 = Get-WmiObject -Class Win32_Product | Where-Object{$_.Name -eq "Dell SupportAssist Remediation"}
$program4 = Get-WmiObject -Class Win32_Product | Where-Object{$_.Name -eq "Dell Power Manager Service"}
$program5 = Get-WmiObject -Class Win32_Product | Where-Object{$_.Name -eq "DellOptimizerUI"}
$program6 = Get-WmiObject -Class Win32_Product | Where-Object{$_.Name -eq "Dell SupportAssist"}
$program7 = Get-WmiObject -Class Win32_Product | Where-Object{$_.Name -eq "Dell Command | Update for Windows 10"}
$program.Uninstall(); $program1.Uninstall(); $program2.Uninstall(); $program3.Uninstall(); $program4.Uninstall(); $program5.Uninstall(); $program6.Uninstall(); $program7.Uninstall()

Get-AppxPackage | Select-String "Dell" | Remove-AppxPackage

# Remove Copilot
Get-AppxPackage | Select-String "Copilot" | Remove-AppxPackage

# Extra Bloat Removal
Get-AppxPackage | Select-String "Skype" | Remove-AppxPackage

## One Drive Removal ##

New-PSDrive  HKCR -PSProvider Registry -Root HKEY_CLASSES_ROOT
$onedrive = "$env:SYSTEMROOT\SysWOW64\OneDriveSetup.exe"
$ExplorerReg1 = "HKCR:\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}"
$ExplorerReg2 = "HKCR:\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}"
Stop-Process -Name "OneDrive*"
Start-Sleep 2
If (!(Test-Path $onedrive)) {
  $onedrive = "$env:SYSTEMROOT\System32\OneDriveSetup.exe"
}
Start-Process $onedrive "/uninstall" -NoNewWindow -Wait
Start-Sleep 2
 Start-Sleep 1
.\taskkill.exe /F /IM explorer.exe
Start-Sleep 3
Remove-Item "$env:USERPROFILE\OneDrive" -Force -Recurse
Remove-Item "$env:LOCALAPPDATA\Microsoft\OneDrive" -Force -Recurse
Remove-Item "$env:PROGRAMDATA\Microsoft OneDrive" -Force -Recurse
If (Test-Path "$env:SYSTEMDRIVE\OneDriveTemp") {
  Remove-Item "$env:SYSTEMDRIVE\OneDriveTemp" -Force -Recurse
}
If (!(Test-Path $ExplorerReg1)) {
  New-Item $ExplorerReg1
}
Set-ItemProperty $ExplorerReg1 System.IsPinnedToNameSpaceTree -Value 0 
If (!(Test-Path $ExplorerReg2)) {
  New-Item $ExplorerReg2
}
Set-ItemProperty $ExplorerReg2 System.IsPinnedToNameSpaceTree -Value 0
Start explorer.exe -NoNewWindow


