param name string
param location string
param sku string
param customDomain string
param tags object

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

output name string = staticSite.name
output defaultHostname string = staticSite.properties.defaultHostname
