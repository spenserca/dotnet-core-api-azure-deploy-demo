$resourceGroupName = 'dotnet-core-api-azure-deploy-demo'

Remove-AzureRmResourceGroup `
    -Name $resourceGroupName `
    -Force `
    -Verbose