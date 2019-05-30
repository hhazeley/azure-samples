## Azure - VM Extension Test

### Description

This folder in this repository contains steps/information that can be used to test Azure CustomScript extension is working on a Linux or Windows Azure Virtual Machine. This test script can be deployed using any of the Azure deployment methods, CLI and powershell methods will be demonstrated below.

### Steps

#### Powershell 

```Powershell
Set-AzVMCustomScriptExtension -ResourceGroupName DDemo -VMName DDemo-VM1 `
-FileUri https://raw.githubusercontent.com/hhazeley/azure-samples/master/Extentions/azexttest.ps1 `
-Name AzureTest -Run azexttest.ps1
```
##### Result:

Powershell command and output
![Powershell command and output](https://i.imgur.com/u8oXSOY.png)
Portal Result
![Portal Result](https://i.imgur.com/dAygTio.png)
VM Result
![VM Result](https://i.imgur.com/0Hszy6o.png)



#### CLI

```CLI
az vm extension set --publisher Microsoft.Azure.Extensions --name CustomScript --version 2.0 --vm-name DDemo-VM1-Linux --resource-group DDemo --extension-instance-name AzureTest --settings '{"fileUris": ["https://raw.githubusercontent.com/hhazeley/azure-samples/master/Extentions/azexttest.sh"], "commandToExecute":"./azexttest.sh"}'
```
##### Result:

CLI command and output
![CLI command and output](https://i.imgur.com/lxlstKB.png)
Portal Result
![Portal Result](https://i.imgur.com/tQCuBM6.png)
VM Result
![VM Result](https://i.imgur.com/wQ5JAtE.png)

___

