param name string
param location string
param sku string
param customDomain string
param tags object

@description('Communication Services resource the contact form API sends email through.')
param communicationServiceName string
param contactSender string
param contactRecipient string

resource staticSite 'Microsoft.Web/staticSites@2023-12-01' = {
  name: name
  location: location
  tags: tags
  sku: {
    name: sku
    tier: sku
  }
  properties: {
    // Content is deployed by GitHub Actions using the deployment token,
    // so the repo link is intentionally left unset here.
    stagingEnvironmentPolicy: 'Enabled'
    allowConfigFileUpdates: true
  }
}

resource domain 'Microsoft.Web/staticSites/customDomains@2023-12-01' = if (!empty(customDomain)) {
  parent: staticSite
  name: empty(customDomain) ? 'placeholder' : customDomain
  properties: {
    validationMethod: 'cname-delegation'
  }
}

resource communicationService 'Microsoft.Communication/communicationServices@2023-04-01' existing = {
  name: communicationServiceName
}

// Settings for the managed Functions API in /api
resource appSettings 'Microsoft.Web/staticSites/config@2023-12-01' = {
  parent: staticSite
  name: 'appsettings'
  properties: {
    ACS_CONNECTION_STRING: communicationService.listKeys().primaryConnectionString
    CONTACT_SENDER: contactSender
    CONTACT_RECIPIENT: contactRecipient
  }
}

output name string = staticSite.name
output defaultHostname string = staticSite.properties.defaultHostname
