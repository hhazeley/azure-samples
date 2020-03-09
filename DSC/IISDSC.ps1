configuration InstallConfigureIIS
{
    Import-DscResource -ModuleName PSDesiredStateConfiguration

    Node localhost
    {
        LocalConfigurationManager
            {
                ConfigurationMode    = "ApplyAndAutoCorrect"
            }

        WindowsFeature InstallIIS
            {
                Name                    = 'Web-Server'
                Ensure                  = 'Present'
            }

        Script ConfigureIIS
            {
        SetScript = {
            $webpage = gc "C:\inetpub\wwwroot\iisstart.htm"
            $webpage = $webpage -replace "<title>.*</title>","<title>$env:COMPUTERNAME - ITOpsTalk</title>"
            $webpage = $webpage -replace "iisstart.png","https://i.imgur.com/N3ZK6b4.png"
            $webpage | Out-File -FilePath C:\inetpub\wwwroot\iisstart.htm -Force
            }
        TestScript = {
            $title = "<title>$env:COMPUTERNAME - ITOpsTalk</title>"
            $page = gc "C:\inetpub\wwwroot\iisstart.htm"
            $test = $page -contains $title
            $test
            }
        GetScript = {
            @{'Result' = (Test-Path "C:\inetpub\wwwroot\iisstart.htm")}
            }
        DependsOn = "[WindowsFeature]InstallIIS"
        }
    }
}