mkdir C:\AzureTest -ErrorAction SilentlyContinue -WarningAction SilentlyContinue
$date = Date -Format MM-dd-yy
$datetime = Date -Format g
Add-Content -Path C:\AzureTest\$date.log -Value "Log entry created $datetime" -PassThru