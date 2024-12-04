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
