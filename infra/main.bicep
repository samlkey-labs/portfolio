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

@description('Name of the Azure Communication Services resource used by the contact form.')
param communicationServiceName string

@description('Name of the ACS Email service.')
param emailServiceName string

@description('Where ACS stores data at rest.')
param communicationDataLocation string = 'UK'

@description('Inbox that contact form messages are delivered to.')
param contactRecipient string

param tags object = {
  app: appName
  environment: env
  managedBy: 'bicep'
}

resource rg 'Microsoft.Resources/resourceGroups@2024-03-01' existing = {
  name: resourceGroupName
}

module comms 'modules/communication.bicep' = {
  scope: rg
  name: 'communication'
  params: {
    emailServiceName: emailServiceName
    communicationServiceName: communicationServiceName
    dataLocation: communicationDataLocation
    tags: tags
  }
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
    communicationServiceName: comms.outputs.communicationServiceName
    contactSender: comms.outputs.senderAddress
    contactRecipient: contactRecipient
  }
}

output resourceGroupName string = rg.name
output staticWebAppName string = swa.outputs.name
output defaultHostname string = swa.outputs.defaultHostname
