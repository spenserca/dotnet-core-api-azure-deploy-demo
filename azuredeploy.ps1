$resourceGroupName = 'dotnet-core-api-azure-deploy-demo'

New-AzureRmResourceGroup `
    -Name $resourceGroupName `
    -Location 'Central US' `
    -Verbose

New-AzureRmResourceGroupDeployment `
    -ResourceGroupName $resourceGroupName `
    -Mode Complete `
    -TemplateFile '~\Repositories\Personal\GitHub\dotnet-core-api-azure-deploy-demo\azuredeploy.json' `
    -OutVariable deployment `
    -Verbose

if ($deployment.ProvisioningState -ne 'Succeeded') {
    throw 'Deployment of Azure resources failed'
}