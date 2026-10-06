targetScope = 'subscription'

@description('Name of the existing resource group to deploy into.')
param resourceGroupName string

@description('Name of the Static Web App.')
param staticWebAppName string

@description('Short name used for tagging.')
param appName string = 'portfolio'

@description('Environment suffix, e.g. prod or dev.')
param env string = 'prod'

@description('Static Web Apps is only offered in a few regions (not UK). Content is served globally regardless.')
@allowed([
  'centralus'
  'eastus2'
  'westus2'
  'westeurope'
  'eastasia'
])
param swaLocation string = 'eastus2'

@allowed([
  'Free'
  'Standard'
])
param sku string = 'Free'

@description('Optional custom domain, e.g. www.example.com. Leave empty to skip. The CNAME must already point at the default hostname.')
param customDomain string = ''

param tags object = {
  app: appName
  environment: env
  managedBy: 'bicep'
}

resource rg 'Microsoft.Resources/resourceGroups@2024-03-01' existing = {
  name: resourceGroupName
}

module swa 'modules/staticWebApp.bicep' = {
  scope: rg
  name: 'staticWebApp'
  params: {
    name: staticWebAppName
    location: swaLocation
    sku: sku
    customDomain: customDomain
    tags: tags
  }
}

output resourceGroupName string = rg.name
output staticWebAppName string = swa.outputs.name
output defaultHostname string = swa.outputs.defaultHostname
