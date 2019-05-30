#Install and update default IIS page 
Install-WindowsFeature -name Web-Server
$webpage = gc "C:\inetpub\wwwroot\iisstart.htm"
$hostname = $env:COMPUTERNAME
$webpage = $webpage -replace "IIS Windows Server","$hostname - IIS Windows Server"
$webpage | Out-File -FilePath C:\inetpub\wwwroot\iisstart.htm -Force