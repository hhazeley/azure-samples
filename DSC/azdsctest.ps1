Configuration AzDSCTest
{
    Import-DscResource -ModuleName 'PSDesiredStateConfiguration'

    Node localhost
    {
        Script AzDSCTest
        {
            SetScript = {
                mkdir C:\AzureTest -ErrorAction SilentlyContinue -WarningAction SilentlyContinue
                wget https://raw.githubusercontent.com/hhazeley/azure-samples/master/Extentions/azexttest.ps1 -Method Get -OutFile C:\AzureTest\azdsctest.ps1
                C:\AzureTest\azdsctest.ps1
}
            TestScript = { Test-Path "C:\AzureTest\azdsctest.ps1" }
            GetScript = { @{ Result = (C:\AzureTest\azdsctest.ps1) } }
        }
    }
}

AzDSCTest