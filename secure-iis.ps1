Get-ChildItem cert:\localmachine\My | New-Item -Path IIS:\SslBindings\!443
New-WebBinding -Name "Default Web Site" -Protocol https -Port 443
