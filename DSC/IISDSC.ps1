configuration InstallConfigureIIS
{
    Import-DscResource -ModuleName PSDesiredStateConfiguration

    Node localhost
    {
        $title = "<title>$env:COMPUTERNAME - ITOpsTalk</title>"
        $page = gc "C:\inetpub\wwwroot\iisstart.htm"
        $imgurl = "https://i.imgur.com/N3ZK6b4.png"

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
            $webpage = $webpage -replace "<title>.*</title>","$using:title"
            $webpage = $webpage -replace "iisstart.png","$using:imgurl"
            $webpage | Out-File -FilePath C:\inetpub\wwwroot\iisstart.htm -Force
            }
        TestScript = {
            $test = $using:page -contains $using:title
            return $test
            }
        GetScript = {
            @{'Result' = $using:page -contains $using:title}
            }
        DependsOn = "[WindowsFeature]InstallIIS"
        }
    }
}