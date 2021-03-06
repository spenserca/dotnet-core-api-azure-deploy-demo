﻿param(
  [string]$pathToDrop,
  [string]$resourceGroupName
)

# Create Azure resource group
New-AzureRmResourceGroup `
    -Name $resourceGroupName `
    -Location 'Central US' `
    -Force `
    -Verbose

# Create Azure resource group deployment
# This will create the infrastructure described
# in azuredeploy.json to host the application
New-AzureRmResourceGroupDeployment `
    -ResourceGroupName $resourceGroupName `
    -Mode Complete `
    -TemplateFile "$($pathToDrop)/azuredeploy.json" `
    -OutVariable deployment `
    -Force `
    -Verbose

if ($deployment.ProvisioningState -ne 'Succeeded') {
    throw 'Deployment of Azure resources failed'
}
#
## Get credentials to deploy the zip file
#$publishingCredentials = Invoke-AzureRmResourceAction `
#    -ResourceGroupName $resourceGroupName `
#    -ResourceType Microsoft.Web/sites/config `
#    -ResourceName "$($resourceGroupName)/publishingcredentials" `
#    -Action list `
#    -ApiVersion 2015-08-01 `
#    -Force `
#    -Verbose
#
## Deploy the zip to the ondeck slot
#$username = $publishingCredentials.properties.publishingUserName
#$password = $publishingCredentials.properties.publishingPassword
#$filePath = "$($pathToDrop)/HelloWorld.zip"
#$apiUrl = "https://$($resourceGroupName).scm.azurewebsites.net/api/zipdeploy"
#$base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(("{0}:{1}" -f $username, $password)))
#$userAgent = "powershell/1.0"
#Invoke-RestMethod `
#    -Uri $apiUrl `
#    -Headers @{Authorization=("Basic {0}" -f $base64AuthInfo)} `
#    -UserAgent $userAgent `
#    -Method POST `
#    -InFile $filePath `
#    -ContentType "multipart/form-data" `
#    -Verbose

# Run integration tests

# Swap slots
