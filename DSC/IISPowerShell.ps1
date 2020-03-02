#Install and update default IIS page 
Install-WindowsFeature -name Web-Server
$webpage = gc "C:\inetpub\wwwroot\iisstart.htm"
$webpage = $webpage -replace "<title>.*</title>","<title>$env:COMPUTERNAME - ITOpsTalk</title>"
$webpage = $webpage -replace "iisstart.png","https://i.imgur.com/N3ZK6b4.png"
$webpage | Out-File -FilePath C:\inetpub\wwwroot\iisstart.htm -Force
