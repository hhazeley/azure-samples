## Azure - VM DSC Test

### Description

This folder in this repository contains steps/information that can be used to test Azure Desire State Configuration (DSC) extension is working on a Windows Azure Virtual Machine. This test script can be deployed using any of the Azure deployment methods, Powershell methods will be demonstrated below. For this test you will need to have a storage account in the same subscription as the Virtual Machine to store the DSC script.

### Steps

#### Powershell 

1.  Download script from GitHub

    ```Powershell
    wget https://raw.githubusercontent.com/hhazeley/azure-samples/master/DSC/azdsctest.ps1 -Method Get -OutFile .\azdsctest.ps1
    ```

    ![Image 1](https://i.imgur.com/mohLtE8.png)

2.  Publish script as configuration

    `Publish-AzVMDscConfiguration .\azdsctest.ps1 -ResourceGroupName <Storage Account RG> -StorageAccountName <Storage Account Name> -Force`
    
    ```Powershell
    Publish-AzVMDscConfiguration .\azdsctest.ps1 -ResourceGroupName "Demo" -StorageAccountName "demowu2str1" -Force
    ```

    ![Image 2](https://i.imgur.com/LCBtrnI.png)

3.  Set DSC on Virtual Machine

    `Set-AzVMDscExtension -ResourceGroupName <VM RG>  -VMName <VM Name>  -ArchiveBlobName "azdsctest.ps1.zip" -ArchiveStorageAccountName <Storage Account Name> -Version <DSC Version> -ConfigurationName "AzDSCTest" -Name "AzureTest"`

    ```Powershell
    Set-AzVMDscExtension -ResourceGroupName "Demo" -VMName "DSCTest" -ArchiveBlobName "azdsctest.ps1.zip" -ArchiveStorageAccountName "demowu2str1" -Version "2.76" -ConfigurationName "AzDSCTest" -Name "AzureTest"
    ```

    ![Image 3](https://i.imgur.com/1TDnTsD.png)


### Result:

Powershell command and output
![Powershell command and output](https://i.imgur.com/1TDnTsD.png)
Portal Result
![Portal Result](https://i.imgur.com/WxN1y7G.png)
VM Result
![VM Result](https://i.imgur.com/lRdlGpW.png)



___

